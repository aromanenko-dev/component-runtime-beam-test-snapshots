FROM maven:3-openjdk-11

ARG BEAM_VERSION=2.33.0
ARG SPARK_VERSION=3.1.2
ARG SPARK_SCALA_VERSION=2.12

COPY .m2/settings.xml ${PWD}/settings.xml

RUN set -ex; \
    git clone --depth 1 https://github.com/Talend/component-runtime;

RUN set -ex; \
    cd component-runtime; \
    mvn install -s ../settings.xml -B -am -pl 'component-runtime-beam' \
        -Dbeam.version=${BEAM_VERSION} \
        -Dspark.version=${SPARK_VERSION} \
        -Dspark-scala.version=${SPARK_SCALA_VERSION} ;
