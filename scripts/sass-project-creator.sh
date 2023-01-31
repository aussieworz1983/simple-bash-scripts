#!/bin/bash

##THIS SCRIPT CREATES A BASIC NODE SASS WEBSITE BUILD SETUP
echo "simple sass web dev setup script"
echo "whats your project folder name"
read input
echo "Setting up web dev env"
mkdir $input
cd $input
mkdir css js sass sass/base sass/abstract sass/components sass/layout sass/pages sass/themes sass/vendor  
touch project-starter.sh css/styles.css index.html js/main.js sass/main.scss sass/base/_base.scss sass/base/_animation.scss sass/base/_typography.scss sass/base/_utilities.scss  sass/abstract/_functions.scss sass/abstract/_mixins.scss sass/abstract/_variables.scss  sass/pages/_home.scss
echo '@import "base/base";
@import "base/animation";
@import "base/typography";
@import "base/utilities";

@import "abstract/functions";
@import "abstract/mixins";
@import "abstract/variables";



@import "pages/home";' >> sass/main.scss
echo '@mixin clearfix{
    &::after{
        content:"";
        display:table;
        clear:both;
    }
}
@mixin hide{
    opacity:0;
    visibility:hidden;
}
@mixin show{
    opacity:1;
    visibility:visible;
}
@mixin abs-center{
    position:absolute;
    top:50%;
    left:50%;
    transform:translate(-50%,-50%);
}
//media-query manager
/*
0-600px phone
600-900px tab portrait
900-1200px tab land
1200 - 1800 normal
1000px + big desktop
args :
-phone
-tab-port
-tab-land
-big-desktop
1em 16px

order@base typo general layout page components
*/
@mixin respond($breakpoint){
    @if $breakpoint == phone {
        @media (max-width:37.5em){//600px
            @content;
        }
    }
    @if $breakpoint == tab-port{
        @media (max-width:56.25em){//900px
            @content;
        }
    }
    @if $breakpoint == tab-land{
        @media (max-width:75em){//12oopx
            @content;
        }
    }
    @if $breakpoint == big-desktop{//1000px
        @media (max-width:112.5em){
            @content;
        }
    }

}'>> sass/abstract/_mixins.scss
echo '@keyframes moveInLeft {
    0% {
        opacity: 0;
        transform: translateX(-10rem);
    }

    80% {
        transform: translateX(2rem);
    }

    100% {
        opacity: 1;
        transform: translate(0);
    }
}

@keyframes moveInRight {
    0% {
        opacity: 0;
        transform: translateX(10rem);
    }

    80% {
        transform: translateX(-2rem);
    }

    100% {
        opacity: 1;
        transform: translate(0);
    }
}

@keyframes moveInButton {
    0% {
        opacity: 0;
        transform: translateY(5rem);
    }

    80% {
        transform: translateY(-3rem);
    }

    100% {
        opacity: 1;
        transform: translate(0);
    }
}' >> sass/base/_animation.scss
echo '*,
* ::after,
*::before {
    padding: 0;
    margin: 0;
    box-sizing: inherit;
}

html {
    font-size: 62.5%;
}

body {
  
    box-sizing: border-box;
}' >> sass/base/_base.scss
echo '<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]>      <html class="no-js"> <!--<![endif]-->
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>New Project</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        <nav></nav>
        <header>
          <h1>Welcome To Your Website</h1>
        </header>
        <main>
         
        </main>
	<footer>This is the footer</footer>
        <script src="js/main.js" async defer></script>
    </body>
</html>' >> index.html
echo '$color-white:#fff;
$color-primary:#55c57a;
$color-primary-light:#7ed56f;
$color-primary-dark:#28b485;
$color-dark-grey:#777;
$color-light-grey:rgb(231, 231, 231);' >> sass/abstract/_variables.scss
echo '#!/bin/bash
	code -r .
	
	npm run devserver 
	' >> project-starter.sh

echo "sass project folders created"
npm init
echo "npm initialized"
echo "writing compile sass to package.json"
head -n 6 package.json > new-package.json
echo '"watch:sass": "node-sass sass/main.scss css/style.css -w",
    "devserver": "live-server",
    "start": "npm-run-all --parallel devserver watch:sass",
    "compile:sass": "node-sass sass/main.scss css/style.comp.css ",
    
    "prefix:css": "postcss --use autoprefixer -b `last 10 versions` css/style.comp.css -o css/style.prefix.css",
    "compress:css": "node-sass css/style.prefix.css css/style.min.css --output-style compressed",
    "build:css": "npm-run-all compile:sass prefix:css compress:css"
  },
  "author": "Your Name",
  "license": "ISC"
}' >> new-package.json
rm package.json
mv new-package.json package.json
echo "installing node-sass"
npm install node-sass --save-dev
npm install postcss --save-dev
npm install postcss-cli --save-dev
npm install concat --save-dev
npm install autoprefixer --save-dev
npm install npm-run-all --save-dev

echo "success"

sh project-starter.sh

