#!/bin/bash

set -e

virtualenv ve
source ve/bin/activate
git pull
pip install -e .
pip install --upgrade elastic-git
echo 'Done installing requirements.'
echo 'Cloning repo..'
rm -rf repo/
git clone https://github.com/universalcore/unicore-cms-content-mnm-sn-prod repo
echo 'Creating indexes..'
eg-tools resync -c development.ini -m unicore.content.models.Category -f mappings/category.mapping.json -r true
eg-tools resync -c development.ini -m unicore.content.models.Page -f mappings/page.mapping.json
eg-tools resync -c development.ini -m unicore.content.models.Localisation -f mappings/localisation.mapping.json
echo 'Starting webserver..'
pserve development.ini --reload
