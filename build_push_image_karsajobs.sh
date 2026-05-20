#! /bin/bash

build_image() {
    echo "build image starting.................."
    docker build -t hanifrosidi/karsajobs:latest
}

login_docker_repo() {
    echo "login docker hub starting................."
    docker login
}

push_image() {
    echo "push image starting........................"
    docker tag karsajobs:latest hanifrosidi/karsa-jobs:latest
    docker push hanifrosidi/karsajobs:latest
}

finish_program() {
    echo "==========================================================="
    echo "==================Program Finished========================="
    echo "Clear screen automated....................................."
    sleep 3
    clear
}

main() {
    while true
    do
        echo "==========================================================="
        echo "==============Karsa Jobs Image Management=================="
        echo "1. Build Docker Image"
        echo "2. Login To Docker Hub"
        echo "3. Push Docker Image To Docker Hub"
        echo "==========================================================="
        echo "Pilih menu 1-3, dan q untuk keluar program"

        read -p "Masukkan pilihan menu: " menu
        echo "$menu"
        

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

main