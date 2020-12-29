# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_hotwire,
  ecto_repos: [PhoenixHotwire.Repo]

# Configures the endpoint
config :phoenix_hotwire, PhoenixHotwireWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "sXW2wuuJpuwxV/cpw+PuU+MgEYK8oBZH/G0gB94AAH6f8lMaTct/rmtr1qZPmU84",
  render_errors: [view: PhoenixHotwireWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhoenixHotwire.PubSub,
  live_view: [signing_salt: "1Be3qQEA"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
