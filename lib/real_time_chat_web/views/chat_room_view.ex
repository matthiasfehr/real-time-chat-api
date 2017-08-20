defmodule RealTimeChatWeb.ChatRoomView do
  use RealTimeChatWeb, :view
  alias RealTimeChatWeb.ChatRoomView

  def render("index.json", %{chat_rooms: chat_rooms}) do
    %{data: render_many(chat_rooms, ChatRoomView, "chat_room.json")}
  end

  def render("show.json", %{chat_room: chat_room}) do
    %{data: render_one(chat_room, ChatRoomView, "chat_room.json")}
  end

  def render("chat_room.json", %{chat_room: chat_room}) do
    %{id: chat_room.id,
      title: chat_room.title}
  end
end
