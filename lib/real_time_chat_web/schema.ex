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
#      arg :body, non_null(:string)
#      arg :user_id, non_null(:id)
#      arg :chat_room_id, non_null(:id)
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
end