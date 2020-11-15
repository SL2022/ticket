# cypress-ci.sh

MIX_ENV=systemtest mix ecto.reset
echo "Starting the phx server..."
MIX_ENV=systemtest mix phx.server &
pid=$! # Store server pid
../assets/node_modules/.bin/cypress run  --record --key 114a5558-7d13-4b81-a67e-3deb9e3f073d
result=$?
kill -9 $pid # kill server
echo "... and killing it again!"
exit $result