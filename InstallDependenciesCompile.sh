#!/bin/bash
mix local.hex --force
mix local.rebar --force
mix deps.get --only-prod
MIX_ENV=prod mix compile