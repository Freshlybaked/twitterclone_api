#!/bin/bash
cd ./../
PORT=4000 MIX_ENV=prod elixir --erl "detached" -S mix phx.server