#! /bin/bash

# Fungsi untuk melakukan build docker image
build_image() {
    # Menampilkan informasi proses build dimulai
    echo "build image starting.................."

    # Build Docker image dengan tag:
    # hanifrosidi/karsajobs:latest
    docker build -t hanifrosidi/karsajobs:latest .
}

# Fungsi untuk login docker hub
login_docker_repo() {
    # Menampilkan informasi proses login dimulai
    echo "login docker hub starting................."
    # Menjalankan perintah login Docker Hub
    docker login
}

# Fungsi untuk push image ke Docker hub
push_image() {
    # Menampilkan informasi proses push dimulai
    echo "push image starting........................"
    
    # Memberikan tag baru pada image Docker
    docker tag karsajobs:latest hanifrosidi/karsa-jobs:latest

    # Mengirim image ke Docker Hub repository
    docker push hanifrosidi/karsajobs:latest
}

# Fungsi untuk mengakhiri program
finish_program() {
    # Display Program Finish
    echo "==========================================================="
    echo "==================Program Finished========================="


    # Informasi clear screen otomatis
    echo "Clear screen automated....................................."

    # Menunggu selama 3 detik
    sleep 3

    # Membersihkan tampilan terminal
    clear
}

# Fungsi utama program
main() {
    while true
    do
        # Menampilkan header menu
        echo "==========================================================="
        echo "==============Karsa Jobs Image Management=================="
        
        # Menu pilihan
        echo "1. Build Docker Image"
        echo "2. Login To Docker Hub"
        echo "3. Push Docker Image To Docker Hub"
        echo "==========================================================="
        
        # Informasi input menu
        echo "Pilih menu 1-3, dan q untuk keluar program"

        # Membaca input user
        read -p "Masukkan pilihan menu: " menu

        # Menampilkan input user
        echo "$menu"
        
        # User input condition
        if [ "$menu" = "1" ]; then
            build_image
        elif [ "$menu" = "2" ]; then
            login_docker_repo
        elif [ "$menu" = "3" ]; then
            push_image
        elif [ "$menu" = "q" ]; then
            finish_program
            break
        else
            echo "Pilihan tidak valid"
            sleep 1
            clear
        fi
    done

}

# Menjalankan fungsi utama
main