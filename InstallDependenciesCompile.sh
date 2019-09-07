#!/bin/bash
cd /home/ubuntu/twitterclone_api
mix local.hex --force
mix local.rebar --force
mix deps.get --only-prod
MIX_ENV=prod mix compile