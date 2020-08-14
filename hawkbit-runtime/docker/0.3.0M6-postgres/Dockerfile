FROM hawkbit:local
RUN set -x \
    && apk add --no-cache --virtual build-dependencies gnupg unzip libressl wget \
    && wget -O $JAVA_HOME/lib/ext/postgresql-42.2.10.jre7.jar --no-verbose https://jdbc.postgresql.org/download/postgresql-42.2.10.jre7.jar \
    && apk del build-dependencies

ENTRYPOINT ["java","-jar","/hawkbit-update-server.jar","--spring.profiles.active=postgresql","-Xms768m -Xmx768m -XX:MaxMetaspaceSize=250m -XX:MetaspaceSize=250m -Xss300K -XX:+UseG1GC -XX:+UseStringDeduplication -XX:+UseCompressedOops -XX:+HeapDumpOnOutOfMemoryError"]
