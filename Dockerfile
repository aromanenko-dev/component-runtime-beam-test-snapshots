FROM maven:3-jdk-8

ARG BEAM_VERSION=2.19.0

COPY .m2/settings.xml ${PWD}/settings.xml

RUN set -ex; \
    git clone --depth 1 https://github.com/Talend/component-runtime;

RUN set -ex; \
    cd component-runtime; \
    mvn install -s ../settings.xml -B -am -pl 'component-runtime-beam' -Dbeam.version=${BEAM_VERSION};
