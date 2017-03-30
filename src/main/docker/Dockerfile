FROM openjdk:8-jre-alpine

COPY assets/dist/spring-boot-demo-cmdline-Vanilla-bin.zip /tmp

CMD unzip -o /tmp/spring-boot-demo-cmdline-Vanilla-bin.zip -d ~ && \
	chmod a+x ~/spring-boot-demo-cmdline-Vanilla/bin/demo-cmdline.sh && \
	~/spring-boot-demo-cmdline-Vanilla/bin/demo-cmdline.sh  && \
	sleep 30s
    
