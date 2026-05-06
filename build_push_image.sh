#! /bin/sh

image_menu() {
    while true
    do
        echo "======================================================="
        echo "================DockerImageAutomation=================="
        echo "Please choose menu in list!"
        echo "======================================================="
        echo "1.Build docker image"
        echo "2.Show image list"
        echo "3.Change image name"
        echo "4.Login docker hub"
        echo "5.Push docker image to docker hub"
        echo "q.Quit Program"
        echo "======================================================="
        echo "Choose menu number!"

        read -r menu

        if [ "$menu" = "1" ]
        then
            clear
            docker build -t item-app:1 .
        elif [ "$menu" = "2" ]
        then
            clear
            docker image ls
        elif [ "$menu" = "3" ]
        then
            clear
            echo "change your image"
        elif [ "$menu" = "4" ]
        then
            clear
            docker login
            clear
        elif [ "$menu" = "5" ] 
        then
            clear
            docker tag item-app:1 hanifrosidi/item-app:1
            docker push hanifrosidi/item-app:1
            clear
        elif [ "$menu" = "q" ]
        then
            clear
            echo "=========================================="
            echo "          Program Is Finished             "
            echo "=========================================="
            sleep 3
            clear
            break
        else
            clear
            echo "option is wrong"
        fi
    done
}



main() {
   image_menu
}

main
