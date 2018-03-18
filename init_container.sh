#!/usr/bin/env bash

echo Printing list of environment variables
printenv
echo Done printing environment variables

echo Starting ssh service
service ssh start

# Start Tomcat
echo Starting Tomcat with CATALINA_BASE set to \"$CATALINA_BASE\"
catalina.sh run

