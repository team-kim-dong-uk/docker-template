FROM openjdk:11-jre-slim AS builder
#FROM openjdk:11 AS builder

WORKDIR spring
ARG JAR_FILE=build/libs/demo*.jar
COPY ${JAR_FILE} spring.jar

#COPY ./build/libs/demo-0.0.1-SNAPSHOT.jar ./demo.jar

#COPY gradlew .
#COPY gradle gradle
#COPY build.gradle .
#COPY settings.gradle .
#COPY src src



#RUN chmod +x ./gradlew 
#RUN ./gradlew bootJar 

#FROM openjdk:11
#COPY --from=builder build/libs/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","spring.jar"]
