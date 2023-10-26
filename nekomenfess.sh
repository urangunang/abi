#!/bin/bash

# Clone repo
git clone "https://github.com/urangunang/nekomenfess.git"

# Masuk ke direktori repo
cd nekomenfess

# Install python3.12
python3.12 -m venv venv
source venv/bin/activate

# Install requirements.txt
pip install -r requirements.txt

# Gunakan Screen untuk menjalankan python3 main.py
screen -dmS nekomenfess-session python3.12 main.py
