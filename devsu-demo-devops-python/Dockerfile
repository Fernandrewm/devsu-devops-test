FROM python:3.11-slim

ARG DJANGO_SECRET_KEY

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    DJANGO_SECRET_KEY=${DJANGO_SECRET_KEY}

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        postgresql-client \
        libpq-dev \
        gcc \
        python3-dev \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

WORKDIR /app

RUN groupadd -r django && useradd -r -g django django \
    && chown -R django:django /app

COPY --chown=django:django requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY --chown=django:django . .

EXPOSE 8000

USER django

COPY --chown=django:django docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
