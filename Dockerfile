# Build stage
FROM openjdk:21-jdk-slim AS build

WORKDIR /app
COPY . .
RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

# Runtime stage
FROM openjdk:21-jdk-slim
WORKDIR /app

# Copy only the built jar
COPY --from=build /app/target/ecommerce-0.0.1-SNAPSHOT.jar app.jar

ENV PORT=8080
EXPOSE $PORT

CMD ["java", "-jar", "app.jar"]
