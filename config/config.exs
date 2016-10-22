# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :next_api,
  ecto_repos: [NextApi.Repo]

# Configures the endpoint
config :next_api, NextApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AkGbnAN9xzC514k3nrrdpaiu7BnpWY+LiIBpbYlN/d1N9Nm6/q2MQiCugVjsutzZ",
  render_errors: [view: NextApi.ErrorView, accepts: ~w(json)],
  pubsub: [name: NextApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "NextApi",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: "my secret key",
  serializer: NextApi.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
