FROM openjdk:jre-alpine
LABEL maintainer="sgwilbur@gmail.com"

ARG TARGET_SRC_DIR

ENV INSTALL_DIR /usr/local/lib

# Copy target components
COPY ${TARGET_DIR}/ ${INSTALL_DIR}

# Copy scripts
COPY ./bin/ /usr/local/bin/
RUN chmod +x /usr/local/bin/*

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
