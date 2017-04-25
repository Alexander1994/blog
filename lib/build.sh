#!/usr/bin/env bash

build(){
    unformatedJson='{"blog":[{"date":"2016-04-20","title":"Title","content":"Content"}]}'
    echo `mkdir dist; mkdir dist/js; mkdir src/media`
    echo "$unformatedJson" > src/media/blog.json
    build_vue & build_html
}

build_vue() {
    srcpath="src/js"
    srcvuepath="$srcpath/vue"
    distpath="dist/js"
    jspath="$srcpath/"

    filename="index"

    indexfile="$srcpath/$filename.js"
    bundlefile="$distpath/$filename.js"
    bundleminfile="$distpath/$filename.min.js"

    echo `browserify -t vueify -e $indexfile | uglifyjs > $bundleminfile`

    if [[ $1 = true ]] ; then
        while inotifywait -e modify $srcvuepath -o inotifywait -e modify $jspath ; do
          echo `browserify -t vueify -e $indexfile | uglifyjs > $bundleminfile`
        done
    fi
}

build_html () {
    watchpath="src"
    file="src/index.html"
    distpath="dist/index.html"

    echo `cp $file $distpath`

    if [[ $1 = true ]] ; then
        while inotifywait -e modify $watchpath; do
          echo `cp $file $distpath`
        done
    fi
}

watch=false
buildtype=$2
if [[ "$1" == "-w" ]]
then
    watch=true
else
    buildtype=$1
fi
echo "$buildtype"

if [[ "$buildtype" == "html" ]] ; then
    build_html ${watch}
elif [[ "$buildtype" == "js" ]] ; then
    build_vue ${watch}
elif [[ "$buildtype" == "all" ]] ; then
    build_html ${watch} & build_vue ${watch}
elif [[ $# -eq 0 ]] ; then
    build
fi