# Use Amazon Corretto 17 as the base image
FROM amazoncorretto:17

# Set the working directory in the container
WORKDIR /app

# Copy the fat JAR built by Spring Boot from the build directory
COPY build/libs/springbootbasic-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8080 so the container can serve the application
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
