# spring-boot-cmdline
How to bootstrap a command line tool with Spring-Boot

# Getting started

* build the distribution assembly

```bash
mvn.cmd clean package

```
This Maven target will create a binary assembly at the dist folder.  

The assembly follows the convention **spring-boot-demo-cmdline-${project.version}-bin.zip**  The zipped pack include assets placed under **src/main/resources**: auxiliary files, folder structures, and execution scripts.  Configuration for the assembly is at **src/assembly/cli-assembly.xml**

## uber-JAR

An executable uber-JAR **demo-cmdline.jar** is created at the target folder.

The uber-JAR contains all dependencies, which is good choice for a distribution.


# Available Distributions

The start.class is a property defined at **pom.xml**

## Vanilla


```xml
	<properties>
	...
		<start.class>br.net.neuromancer.cmdline.vanilla.EntryPoint</start.class>
	</properties>
```

Runs an empty context, and pretty much does nothing else

# Banner

As usual for Spring-Boot apps, the initial MOTD comes from *src/resources/banner.txt*


# Docker 

You may use Docker to see the application in action.

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




# Spring-Boot Command Line Demo

A template for [CLI](https://en.wikipedia.org/wiki/Command-line_interface) applications using Spring Boot

# Goal

Provide a working template for building command line tools that leverage the features of Spring-Boot, and JCommander

# Motivation

CLI tools are very flexible, generally good for prototyping and exploration.

Granted that most CLI tools may start out as simple main() functions.

However, any useful tool will require ever more complex features and configurations.

[Spring Boot](https://projects.spring.io/spring-boot/) makes it easier to create stand-alone Spring based applications  

[Learning resources for Spring](https://spring.io/guides) are not too bad, and Spring Boot comes with its own [set of samples](https://github.com/spring-projects/spring-boot/tree/master/spring-boot-samples).

# Features

This demo goes a few steps beyond [spring-boot-sample-simple](https://github.com/spring-projects/spring-boot/tree/master/spring-boot-samples/spring-boot-sample-simple):

1. Maven configured to pack CLI into a single executable JAR
2. running scripts for Unix and Windows
3. [JCommander](http://jcommander.org/) for parsing line arguments
4. a custom ContextInitializer to inject [YAML properties](http://yaml.org/) into the [Spring Environment](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/core/env/Environment.html)
5. a couple of tests which disable the CommandLineRunner

Each feature will be discussed on its own.



