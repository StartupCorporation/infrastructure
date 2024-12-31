# Deye Web Infrastructure

Repository for handling the Deye Web project infrastructure.

## Structure

The repository contains infrastructure for deye-web applications:
* Customer microservice
* Admin microservice
* Customer frontend application
* Admin frontend application
* Deye-web core infrastructure

All this stuff is located in corresponding directories, like:
* Customer microservice's infrastructure -> `customer-app` directory
* Admin microservice's infrastructure -> `admin-app` directory
* etc.

If you need infrastructure changes for your application, commit them to your application infrastructure directory.

If core infrastructure logic needs to be changed, update `docker-compose*` or `.env*` files in the root of this repository.


## .env.local

All logic and configuration of `deye-web` for local development are located in the `.env.local` file.

The file contains environment variables that configure our resources and services. Additionally, it has functions to 
simplify executing project-common tasks:
* Start the core infrastructure
* Start the whole project
* etc.

### Variables

The following environment variables are used to configure the project:
```shell
## ======================================
## ==== INFRASTRUCTURE CONFIGURATION ====
## ======================================

## ==== DOCKER
export DOCKER_DB_EXPOSE_PORT=6543  # Exposed port number for the database
export DOCKER_RABBITMQ_EXPOSE_PORT=15672  # Exposed port number for the RabbitMQ client

## ==== RABBITMQ
export RABBITMQ_USERNAME=dev  # The user's name inside RabbitMQ service
export RABBITMQ_PASSWORD=devdev  # The user's password inside RabbitMQ service

## ==== RESOURCES SETUP RABBITMQ
export SETUP_RABBITMQ_HOST=rabbitmq  # The RabbitMQ host to connect to perform setup steps 
export SETUP_RABBITMQ_PORT=15672  # The RabbitMQ port to connect to perform setup steps
export SETUP_RABBITMQ_USERNAME=dev  # The RabbitMQ user's name
export SETUP_RABBITMQ_PASSWORD=devdev  # The RabbitMQ user's password
export SETUP_RABBITMQ_CATEGORY_QUEUE=customer.category.queue  # The RabbitMQ category queue name to create
export SETUP_RABBITMQ_EXCHANGE_NAME=deye_web.direct  # The RabbitMQ exchange name

## ==== RESOURCES SETUP DATABASE
export SETUP_DB_HOST=database  # The database host to connect to perform setup steps
export SETUP_DB_PORT=5432  # The database port to connect to perform setup steps
export SETUP_DB_USERNAME=dev  # The database super user's name
export SETUP_DB_PASSWORD=devdev  # The database super user's password
export SETUP_DB_ADMIN_DATABASE=admin  # The admin application database name
export SETUP_DB_ADMIN_USERNAME=admin_user  # The admin application database user's name
export SETUP_DB_ADMIN_PASSWORD=admin_password  # The admin application database user's password
export SETUP_DB_CUSTOMER_DATABASE=customer  # The customer application database name
export SETUP_DB_CUSTOMER_USERNAME=customer_user  # The customer application database user's name
export SETUP_DB_CUSTOMER_PASSWORD=customer_password  # The customer application database user's password

## ==== DATABASE
export POSTGRES_USERNAME=dev  # The database super user's name to create
export POSTGRES_PASSWORD=devdev  # The database super user's password
```

### Functions

Also, the `.env.local` file contains functions to perform some tasks. For instance, to start deye-web project locally, you can simply run the following commands:
```shell
$ source .env.local  # Imports all environment variables and functions to the terminal
$ deye-up  # Starts the deye-web project
```

All functions have descriptions, so you can look for additional details about them in the `.env.local` file.