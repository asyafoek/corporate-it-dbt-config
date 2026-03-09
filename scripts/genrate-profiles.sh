#!/bin/bash

echo "Generating dbt profile..."

# ensure ~/.dbt exists
mkdir -p "$HOME/.dbt"

# create profiles.yml
cat > "$HOME/.dbt/profiles.yml" <<EOF
multi_layer_profile:
  target: ${DBT_TARGET}
  outputs:
    ${DBT_TARGET}:
      type: postgres
      host: ${PROC_DB_HOST}
      user: ${PROC_DB_USER}
      password: ${PROC_DB_PASS}
      dbname: ${PROC_DB_NAME}
      schema: ${DBT_PROCESSED_SCHEMA}
EOF

echo "profiles.yml created at $HOME/.dbt/profiles.yml"
echo "-----"
cat "$HOME/.dbt/profiles.yml"
echo "-----"