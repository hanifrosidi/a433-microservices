#! /bin/bash

# Fungsi untuk build Docker image
build_image() {
    # Menampilkan informasi proses build dimulai
    echo "build image starting.................."
    
    # Build Docker image dengan nama:
    # hanifrosidi/karsajobs-ui:latest
    docker build -t hanifrosidi/karsajobs-ui:latest .
}

# Fungsi untuk login ke Docker Hub
login_docker_repo() {
    # Menampilkan informasi proses login
    echo "login docker hub starting................."
    
    # Menjalankan login Docker Hub
    docker login
}

# Fungsi untuk login github container registry
login_github_container_registry() {
    # Menampilkan informasi proses login dimulai
    echo "login github container registry starting............"

    # Input github token & username
    read -p "Masukkan github token : " token
    read -p "Masukkan username github : " username

    # Menjalankan perintah login Github Container Registry
    echo $token | docker login ghcr.io -u $username --password-stdin
}

# Fungsi untuk push image ke Docker Hub
push_image() {
    # Menampilkan informasi proses push
    echo "push image starting........................"
    
    # Memberikan tag image Docker
    docker tag karsajobs-ui:latest hanifrosidi/karsajobs-ui:latest
    
    # Mengirim image ke Docker Hub repository 
    docker push hanifrosidi/karsajobs-ui:latest
}

push_image_Github_Registry() {
    # Menampilkan informasi proses push
    echo "push image starting..........................."

    # Memberikan tag image docker
    docker tag karsajobs-ui:latest ghcr.io/hanifrosidi/karsajobs-ui:latest

    # Mengirim image ke Github Container Registry
    docker push ghcr.io/hanifrosidi/karsajobs-ui:latest
}

# Fungsi untuk mengakhiri program
finish_program() {
    echo "==========================================================="
    echo "==================Program Finished========================="
    # Informasi clear screen otomatis
    echo "Clear screen automated....................................."
    
    # Delay 3 detik sebelum clear terminal
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
        echo "==============Karsa Jobs UI Image Management==============="
        # Daftar menu
        echo "1. Build Docker Image"
        echo "2. Login To Docker Hub"
        echo "3. Login To Github Container Registry"
        echo "4. Push Docker Image To Docker Hub"
        echo "5. Push Docker Image To Github Container Registry"
        echo "==========================================================="
        # Informasi pilihan menu
        echo "Pilih menu 1-3, dan q untuk keluar program"
        # Membaca input dari user
        read -p "Masukkan pilihan menu: " menu
        # Menampilkan input user
        echo "$menu"
        
        # User input condition
        if [ "$menu" = "1" ]; then
            build_image
        elif [ "$menu" = "2" ]; then
            login_docker_repo
        elif [ "$menu" = "3" ]; then
            login_github_container_registry
        elif [ "$menu" = "4" ]; then
            push_image
        elif [ "$menu" = "5" ]; then
            push_image_Github_Registry
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