FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy all relevant directories
COPY lib/ lib/
COPY config/ config/
COPY resources/ resources/
COPY data/ data/
COPY bin/ bin/

# Expose AS2 HTTP port
EXPOSE 10080

# Set startup command for OpenAS2
CMD ["java", "-cp", "lib/*;config", "org.openas2.app.OpenAS2Server", "config/config.xml"]
