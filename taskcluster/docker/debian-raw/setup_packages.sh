#!/bin/bash

TASKCLUSTER_ROOT_URL=$1
shift

queue_base="https://firefox-ci-tc.services.mozilla.com/api/queue/v1"


for task in "$@"; do
  echo "adding package source $queue_base/task/$task/artifacts/public/build/"
  echo "deb [trusted=yes] $queue_base/task/$task/artifacts/public/build/ debian/" > "/etc/apt/sources.list.d/99$task.list"
done