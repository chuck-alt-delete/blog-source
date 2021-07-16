#!/bin/bash

echo "generate content"

hugo

echo "push content to github pages site"

pushd public

git add .
git commit -m "publish content (publish.sh)"
git push origin main

popd