#!/bin/sh
#a shell program for starting new code project
reference(){
   echo "would you like a reference book"
   read decision5
}
editproject(){
  echo "What Language Would U like to Edit"
  ls Programming/
  read decision
  echo "What Project Would U like to Edit"
  ls Programming/$decision/
  read decision2
  ls Programming/$decision/$decison2/
  echo "What file Would u like to open $USER"
  read decision3
  ls Programming/$decision/$decison2/$decision3/
  read decision4
  gvim  Programming/$decision/$decison2/$decision3/$decision4
}
#start of the program
echo "hi $USER would like to start a new project"
read answer
if [ $answer = "no" ]; then
 editproject
else
echo "what language are you writing in "
read language


if [ $language = "shell" ]; then
  
  echo "what is the name of your project"
  read   project
  
  mkdir Programming/shell/$project
  gvim Programming/shell/$project/Main.sh
 # next line opens pdf may change to open selected pdf
 # evince Desktop/ebooks/shellscriptingref/shellref.pdf
 reference 
   
elif 
  [ $language = "web" ]; then
  
  echo "what is the name of your project"
  read project 
  mkdir Programming/webdevelopment/$project
  cd Programming/webdevelopment/$project
  echo "<!DOCTYPE html>" > Index.html
  echo "<html>">> Index.html
  echo "<head>">> Index.html
  echo "<link href="Main.css" type="text/css" rel="stylesheet" />">> Index.html
  echo "<script src="Main.js"></script>">> Index.html 
  echo "<title>$project</title>">> Index.html
  echo "</head>" >> Index.html
  echo "<body>" >> Index.html
  echo "<header>This Is The Header" >> Index.html
  echo "</header>" >> Index.html
  echo "<nav>Nav Bar" >> Index.html
  echo "</nav>" >> Index.html
  echo "<content>Main Content" >> Index.html
  echo "</content>" >> Index.html
  echo "<footer>Copyright Next Level Interactive 2015" >> Index.html
  echo "</footer>" >> Index.html
  echo "</body>" >> Index.html
  echo "</html>" >> Index.html
  echo "html{
          width:100%;
          height:100%;}" > Main.css
  echo "body{
         width:100%;
         height:100%;
         border:solid black;
          }" >> Main.css
  echo "header{
         width:80%;
         height:20%;
         border:solid black;
         background-color:yellow;
         text-align:center;
         font-size:25px;
         margin-left:auto;
         margin-right:auto;
          }" >> Main.css
  echo "nav{
         width:30%;
         height:50%;
         border:solid black;
         float:left;
          }" >> Main.css
  echo "content{
         width:60%;
         height:50%;
         border:solid black;
         float:right;
          }" >> Main.css
  echo "footer{
         width:100%;
         height:20%;
         border:solid black;
         position:absolute;
         bottom:0%;
          }" >> Main.css
  gedit Index.html Main.css Main.js
   
  #touch Main.css
  #touch Main.js
  reference 
elif
  [ $language = "javascript" ]; then
  
  echo "what is the name of your project"
  read project 
  mkdir Programming/javascript/$project
  cd Programming/javascript/$project
  gedit Main.js
  reference 
elif
  [ $language = "meteor" ]; then
  
  echo "what is the name of your project"
  read project 
  mkdir Programming/meteor/$project
  cd Programming/meteor/$project
  meteor create $project
  cd $project
  meteor
  reference 
 elif
   [ $language = "xampp" ]; then
  echo "what is the name of your project"
  read project 
  
  sudo mkdir /opt/lampp/htdocs/$project
   sudo /opt/lampp/lampp start
  cd /opt/lampp/htdocs/$project
  cd
  cd Desktop/programming/php/
  sudo cp index.php /opt/lampp/htdocs/$project  
  cd /opt/lampp/htdocs/$project
  sudo mkdir images
  sudo mkdir fonts
  sudo mkdir js
  
  google-chrome http://localhost/$project
  sudo gedit index.php
elif
   [ $language = "node" ]; then
 echo "what is the name of your project"
  read project 
mkdir Desktop/programming/node/$project
 elif
  [ $language = "quit" -o $language = "" ]; then
  exit 0
else 
  echo "This Language is currently not available "
  echo "add more languages worzel"


exit 0
fi
fi
