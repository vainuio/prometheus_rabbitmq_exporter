FROM rabbitmq:3.7-management

RUN apt-get update && apt-get install --no-install-recommends -y wget ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN cd /usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/plugins/ && wget \
    "https://github.com/deadtrickster/prometheus_rabbitmq_exporter/releases/download/v3.7.2.2/accept-0.3.3.ez" \
    "https://github.com/deadtrickster/prometheus_rabbitmq_exporter/releases/download/v3.7.2.2/prometheus-3.5.1.ez" \
    "https://github.com/deadtrickster/prometheus_rabbitmq_exporter/releases/download/v3.7.2.2/prometheus_cowboy-0.1.4.ez" \
    "https://github.com/deadtrickster/prometheus_rabbitmq_exporter/releases/download/v3.7.2.2/prometheus_httpd-2.1.8.ez" \
    "https://github.com/deadtrickster/prometheus_rabbitmq_exporter/releases/download/v3.7.2.2/prometheus_process_collector-1.3.1.ez" \
    "https://github.com/deadtrickster/prometheus_rabbitmq_exporter/releases/download/v3.7.2.2/prometheus_rabbitmq_exporter-v3.7.2.2.ez"

RUN rabbitmq-plugins enable --offline prometheus accept prometheus_rabbitmq_exporter prometheus_process_collector prometheus_httpd prometheus_cowboy
