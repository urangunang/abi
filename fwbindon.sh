#!/bin/bash

# Clone repo
git clone "https://github.com/urangunang/fwbindon.git"

# Masuk ke direktori repo
cd fwbindon

# Install python3.12
python3.12 -m venv venv
source venv/bin/activate

# Install requirements.txt
pip install -r requirements.txt

# Jalankan main.py
python3.12 main.py
