# Build structurizr-cli
FROM gradle:jdk11 as builder

ENV STRUCTURIZR_CLI_VERSION=1.9.0

COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN git clone --depth 1 --branch "v$STRUCTURIZR_CLI_VERSION" https://github.com/structurizr/cli.git
RUN cd cli && ./gradlew build --no-daemon

# Structurizr CLI
FROM adoptopenjdk:11-jre-hotspot-focal

LABEL maintaner="Gilberto Taccari <gilberto.taccari@gmail.com>"

WORKDIR /opt
COPY --from=builder /home/gradle/src/cli/build/libs/structurizr-cli-*.jar ./structurizr-cli.jar

WORKDIR /home

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
