# cypress-run.sh

MIX_ENV=systemtest mix ecto.reset
echo "Starting the phx server..."
MIX_ENV=systemtest mix phx.server &
pid=$! # Store server pid
../assets/node_modules/.bin/cypress run
result=$?
kill -9 $pid # kill server
echo "... and killing it again!"
exit $result