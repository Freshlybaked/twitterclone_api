#!/bin/bash
cd /home/ubuntu/twitterclone_api
MIX_ENV=prod mix ecto.create
MIX_ENV=prod mix ecto.migrate