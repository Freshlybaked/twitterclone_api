#!/bin/bash
cd /home/ubuntu/twitterclone_api
screen -d -m -S twittercloneapi sh -c "PORT=4000 MIX_ENV=prod mix phx.server"