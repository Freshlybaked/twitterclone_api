#!/bin/bash
cd ./../
mix local.hex --force
mix local.rebar --force
mix deps.get
MIX_ENV=prod mix compile