FROM openjdk:17-alpine
LABEL maintainer="freelxs@gmail.com"

ARG TARGET_SRC_DIR

ENV INSTALL_DIR /usr/local/lib
ENV CHECKSTYLE_VERSION 10.15.0 
ENV PMD_VERSION 6.55.0

# Install curl
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
RUN apk add --update --no-cache wget unzip curl tzdata git bash
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone
# Install checkstyle
RUN curl -L -o ${INSTALL_DIR}/checkstyle.jar https://mirror.ghproxy.com/https://github.com/checkstyle/checkstyle/releases/download/checkstyle-${CHECKSTYLE_VERSION}/checkstyle-${CHECKSTYLE_VERSION}-all.jar
# Install PMD
RUN cd ${INSTALL_DIR} && \
  curl -L https://mirror.ghproxy.com/https://github.com/pmd/pmd/releases/download/pmd_releases%2F${PMD_VERSION}/pmd-bin-${PMD_VERSION}.zip --output pmd-bin-${PMD_VERSION}.zip &&\
  unzip pmd-bin-${PMD_VERSION}.zip && \
  mv pmd-bin-${PMD_VERSION} pmd && \
  rm pmd-bin-${PMD_VERSION}.zip

# Copy scripts
COPY ./bin/ /usr/local/bin/
COPY ./rules/ /opt/rules/
RUN chmod +x /usr/local/bin/*

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
