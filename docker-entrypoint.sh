#! /bin/sh

echo -e "author=$DRONE_COMMIT_AUTHOR"
echo -n -e "$DRONE_COMMIT_MESSAGE"
echo -n -e "$DRONE_COMMIT_MESSAGE" | commitlint "$@"