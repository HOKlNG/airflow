FROM apache/airflow:2.2.2

COPY --chown=airflow:root airflow.cfg /opt/airflow

USER root
RUN apt-get update \
    && apt-get install -y --no-install-recommends vim \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER airflow

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir --upgrade pip \
    && pip install numpy==1.17.0 \
    && pip install -r requirements.txt
