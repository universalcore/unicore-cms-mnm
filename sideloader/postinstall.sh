pip="${VENV}/bin/pip"
cd /var/praekelt/unicore-cms-ffl/ && echo `pwd` && ./install_libgit2 && cd ~/

$pip install cffi praekelt-python-gitmodel /var/praekelt/unicore-cms-ffl/
