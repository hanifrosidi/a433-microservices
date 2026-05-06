#! /bin/sh

image_menu() {
    while true
    do
        echo "======================================================="
        echo "================DockerImageAutomation=================="
        echo "Please choose menu in list!"
        echo "======================================================="
        echo "1.Build docker image"
        echo "2.show image list"
        echo "3.change image name"
        echo "4.login docker hub"
        echo "5.push docker image to docker hub"
        echo "q.for quit"
        echo "======================================================="
        echo "Choose menu number!"

        read -r menu

        if [ "$menu" = "1" ]
        then
            docker build -t item-app:1
        elif [ "$menu" = "2" ]
        then 
            docker image ls
        elif [ "$menu" = "3" ]
        then
            echo "change your image"
        elif [ "$menu" = "4" ]
        then
            docker login
        elif [ "$menu" = "5" ] 
        then
            docker tag item-app:1 hanifrosidi/item-app:1
            docker push hanifrosidi/item-app:1
        elif [ "$menu" = "q" ]
        then
            echo "program is finish"
            echo "clear screan"
            sleep 3
            clear
            break
        else 
            echo "option is wrong"
        fi

    done
}



main() {
   image_menu
}

main
