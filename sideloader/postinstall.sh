pip="${VENV}/bin/pip"

cd "/var/${INSTALLDIR}/${REPO}/"

$pip install -e .

ini_files="ffl.*.ini"

for ini in $ini_files
do
    `which eg-tools` resync -c $ini -m unicore.content.models.Category
    `which eg-tools` resync -c $ini -m unicore.content.models.Page
done
