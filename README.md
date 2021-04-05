# Timestamp and scale all the images.

This is done via one of these scripts:
1. ***timestamp.sh***
1. ***ttimestamp-rescale.sh***


This script is using:
1. 'convert' and 'identify', which is part of 'imagemagick'.
1. 'tr', 'echo', 'cut', which is part of bash.
1. the font Roboto, which you can replace in the script by another.

**You need to install imagemagick.**

## install
- ```sudo apt install imagemagick```

### test install 
- ```convert logo: logo.gif```
- ```convert -version```
- ```identify -version```

## List fonts to see if roboto is there.
- ```fc-list | grep -i arial```
- ```convert -list font|grep Liberation-Sans```

## Used resources
### On CONVERT
1. https://legacy.imagemagick.org/Usage/annotating/
1. https://legacy.imagemagick.org/Usage/draw/#annotate
1. https://legacy.imagemagick.org/script/command-line-options.php?#annotate

### On drawing with ImageMagick
1. http://www.imagemagick.org/script/command-line-processing.php#geometry

### On ImageMagick
1. https://github.com/ImageMagick/ImageMagick
1. https://techpiezo.com/linux/install-imagemagick-in-ubuntu-20-04-lts

### On BASH
1. https://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-5.html
1. https://tldp.org/LDP/abs/html/varassignment.html
1. https://www.cyberciti.biz/faq/bash-loop-over-file
1. https://linuxize.com/post/bash-concatenate-strings
1. https://en.wikibooks.org/wiki/Cut
1. https://www.geeksforgeeks.org/date-command-linux-examples/

### On CODE
#### in regards to Timestamp
1.  https://ubuntuforums.org/showthread.php?t=1235238
1. https://legacy.imagemagick.org/discourse-server/viewtopic.php?t=20213
1. https://legacy.imagemagick.org/discourse-server/viewtopic.php?t=9155
1. https://stackoverflow.com/questions/51922126/how-to-format-date-and-time-with-imagemagicks-identify-utility
1. https://stackoverflow.com/questions/26654709/extract-exif-data-as-text-using-imagemagick

#### in regards to Resize
1. https://stackoverflow.com/questions/8707694/batch-resize-images-into-new-folder-using-imagemagick
1. https://askubuntu.com/questions/135477/how-can-i-scale-all-images-in-a-folder-to-the-same-width
1. https://askubuntu.com/questions/1068850/resize-multiple-images-with-imagemagick-from-a-folder-to-other-and-keep-the-nam
1. https://gordonlesti.com/imagemagick-resize-all-images-in-a-directory/
1. https://legacy.imagemagick.org/Usage/resize/#sample
1. https://askubuntu.com/questions/135477/how-can-i-scale-all-images-in-a-folder-to-the-same-width
1. https://askubuntu.com/questions/135477/how-can-i-scale-all-images-in-a-folder-to-the-same-width

### FONT
1. https://askubuntu.com/questions/673615/imagemagick-convert-command-cannot-use-fonts

## Example code
### of Timestamp
- ``` identify -format '%[EXIF:*]' image.jpg```
- ``` datetime=$(identify -format "%[EXIF:DateTime]" P1050001.JPG | tr " " "_" | tr ":" "-")```
- ``` inname=$(identify -format "%t" P1050001.JPG)```
- ``` convert P1050001.JPG ${inname}_${datetime}.jpg```

- ```:: Add the date the photo was taken to the image ```
- ``` convert %1 -pointsize 20 -fill black -gravity northwest ^```
- ``` -annotate +0+0 "Date: %DateTime%" "%~p1date_%~n1.jpg"```

- ``` convert fotosin\*.jpg -font Arial -pointsize 32 -fill white -annotate +30+50 %[exif:DateTimeOriginal] \fotosout```

### of Resize
- ```convert -define jpeg:size=250x200 *.jpg  -thumbnail 250x200^ -gravity center -extent 250x200  crop/thumbnail-%d.jpeg```
- ```for i in `ls -1 *jpg`; do convert -resize 50% $i "thumb_$i"; done```
- ```convert image_file.png -resize 300x300 image_file_resize.png```
- ```convert "images/*.jpg[250x]" -set filename:base "%[basename]" "images/new_folder/%[filename:base].jpg"```

# LICENSE
CC BY-SA 4.0
https://github.com/edzob/photo_scale_timestamp_script