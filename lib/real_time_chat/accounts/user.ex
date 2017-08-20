defmodule RealTimeChat.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias RealTimeChat.Accounts.User


  schema "users" do
    field :email, :string
    field :name, :string
    has_many :messages, RealTimeChat.Chat.Message
    has_many :chat_rooms, RealTimeChat.Chat.ChatRoom

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
  end
end
