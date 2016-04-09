#!/bin/sh

cd /var/data
#bundle exec rake unicorn:start
bundle exec puma -b unix:///tmp/puma.sock

