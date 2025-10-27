FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy all relevant directories
COPY lib/ lib/
COPY config/ config/
COPY resources/ resources/
COPY data/ data/
COPY bin/ bin/

# Expose default port for Cloud Run
EXPOSE 8080

# Environment variable for Cloud Run (Cloud Run sets PORT automatically, default 8080)
ENV PORT=8080

# Replace ports in config.xml at runtime (optional safety net)
# This replaces any 10080 or 10081 with the actual PORT value
CMD sed -i "s/10080/${PORT}/g; s/10081/${PORT}/g" config/config.xml && \
    java -cp "lib/*:config" org.openas2.app.OpenAS2Server config/config.xml
