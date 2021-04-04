# photo_scale_timestamp_script


This script is using 'convert' which is part of 'imagemagick'

# You need to install imagemagick. 

## install
```sudo apt install imagemagick```

## test install 
```convert logo: logo.gif```
```convert -version```
```identify -version```

## List fonts
```fc-list | grep -i arial```
```convert -list font|grep Liberation-Sans```

# Used resources
## CONVERT
1. https://legacy.imagemagick.org/Usage/annotating/
1. https://legacy.imagemagick.org/Usage/draw/#annotate
1. https://legacy.imagemagick.org/script/command-line-options.php?#annotate

## ImageMagick
1. https://github.com/ImageMagick/ImageMagick
1. https://techpiezo.com/linux/install-imagemagick-in-ubuntu-20-04-lts

## BASH
1. https://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-5.html
1. https://tldp.org/LDP/abs/html/varassignment.html
1. https://www.cyberciti.biz/faq/bash-loop-over-file
1. https://linuxize.com/post/bash-concatenate-strings
1. https://en.wikibooks.org/wiki/Cut
1. https://www.geeksforgeeks.org/date-command-linux-examples/

## CODE
1.  https://ubuntuforums.org/showthread.php?t=1235238
1. https://legacy.imagemagick.org/discourse-server/viewtopic.php?t=20213
1. https://legacy.imagemagick.org/discourse-server/viewtopic.php?t=9155
1. https://stackoverflow.com/questions/51922126/how-to-format-date-and-time-with-imagemagicks-identify-utility
1. https://stackoverflow.com/questions/26654709/extract-exif-data-as-text-using-imagemagick

## FONT
1. https://askubuntu.com/questions/673615/imagemagick-convert-command-cannot-use-fonts

# Example code
``` identify -format '%[EXIF:*]' image.jpg```
``` datetime=$(identify -format "%[EXIF:DateTime]" P1050001.JPG | tr " " "_" | tr ":" "-")```
``` inname=$(identify -format "%t" P1050001.JPG)```
``` convert P1050001.JPG ${inname}_${datetime}.jpg```

```:: Add the date the photo was taken to the image ```
``` convert %1 -pointsize 20 -fill black -gravity northwest ^```
``` -annotate +0+0 "Date: %DateTime%" "%~p1date_%~n1.jpg"```

``` convert fotosin\*.jpg -font Arial -pointsize 32 -fill white -annotate +30+50 %[exif:DateTimeOriginal] \fotosout```

# LICENSE
CC BY-SA 4.0
https://github.com/edzob/photo_scale_timestamp_script