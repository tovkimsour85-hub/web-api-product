# Stage 1: Build the application
FROM eclipse-temurin:21-jdk-alpine AS build
WORKDIR /app
COPY . .
RUN ./gradlew clean build -x test

# Stage 2: Run the application
FROM eclipse-temurin:21-jdk-alpine
VOLUME /tmp
COPY --from=build /app/build/libs/web-api-product-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
