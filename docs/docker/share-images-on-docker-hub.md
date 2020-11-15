# Share images on Docker Hub

The final step in developing a containerized application is to share your images on a registry like Docker Hub, so they can be easily downloaded and run on any destination machine.

## Set up your Docker Hub account

You can sigin into Docker Hub from the command line by typing `docker login`;

## Create a Docker Hub repository and push your image

After creating repository, you are ready to share your image on Docker Hub, however, there's one thing you must do first: images must be *namespaced correctly* to share on Docker Hub. Specifically, you must name images like `<Your Docker ID>`/`<Repository Name>:<tag>`.

Make sure you're in the `node-bulletin-board/bulletin-board-app` directory in a terminal and run:

```sh
$ docker tag bulletinboard:1.0 <Your Docker ID>/bulletinboard:1.0
```

Finally, push your image to Docker Hub:

```sh
$ docker push <Your Docker ID>/bulletinboard:1.0
```

## REF

1. [Share images on Docker Hub](https://docs.docker.com/get-started/part3/)
