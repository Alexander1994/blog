#!/bin/sh

# compiles the file index.js into bundle.js

# install inotifywait with cmd: "apt-get install inotify-tools"

srcpath="src/js"
srcvuepath="$srcpath/vue"
distpath="dist/js"
jspath="$srcpath/"

filename="index"

indexfile="$srcpath/$filename.js"
bundlefile="$distpath/$filename.js"
bundleminfile="$distpath/$filename.min.js"

while inotifywait -e modify $srcvuepath -o inotifywait -e modify $jspath ; do
  echo `browserify -t vueify -e $indexfile | uglifyjs > $bundleminfile`
  #echo `browserify -t vueify -e $indexfile > $bundlefile`
done
