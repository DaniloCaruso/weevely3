#!/bin/bash
set -e

BASE_FOLDER="`python -c 'from tests import config;print(config.base_folder)'`"
AGENT="`python -c 'from tests import config;print(config.agent)'`"
URL="`python -c 'from tests import config;print(config.url)'`"
PWD="`python -c 'from tests import config;print(config.password)'`"

# Generic environment setting install
mkdir -p "$BASE_FOLDER"
python ./weevely.py generate "$PWD" "$AGENT"

service apache2 start
service mysql start

sleep 10000