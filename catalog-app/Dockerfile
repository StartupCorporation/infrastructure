FROM maven:3.9.4-eclipse-temurin-17 AS build

WORKDIR /app

COPY --from=src-catalog-app pom.xml ./
COPY --from=src-catalog-app src ./src

RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim

WORKDIR /app

COPY --from=build /app/target/catalog-microservice-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
