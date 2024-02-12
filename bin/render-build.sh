#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec RAILS_ENV=production rails db:migrate