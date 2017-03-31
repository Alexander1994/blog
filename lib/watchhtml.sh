#!/bin/sh
watchpath="src"
file="src/index.html"
distpath="dist/index.html"

while inotifywait -e modify $watchpath; do
  echo `cp $file $distpath`
done
