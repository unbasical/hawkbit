# ---------------------
# MDR Build
# ---------------------
FROM maven:3.6.3-openjdk-8 as BUILD

WORKDIR /usr/app
COPY . /usr/app
RUN mvn clean install

# ---------------------
# Runtime Container
# ---------------------
#FROM openjdk:8u212-jre-alpine
#
#ENV HAWKBIT_VERSION=0.3.0M6 \
#    HAWKBIT_HOME=/opt/hawkbit
#
#EXPOSE 8080
#
#COPY --from=BUILD /usr/app/target
#
#RUN set -x \
#    && apk add --no-cache --virtual build-dependencies gnupg unzip libressl \
#    && mkdir -p $HAWKBIT_HOME \
#    && cd $HAWKBIT_HOME 
#
#VOLUME "$HAWKBIT_HOME/data"
#
#WORKDIR $HAWKBIT_HOME
#ENTRYPOINT ["java","-jar","hawkbit-update-server.jar","-Xms768m -Xmx768m -XX:MaxMetaspaceSize=250m -XX:MetaspaceSize=250m -Xss300K -XX:+UseG1GC -XX:+UseStringDeduplication -XX:+UseCompressedOops -XX:+HeapDumpOnOutOfMemoryError"]