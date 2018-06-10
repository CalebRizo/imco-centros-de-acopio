use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :imco_centros_de_acopio, ImcoCentrosDeAcopioWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :imco_centros_de_acopio, ImcoCentrosDeAcopio.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "imco_centros_de_acopio_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
