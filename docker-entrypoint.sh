#! /bin/sh

echo $DRONE_COMMIT_MESSAGE | npx --no-install commitlint "$@"