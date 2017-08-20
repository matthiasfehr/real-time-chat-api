defmodule RealTimeChat.Chat.ChatRoomResolver do
  alias RealTimeChat.{Chat.ChatRoom, Repo}

  def all(_args, _info) do
    {:ok, Repo.all(ChatRoom)}
  end

  def find(%{id: id}, _info) do
    case Repo.get(ChatRoom, id) do
      nil -> {:error, "ChatRoom id #{id} not found"}
      chat_room -> {:ok, chat_room}
    end
  end
end