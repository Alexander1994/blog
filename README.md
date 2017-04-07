# Blog
This is a basic blog I'm building as apart of learning about single file components and Vue.

## To replicate
This project wasn't really designed for others to tinker with but if you would like...
```
cd blog
mkdir dist
mkdir dist/js
cp src/index.html dist/index.html
mkdir src/media
```
Create a json file in src/media the following format:
```
{
    blog: [
        {
            title: "...",
            date: "UTC format",
            "content": "<p>main content</p>"
        }
    ]
}
```
```
cd lib
./buildvue.sh
./watchhtml.sh
```
Then make some changes