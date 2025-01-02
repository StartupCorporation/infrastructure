# Admin Microservice Infrastructure

The admin microservice infrastructure-related code.

## Configuration

The `.env.local` is a file to configure the admin microservice. Moreover, it contains functions to run common
commands, such as:

* Start the admin microservice
* Stops the admin microservice
* etc.

## .env.local

### Variables

The file contains the following variables:

```shell
## ======================================
## ==== INFRASTRUCTURE CONFIGURATION ====
## ======================================

## ==== DOCKER
export DOCKER_ADMIN_APPLICATION_EXPOSE_PORT=8090  # Exposed port number of the admin web container
export DOCKER_MINIO_EXPOSE_PORT_1=9000  # First exposed port number of the minio container
export DOCKER_MINIO_EXPOSE_PORT_2=9001  # Second exposed port number of the minio container

## ===================================
## ==== APPLICATION CONFIGURATION ====
## ===================================

## ==== DATABASE
export DATABASE_HOST=database  # Host to connect to the database
export DATABASE_PORT=5432  # Port number to connect to the database
export DATABASE_DATABASE=admin  # The database name to which application is connecting
export DATABASE_USERNAME=admin_user  # The database user to connect
export DATABASE_PASSWORD=admin_password  # The database user's password to connect

## ==== Minio
export MINIO_ACCESS_KEY=Q3AM3UQ867SPQQA43P2F  # Minio service access key
export MINIO_SECRET_KEY=tfteSlswRu7BJ86wekitnifILbZam1KYY3TG  # Minio service secret key
export MINIO_URL=http://minio:9000  # Minio service URL
```

### Functions

Additionally, the file contains a bunch of functions. They perform common tasks, such as:

* Start the application locally
* Stops the application
* etc.

These functions have a description that you may read for additional information.

To start utilizing these functions, type the following command:
```shell
$ source .env.local
```
After this, they will be loaded in your terminal, and you can use them:
```shell
$ admin-up  # Starts the admin microservice
$ admin-down  # Stops the admin microservice
```