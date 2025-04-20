ARG GROUP_ID
ARG USER_ID
ARG INSTALL_LOCAL_SHARED_KERNEL


FROM python:3.13 AS dependencies
COPY --from=order-app requirements/requirements.web.txt requirements/requirements.queue.txt .
RUN pip install --no-cache-dir -r requirements.web.txt --prefix=web-service-venv && \
    pip install --no-cache-dir -r requirements.queue.txt --prefix=queue-consumer-venv


FROM python:3.13-slim AS base-app
ARG GROUP_ID
ARG USER_ID
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH="/app"
WORKDIR /app
RUN groupadd -g $GROUP_ID appgroup && \
    useradd -u $USER_ID -g $GROUP_ID appuser && \
    chown appuser /app


FROM base-app AS backend-app
ARG INSTALL_LOCAL_SHARED_KERNEL
COPY --from=dependencies /web-service-venv /usr/local
COPY --from=order-app ./src .
COPY --from=shared-kernel . /shared_kernel/
RUN ($INSTALL_LOCAL_SHARED_KERNEL && pip install -e /shared_kernel/) || true
USER appuser


FROM base-app AS queue-consumer
ARG INSTALL_LOCAL_SHARED_KERNEL
COPY --from=dependencies /queue-consumer-venv /usr/local
COPY --from=order-app ./src .
COPY --from=shared-kernel . /shared_kernel/
RUN ($INSTALL_LOCAL_SHARED_KERNEL && pip install -e /shared_kernel/) || true
USER appuser


FROM base-app AS migration-service
ENV PATH="/app/scripts:${PATH}"
COPY --from=order-app requirements/requirements.migration.txt .
RUN mkdir ./scripts && \
    echo '#!/bin/bash\nyoyo apply -d postgres://${DATABASE_USERNAME}:${DATABASE_PASSWORD}@${DATABASE_HOST}:${DATABASE_PORT}/${DATABASE_DATABASE}' > /app/scripts/migration-run && \
    echo '#!/bin/bash\nyoyo rollback -d postgres://${DATABASE_USERNAME}:${DATABASE_PASSWORD}@${DATABASE_HOST}:${DATABASE_PORT}/${DATABASE_DATABASE}' > /app/scripts/migration-rollback && \
    chmod +x ./scripts/migration-run ./scripts/migration-rollback && \
    pip install --no-cache-dir -r requirements.migration.txt && \
    rm requirements.migration.txt
WORKDIR /app/migrations
COPY --from=order-app ./src/infrastructure/database/relational/migrations/ .
USER appuser
