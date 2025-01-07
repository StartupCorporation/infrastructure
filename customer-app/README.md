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

The file contains various environment variables that are used for the infrastructure configuration (docker) and for the application itself.

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