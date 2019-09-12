#!/bin/bash
#Developed By Next Level Interactive 2016
options=("Update" "Fresh Install" "Quit" )
update(){
   echo "Update process starting" ;
   find /home/aussie/.kodi/ -type d -exec rm -R {} \;
   wget https://www.dropbox.com/s/57dq5fbk7b0vqp5/BuildTemplate.zip?dl=1
  # mkdir .kodi
   mv BuildTemplate.zip?dl=1 BuildTemplate.zip
   unzip BuildTemplate.zip -d /home/aussie/.kodi/
}
echo "This Is The Linux Kodi Updater From Project Free Your Tv";
if [ -d .kodi ]; then
    # Will enter here if $DIRECTORY exists, even if it contains spaces
echo "Kodi is installed";
fi

echo "Is this a fresh install or are you looking to update";
select opt in "${options[@]}"
do
  case $opt in 
    "Update")
     echo " Update"
     update
      ;;
     "Fresh Install")
     echo "Performing Fresh Install"
     
      ;;
   
     "Quit")
     break
     ;;
     *) echo invalid option;;
    esac
  done

