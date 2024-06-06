# Stage 1: Build the JAR file using Maven
FROM maven:3.8.4-openjdk-11-slim AS build
WORKDIR /app
COPY . .
RUN mvn clean install

# Stage 2: Run the application
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/*.jar /app/

# Expose the application port
EXPOSE 9090

# Use a shell command to dynamically identify the JAR file and run it
CMD ["sh", "-c", "java -jar /app/*.jar"]
