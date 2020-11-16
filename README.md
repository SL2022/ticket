# Ticket
A ticket handling system implemented using Elixir/Phoenix Liveview

To start your local version of Ticket:

  * Install Docker for your platform
  * Fork this repo
  * Clone it (from your profile) onto your local machine
  * Change into the ticket folder `cd ticket`
  * Install Node.js dependencies in the assets folder, with `npm --prefix=assets install` 
  * Make a folder for that PostgreSQL data, with `mkdir -p priv/pgdata`
  * Start a PostgreSQL container `docker-compose -d up`
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or if you prefer the prompt `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Need to make sure tests are good? Run `mix test` and all acceptance/system tests with `mix cypress.open`

Ready to run in production? --wip--

## Learn more
Ticket was built with the PETAL stack (Postgres, Elixir/Phoenix, Tailwind, AlpineJS, Liveview), and acceptance tests done with Cypress - here are som links for your browsing convenience:

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
  * Cypress: https://docs.cypress.io/guides/overview/why-cypress.html

PETAL stack, C.f. @ThinkingElixir