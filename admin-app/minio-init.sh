#!/bin/bash

until curl -s "http://localhost:9000/minio/health/live"; do
  echo "Waiting for MinIO to be available..."
  sleep 2
done

MINIO_BUCKET_NAME=${MINIO_BUCKET_NAME:-"deye-admin-files"}
echo "Creating bucket: $MINIO_BUCKET_NAME"

mc alias set myminio http://localhost:9000 ${MINIO_ROOT_USER} ${MINIO_ROOT_PASSWORD}
mc mb myminio/$MINIO_BUCKET_NAME

mc policy set download myminio/$MINIO_BUCKET_NAME
