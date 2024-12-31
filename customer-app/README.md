# Customer Microservice Infrastructure

The customer microservice infrastructure-related code.

## Configuration

The `.env.local` is a file to configure the customer microservice. Moreover, it contains functions to run common
commands, such as:

* Start the customer microservice
* Stops the customer microservice
* etc.

## .env.local

### Variables

The file contains the following variables:

```shell
## ======================================
## ==== INFRASTRUCTURE CONFIGURATION ====
## ======================================

## ==== DOCKER
export DOCKER_APPLICATION_EXPOSE_PORT=8000  # Exposed port number of the customer web container
export DOCKER_ASYNCAPI_EXPOSE_PORT=8080  # Exposed port number of the AsyncAPI documentation page
export DOCKER_CUSTOMER_IMAGE_GROUP_ID="$(id -g)" # ID for the user's group inside application container
export DOCKER_CUSTOMER_IMAGE_USER_ID="$(id -u)" # ID for the user inside application container

## ==== WEB APPLICATION
export WEB_APPLICATION_PORT=8000  # What port is listening by the customer application

## ==== ASYNCAPI
export ASYNCAPI_DOCS_PORT=7000  # What port is used by AsyncAPI documentation page

## ===================================
## ==== APPLICATION CONFIGURATION ====
## ===================================

## ==== APPLICATION
export APPLICATION_DEBUG=1  # Is the application running in the debug mode
export APPLICATION_VERSION=0.0.1  # The application version
export APPLICATION_TITLE="Deye Web"  # The application title

## ==== DATABASE
export DATABASE_HOST=database  # Host to connect to the database
export DATABASE_PORT=5432  # Port number to connect to the database
export DATABASE_DATABASE=customer  # The database name to which application is connecting
export DATABASE_USERNAME=customer_user  # The database user to connect
export DATABASE_PASSWORD=customer_password  # The database user's password to connect

## ==== RABBITMQ
export RABBITMQ_USERNAME=dev  # RabbitMQ User's name to connect
export RABBITMQ_PASSWORD=devdev  # RabbitMQ User's password to connect
export RABBITMQ_HOST=rabbitmq  # RabbitMQ host to connect
export RABBITMQ_PORT=5672  # RabbitMQ port to connect

## ==== RABBITMQ QUEUES
export RABBITMQ_QUEUE_CATEGORY__NAME=customer.category.queue  # RabbitMQ category queue name
export RABBITMQ_QUEUE_CATEGORY__DURABLE=1  # Boolean value that indicates whether the RabbitMQ category queue is durable
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
$ customer-up  # Starts the customer microservice 
$ customer-down  # Stops the customer microservice
```