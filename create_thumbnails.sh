#!/bin/bash

FILES=/home/user/blog/reverdecer/images/*.jpg

for f in $FILES; do
  if [ ! -f ${f%%.jpg}_.jpg ] && [[ "${f}" != *_.jpg ]]; then
      exiftool -all:all= -tagsfromfile @ -exif:Orientation "$f"
      rm ${f}_original
      gm convert ${f} -auto-orient -geometry '800>' ${f%%.jpg}_.jpg
      exiftool -exif:Orientation= ${f%%.jpg}_.jpg
      rm  ${f%%.jpg}_.jpg_original
  fi
done
