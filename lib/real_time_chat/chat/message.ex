defmodule RealTimeChat.Chat.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias RealTimeChat.Chat.Message


  schema "messages" do
    field :body, :string
    belongs_to :chat_room, RealTimeChat.Chat.ChatRoom, foreign_key: :chat_room_id
    belongs_to :user, RealTimeChat.Accounts.User, foreign_key: :user_id

    timestamps()
  end

  @doc false
  def changeset(%Message{} = message, attrs) do
    message
    |> cast(attrs, [:body, :chat_room_id, :user_id])
    |> validate_required([:body, :chat_room_id, :user_id])
  end
end
