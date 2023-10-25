#!/bin/bash

# Daftar repo dan direktori yang akan di-clone
repos=("roleplaymenfess" "nekomenfess" "fwbindon" "fwbtelegram" "NekoMusicBot")
directories=("repo1" "repo2" "repo3" "repo4" "repo5")

# Token GitHub
token="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"

# Loop untuk meng-clone dan menjalankan repo
for ((i=0; i<${#repos[@]}; i++)); do
    repo=${repos[i]}
    directory=${directories[i]}

    # Clone repo
    git clone "https://$token@github.com/urangunang/$repo.git" $directory

    # Masuk ke direktori repo
    cd $directory

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
