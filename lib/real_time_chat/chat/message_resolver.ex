defmodule RealTimeChat.Chat.MessageResolver do
  alias RealTimeChat.{Chat.Message, Repo}

  def all(_args, _info) do
    {:ok, Repo.all(Message)}
  end

  def create(args, _info) do
    with {:ok, %Message{} = message} <- RealTimeChat.Chat.create_message(args.message_input) do
#     Publish to subscriptions manually (since trigger in schema doesn't work for websocket mutations)
      Absinthe.Subscription.publish(RealTimeChatWeb.Endpoint, message, [message_added: message.chat_room_id])
      {:ok, message}
    end
  end
end