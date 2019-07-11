Test by retriving a serviceaccount auth keyfile, name it keys.json and place it in this directory.

Then run docker-compose like so
  docker-compose start db

And then
  GS_URL="gs://path-to-bucket" docker-compose run backup

When you're done
  docker-compose down
