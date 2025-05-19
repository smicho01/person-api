FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy the JAR file
COPY target/*.jar app.jar

# Add a simple healthcheck that just checks if the port is open
HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget -q --spider http://localhost:8080/ || exit 1

# Create a non-root user to run the application
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

# Expose the application port
EXPOSE 8080

# Set environment variables
ENV JAVA_OPTS="-XX:+UseContainerSupport -XX:MaxRAMPercentage=75.0"

# Run with proper configuration
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar --server.port=8080 --server.address=0.0.0.0"]