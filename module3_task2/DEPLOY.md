# Deploy FAQ

## What is in the archive and how to unarchive it?

The archive contains the files needed to deploy the awesome website.
To unarchive it, run the following command: `unzip awesome-website.zip`

## What are the commands to start and stop the application?

To start the application, use the command `make run`.

## How to customize where the application logs are written?

You can customize the location of the application logs by changing the
name "awesome-api.log" in the Makefile.

## How to "quickly" verify that the application is running (healthcheck)?

You can verify that the application is running by executing `make test`
or by running a curl command from the terminal to localhost.
