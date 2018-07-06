#!/bin/bash


#test

if (( $# != 2 )); then
    echo "Usage: ./resize_image <file.jpg> <pixels>"
    exit
fi


exiftool -all:all= -tagsfromfile @ -exif:Orientation "$1"
rm ${1}_original
gm convert ${1} -auto-orient -geometry $2'>' ${1%%.jpg}_.jpg
exiftool -exif:Orientation= ${1%%.jpg}_.jpg
rm  ${1%%.jpg}_.jpg_original

