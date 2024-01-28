#!/bin/bash

#MUST RUN IN NON-VSCODE TERMINAL FOR SVG TO WORK

if [ $# -eq 0 ]
then
    echo "USAGE: export.sh file_name_root"
    echo "No argument supplied, stopping"
    exit 1
fi

mkdir -p export
cp -rp $1.pdf export/.
#Make PNG with Imagemagick (Allow permission with: https://askubuntu.com/questions/1127260/imagemagick-convert-not-allowed)
# convert -density 300 $1.pdf -quality 90 export/$1.png
convert -density 300 $1.pdf -quality 90 -define png:color-type=6 -transparent white  export/$1.png


#Make SVG with inkscape/ghostscript
    #-l is basic svg without extra bells and whistles
    # THIS DOESN'T WORK IN VSCODE TERMINAL (have to run in regular terminal)
# unset GTK_PATH
inkscape -l -o export/$1.svg $1.pdf
