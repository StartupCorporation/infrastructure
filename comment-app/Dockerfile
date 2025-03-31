ARG GROUP_ID
ARG USER_ID


FROM python:3.13 AS dependencies
COPY --from=comment-app requirements/requirements.web.txt requirements/requirements.queue.txt requirements/requirements.migration.txt .
COPY --from=shared-kernel . shared_kernel/
RUN pip install --no-cache-dir -r requirements.web.txt --prefix=web-service-venv && \
    pip install --no-cache-dir -r requirements.queue.txt --prefix=queue-consumer-venv && \
    pip install --no-cache-dir -r requirements.migration.txt --prefix=migration-service-venv


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
COPY --from=dependencies /web-service-venv /usr/local
COPY --from=comment-app ./src .
USER appuser


FROM base-app AS queue-consumer
COPY --from=dependencies /queue-consumer-venv /usr/local
COPY --from=comment-app ./src .
USER appuser


FROM base-app AS migration-service
COPY --from=dependencies /migration-service-venv /usr/local
COPY --from=comment-app ./src .
WORKDIR /app/infrastructure/database/relational/migrations
USER appuser
