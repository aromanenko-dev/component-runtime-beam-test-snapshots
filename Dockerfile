FROM maven:3-jdk-8

ARG BEAM_VERSION=2.16.0

COPY .m2/settings.xml ${PWD}/.m2/

RUN set -ex; \
    git clone --depth 1 https://github.com/Talend/component-runtime;

RUN set -ex; \
    cd component-runtime; \
    mvn install -Papache-snapshots -B -am -pl 'component-runtime-beam' -Dbeam.version=${BEAM_VERSION};
