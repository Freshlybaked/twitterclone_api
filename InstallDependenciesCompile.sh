#!/bin/bash
cd /home/ubuntu/twitterclone_api
mix local.hex --force
mix local.rebar --force
sudo mix deps.get --only-prod
sudo MIX_ENV=prod mix compile