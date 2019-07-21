# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dispatcher,
  ecto_repos: [Dispatcher.Repo]

# Configures the endpoint
config :dispatcher, DispatcherWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0BitEfIc8/SB+4cy57NcUC3LatbYdtPkW7VwuALtLPmGl79IQsG6gPN3PMlnrK8k",
  render_errors: [view: DispatcherWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Dispatcher.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
