FROM gradle:jdk17-alpine AS build
RUN ./gradlew clean
COPY . /app
WORKDIR /app
RUN ./gradlew build



FROM openjdk:17-alpine
WORKDIR build/libs/
COPY --from=build app/build/libs/containertest-0.0.1-SNAPSHOT.jar .
CMD ["java", "-jar", "containertest-0.0.1-SNAPSHOT.jar"]