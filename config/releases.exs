import Config

secret_key_base = System.fetch_env!("SECRET_KEY_BASE")
application_port = System.fetch_env!("APP_PORT")
pool_size = System.fetch_env!("POOL_SIZE")
username = System.fetch_env!("DBUSER")
password = System.fetch_env!("DBPWRD")
database = System.fetch_env!("DBNAME")
hostname = System.fetch_env!("DBHOST")
urlhost = System.fetch_env!("URLHOST")

# database_url =
#   System.get_env("DATABASE_URL") ||
#     raise """
#     environment variable DATABASE_URL is missing.
#     For example: ecto://USER:PASS@HOST/DATABASE
#     """

config :ticket, Ticket.Repo,
  # ssl: true,
  migration_primary_key: [name: :id, type: :binary_id],
  show_sensitive_data_on_connection_error: true,
  username: username,
  password: password,
  database: database,
  hostname: hostname,
  # url: database_url,da
  pool_size: String.to_integer(pool_size || "10")

config :ticket, TicketWeb.Endpoint,
  http: [:inet6, port: String.to_integer(application_port)],
  secret_key_base: secret_key_base,
  url: [host: urlhost, port: String.to_integer(application_port)]

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
#     config :ticket, TicketWeb.Endpoint, server: true
#
# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.
