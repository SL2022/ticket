# cypress-open.sh

MIX_ENV=systemtest mix ecto.reset # Need a blank database
echo "Starting the phx server..."
MIX_ENV=systemtest mix phx.server &
pid=$! # Store server pid
assets/node_modules/.bin/cypress open
result=$?
kill -9 $pid # Kill server
echo "... and killing it again!"
exit $result # Return test result