#!/bin/sh

#echo "checkstyle >> received [$@]"
java -jar /jars/checkstyle.jar "$@"
