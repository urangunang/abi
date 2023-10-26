#!/bin/bash

# Clone repo
git clone "https://github.com/urangunang/NekoMusicBot.git"

# Masuk ke direktori repo
cd NekoMusicBot

# Unduh Python 3.7
wget https://www.python.org/ftp/python/3.7.12/Python-3.7.12.tgz

# Ekstrak arsip Python 3.7
tar -xzvf Python-3.7.12.tgz

# Masuk ke direktori Python
cd Python-3.7.12

# Konfigurasi, kompilasi, dan instalasi Python
./configure --enable-optimizations
make
sudo make install

# Kembali ke direktori repo
cd ..

# Buat lingkungan virtual Python 3.7
python3.7 -m venv venv

# Aktifkan lingkungan virtual Python 3.7
source venv/bin/activate

# Install requirements.txt
pip install -r requirements.txt

# Ubah nama berkas
mv sample.env .env

# Jalankan main.py
python3 main.py
