# Ticket
A ticket handling system implemented using Elixir/Phoenix Liveview

To start your local version of Ticket:

  * Install Docker for your platform
  * Fork this repo
  * Clone it (from your profile) onto your local machine
  * Change into the ticket folder `cd ticket`
  * Install Node.js dependencies in the assets folder, with `npm --prefix=assets install` 
  * Start a PostgreSQL container `docker-compose -d up`
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
