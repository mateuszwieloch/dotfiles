set -x

# pip and venv - because Ubuntu comes without them! <facepalm>
sudo apt install --yes python3-pip python3.8-venv

# pipx - for end-user applications
python3 -m pip install --user pipx
python3 -m pipx ensurepath

# pipx completions - I put them manually in ~/.config/fish/config.fish because idk any better
# register-python-argcomplete --shell fish pipx | source

# poetry
pipx install poetry

# poetry completions - I manually generated them and put them in ~/.config/fish/completions/poetry.fish because idk any better
# poetry completions fish > ~/.config/fish/completions/poetry.fish
