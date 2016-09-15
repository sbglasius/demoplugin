#!/usr/bin/env bash

set -e 

./gradlew -q clean check install --stacktrace --console plain

# If a tag is set, upload to BinTray
if [[ -n $TRAVIS_TAG && $TRAVIS_BRANCH == 'master' && $TRAVIS_PULL_REQUEST == 'false' ]]; then
	./gradlew bintrayUpload --stacktrace
fi
