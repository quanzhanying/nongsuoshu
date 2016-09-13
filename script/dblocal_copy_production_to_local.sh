#!/bin/bash
# Pulls dump of latest production db. Then pushes dump to local postgres.

heroku pg:backups capture
heroku_pg_backup_s3_url=$(heroku pg:backups public-url --app nongsuoshu)


# Download file under system root tmp directory
pushd /tmp
  curl -o latest.dump ${heroku_pg_backup_s3_url}
popd

pg_restore --verbose --clean --no-acl --no-owner -h localhost -d nongsuoshu_development /tmp/latest.dump
