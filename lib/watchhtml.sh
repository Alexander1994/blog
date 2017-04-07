#!/bin/bash

# copies the file index.html from src to dist

# install inotifywait with cmd: "apt-get install inotify-tools"

watchpath="src"
file="src/index.html"
distpath="dist/index.html"

while inotifywait -e modify $watchpath; do
  echo `cp $file $distpath`
done
