#!/bin/bash

# Automated login
/opt/homebrew/bin/fly -t demo login -c "http://localhost:8080" -u test -p test

# Clear the task's cache, if any
/opt/homebrew/bin/fly -t demo clear-task-cache --job java-api-pipeline/compile-app --step task1

# Unpause the pipeline
/opt/homebrew/bin/fly -t demo unpause-pipeline -p java-api-pipeline

# Trigger the first job in the pipeline
/opt/homebrew/bin/fly -t demo trigger-job --job java-api-pipeline/compile-app

