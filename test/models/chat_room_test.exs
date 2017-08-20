defmodule RealTimeChat.ChatRoomTest do
  use RealTimeChat.ModelCase

  alias RealTimeChat.ChatRoom

  @valid_attrs %{title: "some title"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ChatRoom.changeset(%ChatRoom{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ChatRoom.changeset(%ChatRoom{}, @invalid_attrs)
    refute changeset.valid?
  end
end
