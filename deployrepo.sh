#!/bin/bash

# Daftar repo dan direktori yang akan di-clone
repos=("roleplaymenfess" "nekomenfess" "fwbindon" "fwbtelegram" "NekoMusicBot")
directories=("repo1" "repo2" "repo3" "repo4" "repo5")

# Loop untuk meng-clone dan menjalankan repo
for ((i=0; i<${#repos[@]}; i++)); do
    repo=${repos[i]}
    directory=${directories[i]}

    # Clone repo
    git clone "https://github.com/urangunang/$repo.git" $directory

    # Masuk ke direktori repo
    cd $directory

    # Periksa jika Python 3.10 sudah terinstal
    if [ "$repo" == "NekoMusicBot" ]; then
        python3.10 --version > /dev/null 2>&1
        if [ $? -ne 0 ]; then
            echo "Python 3.10 not installed. Installing..."
            sudo apt-get install python3.10
        fi

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
