#! /bin/sh
sudo docker start postgres
mix deps.get
mix ecto.setup
mix phx.server