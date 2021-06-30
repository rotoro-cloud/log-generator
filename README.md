# log-generator
Fake log generator for educational purposes
Docker image for a random log generator, based on Alpine Linux.

## What is this?

This image will execute a container with fake logs:

* `2021-06-02T12:22:17-03:22 ERROR some critical event here.`
* `2021-06-02T12:22:17-03:22 INFO we made some important task.`
* `2021-06-02T12:22:17-03:22 WARN this method not implemented.`
* `2021-06-02T12:22:17-03:22 DEBUG code 22, array:["rotoro","cloud"].`

## Why this Image?

Its for CKA course

## What is inside of this repo?

* `Dockerfile` -> image definition.
* `entrypoint.sh` -> shell code.

## How do I use this image?

To use this image you must do as follows:

```bash
# you can use tags latest
docker pull rotorocloud/random-logger:latest

# use different intervals to print logs every random(100, 400) milliseconds
docker run chentex/random-logger:latest 100 400

# use the third parameter so limit the number of loglines (after generating the lines the container will stop).
# if not set it runs infinite
docker run chentex/random-logger:latest 100 400 100

# to run the image just execute
docker run -d chentex/log-generator
```

You will have now a docker container running and generating log messages, locate it running:

```bash
docker ps
```

You can see the logs using this command

```bash
docker logs <- container-id ->
```

## How do I build this images?

You need:

* docker
* git

Clone this repo

`git clone https://github.com/rotoro-cloud/log-generator`

Go to the folder in your terminal and type this:

```bash
# cd into folder
cd random-logger
# Then build the new image
docker build -f Dockerfile .
```

If you want to tag your image use the following command

```bash
docker build -f Dockerfile -t yourbase/yourname:version .
```

---
