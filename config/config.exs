# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :district_finder_backend,
  namespace: DistrictFinder,
  ecto_repos: [DistrictFinder.Repo]

# Configures the endpoint
config :district_finder_backend, DistrictFinder.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "s3HLWGGZigLXWE1TmTU30orxw8J6CN18rIL3hdCd1t7dP90Yvuh03Tk4RwC0z06H",
  render_errors: [view: DistrictFinder.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DistrictFinder.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


config :phoenix, :format_encoders,
  "json-api": Poison

config :plug, :mimes, %{
  "application/vnd.api+json" => ["json-api"]
}

config :phoenix, :serve_endpoints, true

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
