defmodule RealTimeChat.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :body, :text
      add :user_id, references(:users, on_delete: :nothing)
      add :chat_room_id, references(:chat_rooms, on_delete: :nothing)

      timestamps()
    end

    create index(:messages, [:user_id])
    create index(:messages, [:chat_room_id])
  end
end
