# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RealTimeChat.Repo.insert!(%RealTimeChat.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias RealTimeChat.Accounts.User
alias RealTimeChat.Chat.ChatRoom
alias RealTimeChat.Chat.Message
alias RealTimeChat.Repo

Repo.insert!(%User{name: "Ryan Swapp", email: "ryan@ryan.com"})
Repo.insert!(%User{name: "Rosie", email: "rosie@mydog.com"})

Repo.insert!(%ChatRoom{title: "GraphQl Chat", user_id: 1})
Repo.insert!(%ChatRoom{title: "My second chat", user_id: 2})

for _ <- 1..10 do
  Repo.insert!(%Message{
    body: Faker.Lorem.paragraph,
    user_id: [1, 2] |> Enum.take_random(1) |> hd,
    chat_room_id: [1, 2] |> Enum.take_random(1) |> hd
  })
end