#!/bin/bash
cd ./../
export SECRET_KEY_BASE=$(mix phx.gen.secret)
MIX_ENV=prod mix ecto.create
MIX_ENV=prod mix ecto.migrate