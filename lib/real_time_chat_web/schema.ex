defmodule RealTimeChat.Schema do
  use Absinthe.Schema
  import_types RealTimeChat.Schema.Types

  query do
    field :messages, list_of(:message) do
      resolve &RealTimeChat.Chat.MessageResolver.all/2
    end

    field :users, list_of(:user) do
      resolve &RealTimeChat.Accounts.UserResolver.all/2
    end

    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &RealTimeChat.Accounts.UserResolver.find/2
    end

    field :chat_rooms, list_of(:chat_room) do
      resolve &RealTimeChat.Chat.ChatRoomResolver.all/2
    end

    field :chat_room, type: :chat_room do
      arg :id, non_null(:id)
      resolve &RealTimeChat.Chat.ChatRoomResolver.find/2
    end
  end

  mutation do
    field :create_message, type: :message do
      arg :message_input, non_null(:message_input)

      resolve &RealTimeChat.Chat.MessageResolver.create/2
    end

    field :create_chat_room, type: :chat_room do
      arg :title, non_null(:string)
      arg :user_id, non_null(:id)

      resolve &RealTimeChat.Chat.ChatRoomResolver.create/2
    end

    field :create_user, type: :user do
      arg :name, non_null(:string)
      arg :email, non_null(:string)

      resolve &RealTimeChat.Accounts.UserResolver.create/2
    end
  end

  subscription do
    field :message_added, :message do
      arg :chat_room_id, non_null(:id)

      topic &(String.to_integer(&1.chat_room_id))

#      This is the shorthand function for this:
#      topic fn args ->
#        String.to_integer(args.chat_room_id)
#      end

#      Trigger does not work when mutation is done over websocket, so it is commented out here
#      trigger :create_message, topic: &(&1.chat_room_id)

#      Shorthand for:
#      trigger :create_message, topic: fn message ->
#        message.chat_room_id
#      end
    end
  end
end