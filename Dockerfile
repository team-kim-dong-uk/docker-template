FROM openjdk:11-jre-slim AS builder
# build

#COPY gradlew .
#COPY gradle gradle
#COPY build.gradle .
#COPY settings.gradle .
#COPY src src
#RUN chmod +x ./gradlew
#RUN ./gradlew bootJar

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



