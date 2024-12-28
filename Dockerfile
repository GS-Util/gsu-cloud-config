FROM eclipse-temurin:21-jdk-alpine as builder
#FROM arm64v8/eclipse-temurin:17-jdk as builder
COPY . application
WORKDIR application

ARG JAR_FILE=./build/libs/gsu-bootstrap-api-0.0.1-SNAPSHOT.jar
RUN cp ${JAR_FILE} ./application.jar


RUN java -Djarmode=layertools -jar application.jar extract

FROM eclipse-temurin:21-jre-alpine
#FROM arm64v8/eclipse-temurin:17-jre
WORKDIR application
COPY --from=builder application/dependencies/ ./
COPY --from=builder application/spring-boot-loader/ ./
COPY --from=builder application/snapshot-dependencies/ ./
COPY --from=builder application/application/ ./

ENTRYPOINT ["java", "org.springframework.boot.loader.launch.JarLauncher"]
