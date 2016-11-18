FROM java:8-jdk

MAINTAINER Omnys srl <info@omnys.com>

LABEL gradle.version=2.7

ENV GRADLE_VERSION 2.7
ENV GRADLE_HOME /usr/lib/gradle
ENV PATH $PATH:$GRADLE_HOME/bin

RUN cd /usr/lib \
 && curl -fl https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o gradle-bin.zip \
 && unzip "gradle-bin.zip" \
 && ln -s "/usr/lib/gradle-${GRADLE_VERSION}/bin/gradle" /usr/bin/gradle \
 && rm "gradle-bin.zip"

VOLUME ["/root/.gradle/caches", "/root/.m2"]

WORKDIR /usr/bin/app

ENTRYPOINT ["gradle"]

CMD ["-version"]
