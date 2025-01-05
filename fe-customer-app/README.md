# Customer Frontend Infrastructure

The customer frontend infrastructure-related code.

## Configuration

The `.env.local` is a file to configure the customer frontend. Moreover, it contains functions to run common
commands, such as:

* Start the frontend
* Stops the frontend
* etc.

## .env.local

### Variables

The file contains the following variables:

```shell
## ======================================
## ==== INFRASTRUCTURE CONFIGURATION ====
## ======================================

## ==== DOCKER
DOCKER_CUSTOMER_FE_APPLICATION_EXPOSE_PORT=4000  # Exposed port number of the customer frontend container


## ======================================
## ==== APPLICATION CONFIGURATION ====
## ======================================

## ==== CUSTOMER FRONTEND APPLICATION
API_URL=http://customer-web-app:8000  # URL of the customer microservice
USE_MOCKS=true  # Is frontend using mocked API
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
$ customer-fe-up  # Starts the customer frontend 
$ customer-fe-down  # Stops the customer frontend
```