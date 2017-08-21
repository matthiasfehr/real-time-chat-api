defmodule RealTimeChat.Chat.MessageResolver do
  alias RealTimeChat.{Chat.Message, Repo}

  def all(_args, _info) do
    {:ok, Repo.all(Message)}
  end

  def create(args, _info) do
    {message_args, _} = Map.pop(args, :message_input)
    %Message{}
    |> Message.changeset(message_args)
    |> Repo.insert
  end
end