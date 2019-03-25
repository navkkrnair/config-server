FROM openjdk:8-jdk-alpine
MAINTAINER "navkkrnair@gmail.com"
ENV APPROOT="/usr/app"
WORKDIR $APPROOT    
ADD build/libs/config-server-1.0.jar $APPROOT
RUN apk update and apk add curl
EXPOSE 8888
ENTRYPOINT ["java"]
CMD ["-jar","-Xmx256m","-Xms256m","-Djava.security.egd=file:/dev/./urandom", "/usr/app/config-server-1.0.jar"]