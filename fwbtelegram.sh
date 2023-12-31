#!/bin/bash

# Clone repo
git clone "https://github.com/urangunang/fwbtelegram.git"

# Masuk ke direktori repo
cd fwbtelegram

# Install python3.12
python3.12 -m venv venv
source venv/bin/activate

# Install requirements.txt
pip install -r requirements.txt

# Jalankan main.py
screen -dmS fwbtelegram-session python3.12 main.py
