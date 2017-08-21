defmodule RealTimeChat.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: RealTimeChat.Repo

  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
    field :messages, list_of(:message), resolve: assoc(:messages)
    field :chat_rooms, list_of(:chat_room), resolve: assoc(:chat_rooms)
  end

  object :chat_room do
    field :id, :id
    field :title, :string
    field :user, :user, resolve: assoc(:user)
    field :messages, list_of(:message), resolve: assoc(:messages)
  end

  object :message do
    field :id, :id
    field :body, :string
    field :user, :user, resolve: assoc(:user)
    field :chat_room, :chat_room, resolve: assoc(:chat_room)
  end

  input_object :message_input do
    field :user_id, non_null(:id)
    field :chat_room_id, non_null(:id)
    field :body, non_null(:string)
  end
end