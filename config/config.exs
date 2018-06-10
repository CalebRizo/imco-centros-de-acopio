# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :imco_centros_de_acopio,
  ecto_repos: [ImcoCentrosDeAcopio.Repo]

# Configures the endpoint
config :imco_centros_de_acopio, ImcoCentrosDeAcopioWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8f/XVPr7POZn+pQMI7W92T7IPYD5jb0yZ+PbiZsZkbnPu0sZI7+Cb+sPwmMnuR7k",
  render_errors: [view: ImcoCentrosDeAcopioWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ImcoCentrosDeAcopio.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
