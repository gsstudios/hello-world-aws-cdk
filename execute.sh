#!/bin/sh

#
# execute.sh: script for executing different functions for the hello-world project
# author: Joshua Lay
# created: 07/01/20
#

# Check if docker is installed
if [ ! $(command -v docker) ]; then
    echo "Please install docker on your system. Visit: https://docs.docker.com/engine/install/"
    exit 1
fi

# Handle command line args
if [ "$#" -gt 0 ]; then
    docker-compose build $1
    docker-compose run --service-ports $1
else
    echo "Syntax: ./execute {serve|deploy|destroy}"
    echo "option 'serve': serve the hello world application locally"
    echo "option 'deploy': deploy the hello world application onto AWS via CDK"
    echo "option 'destroy': destroy the hello world cloudformation stack (if applicable)"
fi