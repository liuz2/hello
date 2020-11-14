# Build and run your image

In general, the development workflow looks like this:

1. Create and test individual containers for each component of your application by first creating Docker images.
1. Assemble your containers and supporting infrastructure into a complete application.
1. Test, share, and deploy your complete containerized application.

Remember, a Docker image captures the private filesystem that your containerized processes will run in; you need to create an image that contains just what your application needs to run.

## Setup

Let us download the `node-bulletin-board` example project. This is a simple bulletin board application written in Node.js.

```sh
$ git clone https://github.com/dockersamples/node-bulletin-board
$ cd node-bulletin-board/bulletin-board-app
```

## Define a container with Dockerfile

After downloading the project, take a look at the file called [`Dockerfile`](https://docs.docker.com/get-started/part2/#sample-dockerfile) in the bulletin board application. Dockerfiles describe how to assemble a private filesystem for a container, and can also contain some metadata describing how to run a container based on this image.

## Build and test your image

Run the following command to build your bulletin board image:

```sh
$ docker build --tag bulletinboard:1.0 .
```

## Run your image as a container

Run the following command to start a container based on your new image:

```sh
$ docker run --publish 8000:8080 --detach --name bb bulletinboard:1.0
```

There are a couple of common flags here:

* `--publish` asks Docker to forward traffic incoming on the host's port 8000 to the container's port 8080. Containers have their own private set of ports, so if you want to reach one from the network, you have to forward traffic to it in this way. Otherwise, firewall rules will prevent all network traffic from reaching your container, as a default security posture.
* `--detach` asks Docker to run this container in the background
* `--name` specifies a name with which you can refer to your container in subsequent commands, in this case `bb`.

Visit your application in a browser at `localhost:8000`. You should see your bulletin board application up and running.

Once you're satisfied that your bulletin board container works correctly, you can delete it:

```sh
$ docker rm --force bb
```

The `--force` option stops a running container, so it can be removed. If you stop the container running with `docker stop bb` first, then you do not need to use `--force` to remove it.

## REF

1. [Build and run your image](https://docs.docker.com/get-started/part2/)