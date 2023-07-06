FROM maven:latest AS maven_build

COPY pom.xml /tmp/

COPY src /tmp/src/

WORKDIR /tmp/

RUN mvn package

#pull base image

FROM openjdk:11
COPY sample-1.0.3.jar /app/sample-1.0.3.jar
WORKDIR /app
CMD ["java", "-jar", "sample-1.0.3.jar"]

#copy hello world to docker image from builder image
#COPY --from=maven_build /tmp/target/sample-1.0.3.jar /data/sample-1.0.3.jar

#default command
#CMD ["java", "-jar", "/data/sample-1.0.3.jar"]
