# spring-boot-cmdline
How to bootstrap a command line tool with Spring-Boot

# Getting started

* build the distribution assembly

```bash
mvn.cmd clean package

```
This target will create a binary assembly at the dist folder.  

The assembly follows the convention **spring-boot-demo-cmdline-${project.version}-bin.zip** 

The assembly may include assets placed under **src/main/resources**: auxiliary files, folder structures, and execution scripts.

The packaging of the distribution assembly is configured from **src/assembly/cli-assembly.xml**

## uber-JAR

An executable uber-JAR **demo-cmdline.jar** is created at the target folder.

The uber-JAR contains all dependencies, which is good for a distribution


# Docker 

If necessary, adjust environment variables BIN_PACKAGE_PREFIX and SLEEP_INTERVAL on **/app.yml**

Then in a command prompt:

```bash
docker-compose -f app.yml up --build

```

## Docker details

The main Dockerfile is placed under **src/main/docker**

The script *entrypoint.sh* unzips the distribution assembly to home, runs *~/BIN_PACKAGE_PREFIX/bin/demo-cmdline.sh*, then sleeps

The sleep interval comes in handy for debugging.  Otherwise the container only executes, then exits immediately

Inspect the container while it's still alive with:

```bash

$ docker ps -a
CONTAINER ID        IMAGE                                COMMAND                  CREATED             STATUS                      PORTS                  NAMES
11f1a1903192        springbootdemocmdline_demo_cmdline   "bin/sh /entrypoin..."   24 seconds ago      Up 23 seconds                                      demo_cmdline

docker exec -it demo_cmdline bin/sh

```

# Available Distributions

The start.class is a property defined at **pom.xml**

##Vanilla


```xml
	<properties>
	...
		<start.class>br.net.neuromancer.cmdline.vanilla.EntryPoint</start.class>
	</properties>
```

Runs an empty context, and pretty much does nothing else



