FROM openjdk:jre-alpine
LABEL maintainer="sgwilbur@gmail.com"

ARG TARGET_DIR=./target/opt

#RUN mkdir -p /opt/checkstyle/

# Copy target components
COPY ${TARGET_DIR}/ /opt/

# Copy scripts
COPY ./bin/ /usr/local/bin/
RUN chmod +x /usr/local/bin/*

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
