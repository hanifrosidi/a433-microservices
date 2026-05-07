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

        # Get input user and store in menu variable
        read -r menu

        # Checking condition menu choice 1,2,3,4,5 
        if [ "$menu" = "1" ]
        then
            # If choice 1 clear screen & Build image
            clear
            docker build -t item-app:1 .
        elif [ "$menu" = "2" ]
        then
            # If choice 2 clear screen & show list docker image
            clear
            docker image ls
        elif [ "$menu" = "3" ]
        then
            # If choice 3 clear screen & add tag already image with name structure docker hub
            clear
            echo "change image with docker hub format"
            docker tag item-app:1 hanifrosidi/item-app:1
            echo "change name is succesfull"
            sleep 3
            clear
        elif [ "$menu" = "4" ]
        then
            # If choice 4 clear screen & login to docker hub
            clear
            docker login
            clear
        elif [ "$menu" = "5" ] 
        then
            # If choice 5 clear screen & tag image and then push to docker hub
            clear
            docker tag item-app:1 hanifrosidi/item-app:1
            docker push hanifrosidi/item-app:1
            clear
        elif [ "$menu" = "q" ]
        then
            # If choice q program is ended & clear screen
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
    # Run image_menu function 
   image_menu
}

main
