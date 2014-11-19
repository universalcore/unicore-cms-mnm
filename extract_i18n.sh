#!/bin/bash
find . -name '*.mo' -delete
mkdir -p unicorecmsffl/locale

pot-create -o unicorecmsffl/locale/unicorecmsffl.pot unicorecmsffl/

declare -a arr=("eng_GB" "tha_TH" "ind_ID" "swa_TZ" "swa_KE")

for lang in "${arr[@]}"
do
    mkdir -p "unicorecmsffl/locale/""$lang""/LC_MESSAGES"

    if [ ! -f "unicorecmsffl/locale/""$lang""/LC_MESSAGES/unicorecmsffl.po" ]; then
        msginit -l $lang -i unicorecmsffl/locale/unicorecmsffl.pot -o unicorecmsffl/locale/$lang/LC_MESSAGES/unicorecmsffl.po
    fi

    msgmerge --update unicorecmsffl/locale/$lang/LC_MESSAGES/unicorecmsffl.po unicorecmsffl/locale/unicorecmsffl.pot
    msgfmt unicorecmsffl/locale/$lang/LC_MESSAGES/*.po -o unicorecmsffl/locale/$lang/LC_MESSAGES/unicorecmsffl.mo
done
