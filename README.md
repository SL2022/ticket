# Ticket
A ticket handling system implemented using Elixir/Phoenix Liveview

## Getting things going at your own place

To start your local version of Ticket:

  * Install Docker for your platform
  * Fork this repo
  * Clone it (from your profile) onto your local machine
  * Change into the ticket folder `cd ticket`
  * Install Node.js dependencies in the assets folder, with `npm --prefix=assets install` 
  * Install Cypress - for testing acceptance tests, with `npm --prefix=assets install cypress --save-dev`
  * Make a folder for that PostgreSQL data, with `mkdir -p priv/pgdata`
  * Start a PostgreSQL container `docker-compose -d up`
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or if you prefer the prompt `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Need to make sure tests are good? Run `mix test` and all acceptance/system tests with `mix cypress.open` (but make sure your local application server - `iex -S mix phx.server` is running)

Looking for documentation? Fret not - `mix docs` - and then `open doc/index.html`

## Ready to go to war?
Do you feel Ticket has what it takes to provide for your situation?

  * [Install Dokku](http://dokku.viewdocs.io/dokku~v0.21.4/getting-started/installation/) on a server - that sounds a lot easier than it is (particularly if it's a reinstall!)
  * Create an app-server, with `dokku apps:create almanaq.guru` (at the CLI of the server)
  * Add a remote to your repo, with `git remote add almanaq.guru dokku@docker1.alco.dk:almanaq.guru`
  * Add a database plugin, with `dokku plugin:install https://github.com/dokku/dokku-postgres.git` (only if the app requires its own database - at the CLI of the server)
  * Create a database using this plugin, with `dokku postgres:create almanaq_prod` (still only if required - and still at the CLI of the server )
  * Link the two together, with `dokku postgres:link almanaq_prod almanaq.guru` (still at the CLI of the server)
  * Push the repo, with `git push almanaq.guru main:master` (as master is the required branch to deploy to)
  * Add a SSL plugin, with `dokku plugin:install https://github.com/dokku/dokku-letsencrypt.git` (at the CLI of the server)
  * Configure the email for the domain, with `dokku config:set --no-restart almanaq.guru DOKKU_LETSENCRYPT_EMAIL=walther@alco.dk` (at the CLI of the server)
  * Set the SSL for the almanaq.guru domain, with `dokku letsencrypt almanaq.guru`
  
Wondering what the app.json in the root of the repo does? It's taking care of any `mix ecto.migrate`to be executed on the server!

```
 !     Postdeploy command declared: 'mix ecto.migrate'
       09:19:12.459 [info]  Migrations already up
-----> Shutting down old containers in 60 seconds
       28d5038364571538b9abef0abd1c243ef89f880fc90f9b1241188eb12e8b9c45
=====> Application deployed:
       http://almanaq.guru
       https://almanaq.guru
```

That was 12 terrifying hours - mixed with 4hrs sleep :o
## Contributing
We'd really like you to chip in!

This is what we believe to be the best workflow for you to follow:

1. Get things going at your own place (follow the list above)
2. Find an issue to work on - or suggest an issue yourself, and appoint it to yourself
3. Set a remote to point to SL2022/ticket (it's a onetime job) with `git remote add ticket https://github.com/SL2022/ticket.git`
4. Start with pulling the latest main, with `git fetch ticket`
5. Checkout you own main with `git checkout main`
6. Merge the current latest with `git merge ticket/main`
7. Resolve any conflicts - if any - and commit with something like "solved issues with xxx'
8. Checkout a new branch for this issue with `git checkout -b what_the_issue_is_about_in_a_word_or_two`
9.  Do your magic with `code .`, `emacs`, `vi`, or whatever
10. Add documentation to modules, indoc test examples, and more
11. Add tests to cover what you do
12. Make sure to break no tests with `mix test` staying green
13. Add your changes with `git add some_file*`
14. Commit the changes with `git commit -m 'what the issue is about in a few (10) words'`
15. Checkout your main with `git checkout main`
16. Merge your changes into your own "copy" with `git merge what_the_issue_is_about_in_a_word_or_two`
17. Make sure all tests are staying green with `mix test` 
18. Push your main to your repo
19. Go to your repo (on github.com) and press the "Pull request"
20. Motivate the PR - and create it.

Thank you very much from all of the Almanaq Team


## Learn more
Ticket was built with the PETAL stack (Postgres, Elixir/Phoenix, Tailwind, AlpineJS, Liveview), and acceptance tests done with Cypress - here are som links for your browsing convenience:

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
  * Cypress: https://docs.cypress.io/guides/overview/why-cypress.html
  * AlpineJS https://github.com/alpinejs/awesome-alpine
  * AlpineJS https://blog.logrocket.com/getting-started-with-alpine-js/
  * AlpineJS https://www.freecodecamp.org/news/learn-alpine-js-in-this-free-tutorial-course/


PETAL stack, C.f. @ThinkingElixir