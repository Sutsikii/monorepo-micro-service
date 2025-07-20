#!/bin/sh

npm ci --include=dev

exec "$@"