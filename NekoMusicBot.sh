#!/bin/bash

# Clone repo
git clone "https://github.com/urangunang/NekoMusicBot.git"

# Masuk ke direktori repo
cd NekoMusicBot

# Install Python 3.7.12 dengan pyenv
pyenv install 3.7.12

# Menggunakan Python 3.7.12 dalam lingkungan virtual
pyenv local 3.7.12

# Install requirements.txt
pip install -r requirements.txt

# Ubah nama berkas
mv sample.env .env

# Jalankan bash neko dalam sesi Screen
screen -dmS NekoMusicBot-session bash neko
