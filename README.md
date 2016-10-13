![ASP.NET Docker Image](https://avatars2.githubusercontent.com/u/6154722?v=3&s=200)
# ASP.NET Docker Image

NOTE: This is a Windows container image. [Learn more about Windows containers](https://msdn.microsoft.com/en-us/virtualization/windowscontainers/about/about_overview).

## Supported tags and respective `Dockerfile` links

* 4.6.2, latest ([4.6.2/Dockerfile](https://github.com/microsoft/aspnet-docker/blob/master/4.6.2/Dockerfile))
* 3.5 ([3.5/Dockerfile](https://github.com/microsoft/aspnet-docker/blob/master/3.5/Dockerfile))

This image is built from the [microsoft/aspnet-docker GitHub repo](https://github.com/microsoft/aspnet-docker).

## What is ASP.NET?
ASP.NET is a high productivity  framework for building Web Applications using Web Forms, MVC, Web API and SignalR.

## How to use this image?

Copy `4.6.2\sample\Dockerfile` to your app directory. You would then be able to build and run the site from the app directory.

```
$ docker run -d --name my-running-site aspnet-site
```

There is no need to specify an `ENTRYPOINT` in your Dockerfile since the `microsoft/aspnet` base image already includes an entrypoint application that monitors the status of the IIS World Wide Web Publishing Service (W3SVC).

### Verify in the browser

> With the current release, you can't use `http://localhost` to browse your site from the container host. This is because of a known behavior in WinNAT, and will be resolved in future. Until that is addressed, you need to use the IP address of the container.

Once the container starts, you'll need to finds its IP address so that you can connect to your running container from a browser. You use the `docker inspect` command to do that:

`docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" my-running-site`

You will see an output similar to this:

```
172.28.103.186
```

You can connect the running container using the IP address and configured port, `http://172.28.103.186` in the example shown.

For a comprehensive tutorial on running an ASP.NET app in a container, check out [the tutorial on the docs site](https://docs.microsoft.com/en-us/dotnet/articles/framework/docker/aspnetmvc).

## Supported Docker Versions
This image has been tested on Docker Versions [1.12.2-beta](https://download.docker.com/components/engine/windows-server/cs-1.12/docker-1.12.2.zip) or higher.

## License of this repository

MIT

## License of ASP.NET (.NET Framework) images on Dockerhub 

MICROSOFT SOFTWARE SUPPLEMENTAL LICENSE TERMS

CONTAINER OS IMAGE

Microsoft Corporation (or based on where you live, one of its affiliates) (referenced as “us,” “we,” or “Microsoft”) licenses this Container OS Image supplement to you (“Supplement”). You are licensed to use this Supplement in conjunction with the underlying host operating system software (“Host Software”) solely to assist running the containers feature in the Host Software. The Host Software license terms apply to your use of the Supplement. You may not use it if you do not have a license for the Host Software. You may use this Supplement with each validly licensed copy of the Host Software.
## User Feedback
If you have any issues or concerns, reach out to us through a [GitHub issue](https://github.com/Microsoft/aspnet-docker/issues/new).
