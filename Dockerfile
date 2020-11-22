# BUILD STAGE
FROM bitwalker/alpine-elixir-phoenix:latest AS phx-builder

RUN apk add --update yarn

ARG mix_env=prod
ARG hex_mirror_url=https://repo.hex.pm

# Set envs
# DATABASE_URL=ecto://postgres:postgres@postgres/dev_db \
ENV NODE_ENV=${mix_env} \
  MIX_ENV=${mix_env} \
  APP_PORT=5000 \
  POOL_SIZE=10 \
  SECRET_KEY_BASE=dyhnmj9oklo0ok7y64332w2excvbhnkmlæ.æ-æp098uuikuygyhgfdw2123esdr5tghy78uhjki \
  DBUSER="postgres" \
  DBPWRD="postgres" \
  DBNAME="almanaq_prod" \
  DBHOST="localhost" \
  URLHOST="almanaq.guru" \
  DB_URL="postgres://postgres:523f712e4a530654a470064524813e43@dokku-postgres-almanaq-prod:5432/almanaq_prod" \
  HEX_MIRROR_URL=${hex_mirror_url} 

# EXPOSE 5000 - handled by Dokku !
WORKDIR /app

COPY . .
RUN mix do deps.get, deps.compile
# RUN npm install --prefix assets && \
#   npm rebuild node-sass --prefix assets && \
#   npm --prefix ./assets ci --progress=false --no-audit --loglevel=error

# RUN npm run --prefix ./assets deploy
RUN yarn --cwd assets --force && \
  npm rebuild node-sass --prefix assets --update-binary && \
  yarn --cwd assets run deploy
RUN mix phx.digest





# # Cache elixir deps
# COPY mix.* ./
# COPY config config
# RUN mix do deps.get, deps.compile

# # Same with npm deps
# COPY assets/package.json assets/package-lock.json ./assets/
# COPY priv priv
# COPY assets assets
# RUN npm install --prefix assets && \
#   npm rebuild node-sass --prefix assets && \
#   npm --prefix ./assets ci --progress=false --no-audit --loglevel=error

# RUN npm run --prefix ./assets deploy
# RUN mix phx.digest

# # compile and build release
# COPY lib lib
# # uncomment COPY if rel/ exists
# # COPY rel rel
RUN mix do compile, release


# prepare release image
# dokku cannot use multistage Dockerfile
# thus we have to comment the next line!
# FROM alpine:3.9 AS app
# RUN apk add --no-cache openssl ncurses-libs

# WORKDIR /run

RUN chown -R nobody:nobody /app

USER nobody:nobody

# COPY --chown=nobody:nobody /app/_build/prod/rel/ticket ./

# ENV HOME=/app/_build/prod/rel/ticket

CMD ["/app/_build/prod/rel/ticket/bin/ticket", "start"]
