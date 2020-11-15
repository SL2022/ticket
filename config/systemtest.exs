# /config/systemtest.exs

use Mix.Config

# Configure your database
config :ticket, Ticket.Repo,
  username: "postgres",
  password: "secret",
  database: "ticket_systemtest",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# We don't run a server during test, but we need it for systemtest!
config :ticket, TicketWeb.Endpoint,
  http: [port: 5000],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn
