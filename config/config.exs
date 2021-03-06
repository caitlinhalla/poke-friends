# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :friend, Friend.Repo,
  database: "friend_repo",
  username: "user",
  password: "pass",
  hostname: "localhost"

config :friend,
  ecto_repos: [Friend.Repo]

# Configures the endpoint
config :friend, FriendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DYFTRHVi7xYxtbUbZClEs38QGREvY5r0cLwSiHrlDXULU8DiCmOcnF26dvDGieG6",
  render_errors: [view: FriendWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Friend.PubSub, adapter: Phoenix.PubSub.PG2],
  instrumenters: [NewRelic.Phoenix.Instrumenter]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure New Relic
config :new_relic_agent,
  app_name: System.get_env("NEW_RELIC_APP_NAME"),
  license_key: System.get_env("NEW_RELIC_LICENSE_KEY")

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
