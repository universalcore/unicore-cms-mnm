#!/bin/bash
find . -name '*.mo' -delete
mkdir -p unicorecmsmnm/locale

pot-create -o unicorecmsmnm/locale/unicorecmsmnm.pot unicorecmsmnm/

declare -a arr=("eng_GB")

for lang in "${arr[@]}"
do
    mkdir -p "unicorecmsmnm/locale/""$lang""/LC_MESSAGES"

    if [ ! -f "unicorecmsmnm/locale/""$lang""/LC_MESSAGES/unicorecmsmnm.po" ]; then
        msginit -l $lang -i unicorecmsmnm/locale/unicorecmsmnm.pot -o unicorecmsmnm/locale/$lang/LC_MESSAGES/unicorecmsmnm.po
    fi

    msgmerge --update unicorecmsmnm/locale/$lang/LC_MESSAGES/unicorecmsmnm.po unicorecmsmnm/locale/unicorecmsmnm.pot
    msgfmt unicorecmsmnm/locale/$lang/LC_MESSAGES/*.po -o unicorecmsmnm/locale/$lang/LC_MESSAGES/unicorecmsmnm.mo
done
