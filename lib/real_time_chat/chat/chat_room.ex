defmodule RealTimeChat.Chat.ChatRoom do
  use Ecto.Schema
  import Ecto.Changeset
  alias RealTimeChat.Chat.ChatRoom


  schema "chat_rooms" do
    field :title, :string
    belongs_to :user, RealTimeChat.Accounts.User, foreign_key: :user_id
    has_many :messages, RealTimeChat.Chat.Message

    timestamps()
  end

  @doc false
  def changeset(%ChatRoom{} = chat_room, attrs) do
    chat_room
    |> cast(attrs, [:title, :user_id])
    |> validate_required([:title, :user_id])
  end
end
