use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :real_time_chat, RealTimeChatWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :real_time_chat, RealTimeChat.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "real_time_chat_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
