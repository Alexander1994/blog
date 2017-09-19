# Blog & Portfolio
[http://AlexMcCallum.me](http://AlexMcCallum.me)
This is a basic blog and portfolio site I'm building as apart of learning about single file components and Vue.

## To replicate
*Tested only in Ubuntu*

run the following cmds inside the blog folder

```
npm install
./lib/build.sh
```

## For Watches
*Ubuntu required for inotifywait*

[inotifywait](https://linux.die.net/man/1/inotifywait) is required for watches.
install [inotifywait](https://linux.die.net/man/1/inotifywait) with cmd:

```
apt-get install inotify-tools
```

run watches with cmd:

```
./lib/build.sh -w all
```

The word `all` can be replaced by `html` or `js` for the individual watchers

To build a single time and not watch, run the command without the -w option
