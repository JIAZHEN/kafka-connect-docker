FROM confluentinc/cp-kafka-connect-base:6.1.1

ENV CONNECT_BOOTSTRAP_SERVERS http://host.docker.internal:9092
ENV CONNECT_GROUP_ID kafka-insight-s3
ENV CONNECT_CONFIG_STORAGE_TOPIC kafka-insight-s3-config
ENV CONNECT_OFFSET_STORAGE_TOPIC kafka-insight-s3-offset
ENV CONNECT_STATUS_STORAGE_TOPIC kafka-insight-s3-status
ENV CONNECT_REST_ADVERTISED_HOST_NAME localhost
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-s3:10.0.0

COPY --chown=appuser:appuser kafka-connect-configure /etc/confluent/docker/configure
COPY --chown=appuser:appuser kafka-connect.properties /etc/kafka-connect/kafka-connect.properties
