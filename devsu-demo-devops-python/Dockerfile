FROM python:3.11-slim-bookworm as builder

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    APP_HOME=/app \
    USER=appuser \
    DATA_DIR=/data

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      gcc \
      python3-dev \
      libpq-dev \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN useradd --create-home $USER

WORKDIR $APP_HOME

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

FROM python:3.11-slim-bookworm

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    APP_HOME=/app \
    USER=appuser \
    DATA_DIR=/data

RUN useradd --create-home $USER

RUN mkdir -p $APP_HOME $DATA_DIR && \
    chown -R $USER:$USER $APP_HOME $DATA_DIR

WORKDIR $APP_HOME

COPY --from=builder /usr/local/lib/python3.11/site-packages/ /usr/local/lib/python3.11/site-packages/
COPY --from=builder /usr/local/bin/ /usr/local/bin/

COPY --chown=$USER:$USER . .

USER $USER

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \ 
  CMD python -c "import requests; requests.get('http://localhost:8000/health')" || exit 1

COPY --chown=$USER:$USER docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
