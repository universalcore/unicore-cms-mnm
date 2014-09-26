#!/bin/bash
find . -name '*.mo' -delete
mkdir -p unicorecmsffl/locale

pot-create -o unicorecmsffl/locale/unicorecmsffl.pot unicorecmsffl/

mkdir -p unicorecmsffl/locale/eng_UK/LC_MESSAGES
mkdir -p unicorecmsffl/locale/swh_TZ/LC_MESSAGES
mkdir -p unicorecmsffl/locale/swh_KE/LC_MESSAGES
mkdir -p unicorecmsffl/locale/tha_TH/LC_MESSAGES
mkdir -p unicorecmsffl/locale/ind_ID/LC_MESSAGES

# only uncomment if it's the 1st time
#msginit -l eng_UK -i unicorecmsffl/locale/unicorecmsffl.pot -o unicorecmsffl/locale/eng_UK/LC_MESSAGES/unicorecmsffl.po
#msginit -l swh_TZ -i unicorecmsffl/locale/unicorecmsffl.pot -o unicorecmsffl/locale/swh_TZ/LC_MESSAGES/unicorecmsffl.po
#msginit -l swh_KE -i unicorecmsffl/locale/unicorecmsffl.pot -o unicorecmsffl/locale/swh_KE/LC_MESSAGES/unicorecmsffl.po
#msginit -l tha_TH -i unicorecmsffl/locale/unicorecmsffl.pot -o unicorecmsffl/locale/tha_TH/LC_MESSAGES/unicorecmsffl.po
#msginit -l ind_ID -i unicorecmsffl/locale/unicorecmsffl.pot -o unicorecmsffl/locale/ind_ID/LC_MESSAGES/unicorecmsffl.po

msgmerge --update unicorecmsffl/locale/eng_UK/LC_MESSAGES/unicorecmsffl.po unicorecmsffl/locale/unicorecmsffl.pot
msgmerge --update unicorecmsffl/locale/swh_TZ/LC_MESSAGES/unicorecmsffl.po unicorecmsffl/locale/unicorecmsffl.pot
msgmerge --update unicorecmsffl/locale/swh_KE/LC_MESSAGES/unicorecmsffl.po unicorecmsffl/locale/unicorecmsffl.pot
msgmerge --update unicorecmsffl/locale/tha_TH/LC_MESSAGES/unicorecmsffl.po unicorecmsffl/locale/unicorecmsffl.pot
msgmerge --update unicorecmsffl/locale/ind_ID/LC_MESSAGES/unicorecmsffl.po unicorecmsffl/locale/unicorecmsffl.pot

msgfmt unicorecmsffl/locale/eng_UK/LC_MESSAGES/*.po -o unicorecmsffl/locale/eng_UK/LC_MESSAGES/unicorecmsffl.mo
msgfmt unicorecmsffl/locale/swh_TZ/LC_MESSAGES/*.po -o unicorecmsffl/locale/swh_TZ/LC_MESSAGES/unicorecmsffl.mo
msgfmt unicorecmsffl/locale/swh_KE/LC_MESSAGES/*.po -o unicorecmsffl/locale/swh_KE/LC_MESSAGES/unicorecmsffl.mo
msgfmt unicorecmsffl/locale/tha_TH/LC_MESSAGES/*.po -o unicorecmsffl/locale/tha_TH/LC_MESSAGES/unicorecmsffl.mo
msgfmt unicorecmsffl/locale/ind_ID/LC_MESSAGES/*.po -o unicorecmsffl/locale/ind_ID/LC_MESSAGES/unicorecmsffl.mo
