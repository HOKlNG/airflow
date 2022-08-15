FROM apache/airflow:2.2.2

COPY --chown=airflow:root airflow.cfg /opt/airflow

USER root
RUN apt-get update \
    && apt-get install -y --no-install-recommends vim \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER airflow
RUN pip install --no-cache-dir \
    great_expectations \
    airflow-provider-great-expectations \
    PyYAML \
    apache-airflow-providers-amazon==2.4.0
