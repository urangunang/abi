#!/bin/bash

# Clone repo
git clone "https://github.com/urangunang/NekoMusicBot.git"

# Masuk ke direktori repo
cd NekoMusicBot

# Install python3.10
sudo apt-get install python3.10
python3.10 -m venv venv
source venv/bin/activate

# Install requirements.txt
pip install -r requirements.txt

# Ubah nama berkas
mv sample.env .env

# Jalankan bash neko
screen -dmS NekoMusicBot-session bash neko
