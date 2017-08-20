# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :real_time_chat,
  ecto_repos: [RealTimeChat.Repo]

# Configures the endpoint
config :real_time_chat, RealTimeChatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SrVCSrnqadySK55SoukHG2V05IXtU295Osqj3n1/YLePmtGBaSRY5fAqPWl3IP+G",
  render_errors: [view: RealTimeChatWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RealTimeChat.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
