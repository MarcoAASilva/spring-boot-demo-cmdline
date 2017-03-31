FROM maven:3.3.9-jdk-8-alpine
MAINTAINER Marco A. A. Silva <marco.silva@bytewood.com>

RUN apk add --no-cache \
    bash \
    git 

RUN git clone https://github.com/MarcoAASilva/spring-boot-demo-cmdline.git ~/repo && \
	cd ~/repo && \
	mvn clean package && \
	unzip -o ~/repo/src/main/docker/assets/dist/spring-boot-demo-cmdline.zip -d ~ && \
	chmod a+x ~/spring-boot-demo-cmdline/bin/demo-cmdline.sh && \
	rm ~/repo -rf

ENTRYPOINT ["/bin/sh","root/spring-boot-demo-cmdline/bin/demo-cmdline.sh"]

CMD sleep 3000
    
