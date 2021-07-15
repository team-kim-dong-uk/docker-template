FROM openjdk AS builder
# build
ARG SPRING_ACTIVE_PROFILE

#COPY gradlew /application/
#COPY gradle /application/gradle/
#COPY build.gradle /application/
#COPY settings.gradle /application/
#COPY src /application/src
#RUN chmod +x /application/gradlew
#
#RUN /gradlew bootJar -Dspring.profiles.active=$SPRING_ACTIVE_PROFILE


WORKDIR application
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} spring.jar
RUN java -Djarmode=layertools -jar spring.jar extract

FROM openjdk:11-jre-slim
WORKDIR application
ENV port 8080

COPY --from=builder application/dependencies/ ./
COPY --from=builder application/spring-boot-loader/ ./
COPY --from=builder application/snapshot-dependencies/ ./
COPY --from=builder application/application/ ./
ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]
#ENV spring.profiles.active local
#COPY --from=builder ${JAR_FILE} /stage/spring.jar
#WORKDIR stage
#EXPOSE 8080
#ENTRYPOINT ["java","-jar","spring.jar"]



