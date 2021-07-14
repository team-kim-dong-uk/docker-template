FROM openjdk:11 AS builder
#FROM openjdk:11 AS builder


ARG JAR_FILE=build/libs/*.jar
#COPY ${JAR_FILE} spring.jar

#COPY ./build/libs/demo-0.0.1-SNAPSHOT.jar ./demo.jar

COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .
COPY src src
RUN chmod +x ./gradlew
RUN ./gradlew bootjar --debug --stacktrace > gradle.log

FROM openjdk:11-jre-slim
COPY --from=builder ${JAR_FILE} /stage/spring.jar
WORKDIR stage
EXPOSE 8080
ENTRYPOINT ["java","-jar","spring.jar"]
