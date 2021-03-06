#!/bin/bash
over=0.2.11
nver=0.2.13
sed -i "" "s/$over/$nver/g" docker-compose.yaml
docker-compose build
sed -i "" "s/$over/$nver/g" helm-src/values.yaml
cd helm-chart
./build.sh
./index.sh
cd ..

sed -i "" "s/$over/$nver/g" README.md
git add -A
git commit -m "$nver"
