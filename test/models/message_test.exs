defmodule RealTimeChat.MessageTest do
  use RealTimeChat.ModelCase

  alias RealTimeChat.Message

  @valid_attrs %{body: "some body", type: "some type"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Message.changeset(%Message{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Message.changeset(%Message{}, @invalid_attrs)
    refute changeset.valid?
  end
end
