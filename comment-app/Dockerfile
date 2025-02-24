ARG GROUP_ID
ARG USER_ID


FROM python:3.12 AS dependencies

COPY --from=src-comment-app requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt --prefix=venv


FROM python:3.12-slim AS base-app
ARG GROUP_ID
ARG USER_ID

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH="/app"

WORKDIR /app

COPY --from=dependencies /venv /usr/local
COPY --from=src-comment-app ./src .

RUN groupadd -g $GROUP_ID appgroup && \
    useradd -u $USER_ID -g $GROUP_ID appuser

USER appuser
