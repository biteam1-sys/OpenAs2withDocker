FROM eclipse-temurin:17-jre

WORKDIR /app

COPY lib/ lib/
COPY config/ config/
COPY resources/ resources/
COPY data/ data/
COPY bin/ bin/

EXPOSE 8080
ENV PORT=8080

# Replace port placeholders in all config files and force bind to 0.0.0.0
CMD sed -i "s/\${PORT}/$PORT/g" config/config.properties config/config.xml && \
    sed -i 's/localhost/0.0.0.0/g' config/config.properties && \
    java -cp "lib/*:config" org.openas2.app.OpenAS2Server config/config.xml

