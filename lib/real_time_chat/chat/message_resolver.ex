defmodule RealTimeChat.Chat.MessageResolver do
  alias RealTimeChat.{Chat.Message, Repo}

  def all(_args, _info) do
    {:ok, Repo.all(Message)}
  end

  def create(args, _info) do
    %Message{}
    |> Message.changeset(args)
    |> Repo.insert
  end
end