FROM openjdk:jre-alpine
LABEL maintainer="sean.wilbur@perficient.com"
LABEL version="0.0.12"

RUN mkdir /jars

# Copy Jars
COPY ./jars/checkstyle-8.21-all.jar /jars/checkstyle.jar

# Copy scripts
COPY ./bin/entrypoint.sh /entrypoint.sh
COPY ./bin/checkstyle.sh /usr/local/bin/checkstyle

RUN chmod +x /entrypoint.sh /usr/local/bin/checkstyle

ENTRYPOINT ["/entrypoint.sh"]
