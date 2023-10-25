#!/bin/bash

# Array dengan daftar URL repositori
repos=(
    "https://github.com/urangunang/roleplaymenfess"
    "https://github.com/urangunang/nekomenfess"
    "https://github.com/urangunang/fwbindon"
    "https://github.com/urangunang/fwbtelegram"
    "https://github.com/urangunang/NekoMusicBot"
)

# Loop untuk meng-clone repositori dan menjalankan main.py
for repo_url in "${repos[@]}"
do
    # Ambil nama repositori dari URL
    repo_name=$(basename $repo_url)
    
    # Clone repositori
    git clone $repo_url
    
    # Pindah ke direktori repositori
    cd $repo_name
    
    # Instalasi dependensi menggunakan requirements.txt jika ada
    if [ -f "requirements.txt" ]; then
        pip3 install -r requirements.txt
    fi

    # Jalankan main.py jika ada
    if [ -f "main.py" ]; then
        python3 main.py &
    fi

    # Kembali ke direktori awal
    cd ..
done
