#!/usr/bin/env bash

set -e 

./gradlew clean check install --stacktrace 
echo "TRAVIS_TAG          : $TRAVIS_TAG"
echo "TRAVIS_BRANCH       : $TRAVIS_BRANCH"
echo "TRAVIS_PULL_REQUEST : $TRAVIS_PULL_REQUEST"

# If a tag is set, upload to BinTray
if [[ -n $TRAVIS_TAG && $TRAVIS_BRANCH == 'master' && $TRAVIS_PULL_REQUEST == 'false' ]]; then
	./gradlew bintrayUpload --stacktrace
fi
