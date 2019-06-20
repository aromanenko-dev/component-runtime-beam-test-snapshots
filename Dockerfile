FROM maven:3-jdk-8

ENV BEAM_VERSION="2.15.0-SNAPSHOT" \
    MAVEN_OPTS="-client -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xverify:none"

RUN set -ex; \
    git clone --depth 1 https://github.com/Talend/component-runtime;

RUN set -ex; \
    cd component-runtime; \
    mvn install -B -am -pl 'component-runtime-beam' -Dbeam.version=${BEAM_VERSION};
