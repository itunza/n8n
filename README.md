# App README

This README provides an overview of the app and its configuration.

## Description

The app is built using the n8n platform, which is a workflow automation tool. It allows you to create and automate workflows using a visual interface.

## Configuration

The app requires the following services to be set up:

- PostgreSQL: The app uses a PostgreSQL database for data storage. Make sure to configure the necessary environment variables for the PostgreSQL service.

- Redis: The app uses Redis as a message broker for queueing executions. Configure the necessary environment variables for the Redis service.

## Usage

To use the app, follow these steps:

1. Set up the PostgreSQL and Redis services with the required environment variables.

2. Build and run the app using the provided Docker Compose file.

3. Access the app at the specified `DOMAIN_NAME` and port `HOST_PORT`.

4. Use the n8n visual interface to create and manage workflows.

## Additional Information

For more information on how to use n8n and its features, refer to the official n8n documentation.
