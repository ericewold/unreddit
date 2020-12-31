#!/bin/bash

echo What should the version be?
read VERSION

docker build -t ericewold/unreddit:$VERSION .
docker push ericewold/unreddit:$VERSION
ssh root@206.189.194.157 "docker pull ericewold/unreddit:$VERSION && docker tag ericewold/unreddit:$VERSION dokku/api:$VERSION && dokku deploy api $VERSION"