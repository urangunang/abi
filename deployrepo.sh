#!/bin/bash

# Daftar repo yang akan di-clone
repos=("roleplaymenfess" "nekomenfess" "fwbindon" "fwbtelegram" "NekoMusicBot")

# Token GitHub
token="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"

# Loop untuk meng-clone dan menjalankan repo
for repo in "${repos[@]}"; do
    # Clone repo
    git clone "https://$token@github.com/urangunang/$repo.git"

    # Masuk ke direktori repo
    cd $repo

    # Install python3.10 jika repo adalah NekoMusicBot
    if [ "$repo" == "NekoMusicBot" ]; then
        sudo apt-get install python3.10
        python3.10 -m venv venv
        source venv/bin/activate
    fi

    # Install requirements.txt
    pip install -r requirements.txt

    # Jika repo adalah NekoMusicBot, jalankan perintah tambahan
    if [ "$repo" == "NekoMusicBot" ]; then
        mv sample.env .env
        bash neko
    else
        python3.12 main.py &
    fi

    # Keluar dari direktori repo
    cd ..
done

# Gunakan Screen untuk menjalankan semua repo
screen -S "deployed-repos-session"
