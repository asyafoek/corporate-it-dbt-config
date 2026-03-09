#!/bin/bash

echo "Starting dbt execution..."

# install dbt dependencies if packages.yml exists
if [ -f "packages.yml" ]; then
  echo "Installing dbt packages..."
  dbt deps
fi

# check connection
echo "Running dbt debug..."
dbt debug --target "$DBT_TARGET"

# run models
echo "Running dbt models..."
dbt run --target "$DBT_TARGET"

# run tests
echo "Running dbt tests..."
dbt test --target "$DBT_TARGET"

echo "dbt execution finished."