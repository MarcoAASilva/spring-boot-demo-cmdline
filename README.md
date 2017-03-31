# spring-boot-demo-cmdline
How to bootstrap a command line tool with Spring-Boot

Visit us at [GitHub Pages](https://marcoaasilva.github.io/spring-boot-demo-cmdline/) and [Docker Hub](https://hub.docker.com/r/dreamcaster/spring-boot-demo-cmdline/)

# Getting started

| tag     | Description     |
| --------|-----------------|
| latest  |                 |
| Vanilla | The [POC release](https://en.wikipedia.org/wiki/Proof_of_concept) runs an empty context, used for bootstrapping, pretty much does nothing else    |

## Fast-lane with Docker

```bash
docker pull dreamcaster/spring-boot-demo-cmdline:Vanilla

docker run dreamcaster/spring-boot-demo-cmdline:Vanilla

```

#Implementation Details

## Building from source

* build the distribution assembly

```bash
mvn.cmd clean package

```
This Maven target will create a binary assembly ZIP at *src/docker/assets/dist*.  

### assembly configuration

Configuration for the assembly is found at *src/assembly/cli-assembly.xml*

Binary assembly ZIP may also include assets placed under *src/main/resources*: sample files, folder structures, and execution scripts.


### configuration of target JAR

The start.class is defined at *pom.xml*

```xml
	<properties>
	...
		<start.class>br.net.neuromancer.cmdline.vanilla.EntryPoint</start.class>
	</properties>
```


### uber-JAR

An executable uber-JAR *demo-cmdline.jar* is created at the target folder.

The uber-JAR contains all dependencies, which is usually a good choice for a distribution.


### Banner

As usual for Spring-Boot, the MOTD may be configured on *src/resources/banner.txt*


## Docker 

### slow lane (only after building from source)

```bash
docker-compose -f app.yml up --build

```

### details

The main Dockerfile is placed under *src/main/docker*

Binary distributions is unzipped,  *~/BIN_PACKAGE_PREFIX/bin/demo-cmdline.sh* gets executed, then sleeps.

The sleep comes in handy for debugging: otherwise the container would only execute, exiting immediately

While sleeping, you may inspect the container:

```bash

$ docker ps -a

$docker exec -it demo_cmdline bin/sh

```

# GitHub Pages

```
bash ./updateGitHubPages.sh
```

Sourced from the project README.MD of on branch *gh-pages*

Update on master, then replace the gh-branch

```
$ git push origin --delete gh-pages

$ git branch -D gh-pages

$ git init

$ git branch gh-pages

$ git push origin gh-pages

$ git branch
```


# Git Tagging

Tags are synchronized on DockerHub as well.

## adding a Tag

```                                                                 
$git tag -a Vanilla -m "just a POC for automated builds"

$git tag

$git git push origin Vanilla
```                                                                 


## removing a Tag

```                                                                 
$ git tag                                                                    
Vanilla                                                                      
                                                                             
$ git tag -d Vanilla                                                         
Deleted tag 'Vanilla' (was 3154b85)                                          
                                                                             
$ git push origin :refs/tags/Vanilla                                         
To github.com:MarcoAASilva/spring-boot-demo-cmdline.git                      
 - [deleted]         Vanilla                                                 
                                                                             
$ git tag                                                                    

```


