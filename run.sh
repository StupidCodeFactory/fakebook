#!/bin/sh

bundle check || bundle install
rails tmp:pids:clear

exec "$@"
