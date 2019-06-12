FROM openjdk:jre-alpine
LABEL maintainer="sgwilbur@gmail.com"

ARG TARGET_SRC_DIR

ENV INSTALL_DIR /usr/local/lib
ENV CHECKSTYLE_VERSION 8.21
ENV PMD_VERSION 6.15.0

# Install curl
RUN apk add bash curl

# Install checkstyle
RUN curl -L -o ${INSTALL_DIR}/checkstyle.jar https://github.com/checkstyle/checkstyle/releases/download/checkstyle-${CHECKSTYLE_VERSION}/checkstyle-${CHECKSTYLE_VERSION}-all.jar
# Install PMD
RUN cd ${INSTALL_DIR} && \
  curl -L https://github.com/pmd/pmd/releases/download/pmd_releases%2F${PMD_VERSION}/pmd-bin-${PMD_VERSION}.zip --output pmd-bin-${PMD_VERSION}.zip &&\
  unzip pmd-bin-${PMD_VERSION}.zip && \
  mv pmd-bin-${PMD_VERSION} pmd && \
  rm pmd-bin-${PMD_VERSION}.zip

# Copy scripts
COPY ./bin/ /usr/local/bin/
RUN chmod +x /usr/local/bin/*

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
