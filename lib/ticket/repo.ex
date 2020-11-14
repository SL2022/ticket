defmodule Ticket.Repo do
  use Ecto.Repo,
    otp_app: :ticket,
    adapter: Ecto.Adapters.Postgres
end
