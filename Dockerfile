FROM confluentinc/cp-kafka-connect-base:6.1.1

ENV CONNECT_BOOTSTRAP_SERVERS http://host.docker.internal:9092
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-s3:10.0.0

COPY --chown=appuser:appuser kafka-connect-configure /etc/confluent/docker/configure
COPY --chown=appuser:appuser kafka-connect-launch /etc/confluent/docker/launch

COPY --chown=appuser:appuser kafka-connect.properties /etc/kafka-connect/kafka-connect.properties
COPY --chown=appuser:appuser s3.properties /etc/kafka-connect/s3.properties
