FROM alpine:3

LABEL maintaner="Gilberto Taccari <gilberto.taccari@gmail.com>"

ENV STRUCTURIZR_CLI_VERSION=1.5.0

RUN apk --no-cache add wget unzip openjdk11-jre-headless

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"

WORKDIR /opt
ENV STRUCTURIZR_CLI_URL="https://github.com/structurizr/cli/releases/download/v$STRUCTURIZR_CLI_VERSION/structurizr-cli-$STRUCTURIZR_CLI_VERSION.zip"
RUN wget -q $STRUCTURIZR_CLI_URL -O structurizr-cli.zip
RUN unzip structurizr-cli.zip && rm structurizr-cli.zip
RUN mv "structurizr-cli-$STRUCTURIZR_CLI_VERSION.jar" structurizr-cli.jar

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
