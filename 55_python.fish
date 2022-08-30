set -x

brew install pyright

# poetry - dependencies management
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python

pip install virtualfish
