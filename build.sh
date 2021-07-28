#!/bin/bash

function gitPush() {
    git add .
    git commit -m "publish content (publish.sh)"
    git push origin main
}

echo "generate content"

hugo

echo "push content to github pages site"

pushd public
gitPush()
popd

echo "push blog source"

gitPush()