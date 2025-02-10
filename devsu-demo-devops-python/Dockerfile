FROM python:3.11-slim

# Argumentos de construcción para las variables de entorno
ARG DJANGO_SECRET_KEY

# Establecer variables de entorno
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    DJANGO_SECRET_KEY=${DJANGO_SECRET_KEY}

# Instalar dependencias del sistema
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        postgresql-client \
        libpq-dev \
        gcc \
        python3-dev \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Crear y establecer el directorio de trabajo
WORKDIR /app

# Crear usuario no privilegiado
RUN groupadd -r django && useradd -r -g django django \
    && chown -R django:django /app

# Copiar requirements.txt
COPY --chown=django:django requirements.txt .

# Instalar dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el código de la aplicación
COPY --chown=django:django . .

# Exponer el puerto
EXPOSE 8000

# Cambiar al usuario no privilegiado
USER django

# Copiar y hacer ejecutable el script de entrada
COPY --chown=django:django docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Establecer el punto de entrada
ENTRYPOINT ["docker-entrypoint.sh"]
