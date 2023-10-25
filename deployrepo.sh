#!/bin/bash

# Daftar URL repositori
repos=("https://github.com/urangunang/roleplaymenfess" "https://github.com/urangunang/nekomenfess" "https://github.com/urangunang/fwbindon" "https://github.com/urangunang/fwbtelegram" "https://github.com/urangunang/NekoMusicBot")

# Token GitHub
token="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"

# Loop melalui setiap repositori
for repo in "${repos[@]}"; do
  # Clone repositori
  git clone "$repo"

  # Mendapatkan nama direktori dari URL repositori
  dir_name=$(basename "$repo" .git)

  # Masuk ke direktori repositori
  cd "$dir_name"

  # Install dependensi dari requirements.txt
  pip install -r requirements.txt

  # Jalankan python3 main.py
  python3 main.py

  # Kembali ke direktori awal
  cd ..
done

# Khusus untuk NekoMusicBot
cd "NekoMusicBot"

# Install dependensi dari requirements.txt
pip install -r requirements.txt

# Jalankan perintah khusus
mv sample.env .env
bash neko
