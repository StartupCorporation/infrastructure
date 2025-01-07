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

The file contains various environment variables that are used for the infrastructure configuration (docker).

### Functions

Also, the `.env.local` file contains functions to perform some tasks. For instance, to start deye-web project locally, you can simply run the following commands:
```shell
$ source .env.local  # Imports all environment variables and functions to the terminal
$ deye-up  # Starts the deye-web project
```

All functions have descriptions, so you can look for additional details about them in the `.env.local` file.