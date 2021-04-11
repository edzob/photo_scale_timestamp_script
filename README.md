# Timestamp and scale all the images.

This is done via one of these scripts:
1. ***timestamp.sh***, to add a timestamp from the EXIF data to the image.
1. ***timestamp-rescale.sh***, to scale an image into a smaller image.
1. ***upload2google.sh***, to upload the dir to a specific google drive location.

These scripts is using:
1. 'convert' and 'identify', which is part of 'imagemagick'.
1. the font Roboto, which you can replace in the script by another.
1. Part of every GNU ecosystem:
  1. 'bash' (for running script).
  1. 'date' function/application.
  1. 'echo'  (for overal usage).
  1. 'tr', 'cut'  (for date format).
  1. 'grep', 'ls', 'wc' (for progressbar).

## Backlog
1. count input files
1. count timestamped files
1. count scaled files
1. start, stop, duration time feedback

**You need to install imagemagick.**

## install
- ```sudo apt install imagemagick```
- ```sudo apt install parallel```

### test install 
- ```convert logo: logo.gif```
- ```convert -version```
- ```identify -version```

## List fonts to see if roboto is there.
- ```fc-list | grep -i arial```
- ```convert -list font|grep Liberation-Sans```

## Used resources
### On CONVERT
1. https://legacy.imagemagick.org/Usage/annotating
1. https://legacy.imagemagick.org/Usage/draw/#annotate
1. https://legacy.imagemagick.org/script/command-line-options.php?#annotate

### On drawing with ImageMagick
1. http://www.imagemagick.org/script/command-line-processing.php#geometry

### On ImageMagick
1. https://github.com/ImageMagick/ImageMagick
1. https://techpiezo.com/linuxinstall-imagemagick-in-ubuntu-20-04-lts

### On BASH
1. https://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-5.html
1. https://tldp.org/LDP/abs/html/varassignment.html
1. https://www.cyberciti.biz/faq/bash-loop-over-file
1. https://linuxize.com/post/bash-concatenate-strings
1. https://en.wikibooks.org/wiki/Cut
1. https://www.geeksforgeeks.org/date-command-linux-examples
1. https://www.cyberciti.biz/faq/check-if-a-directory-exists-in-linux-or-unix-shell
1. https://www.cyberciti.biz/faq/howto-check-if-a-directory-exists-in-a-bash-shellscript

#### in regards to Progress bar
1. https://stackoverflow.com/questions/238073/how-to-add-a-progress-bar-to-a-shell-script
1. https://stackoverflow.com/questions/12498304/using-bash-to-display-a-progress-indicator
1. https://stackoverflow.com/questions/38339434/making-simple-shell-progress-bar
1. https://stackoverflow.com/questions/23630501/how-to-progress-bar-in-bash

#### in regards to count files
1. https://stackoverflow.com/questions/11307257/is-there-a-bash-command-which-counts-files

#### in regards to seconds and minutes
1. https://stackoverflow.com/questions/8903239/how-to-calculate-time-elapsed-in-bash-script

#### in regards to parrrel 
1. https://stackoverflow.com/questions/29058741/need-to-cropresize-300000-files-runtime-4-days-how-can-i-speed-up-my-bash
1. https://www.gnu.org/software/bash/manual/html_node/GNU-Parallel.html
1. https://www.gnu.org/software/parallel/parallel_tutorial.html
1. https://www.cyberciti.biz/faq/how-to-run-command-or-code-in-parallel-in-bash-shell-under-linux-or-unix/
1. https://saveriomiroddi.github.io/Running-shell-commands-in-parallel-via-gnu-parallel
1. https://unix.stackexchange.com/questions/103920/parallelize-a-bash-for-loop
1. https://unix.stackexchange.com/questions/101632/running-thousands-of-curl-background-processes-in-parallel-in-bash-script
1. https://unix.stackexchange.com/questions/575327/can-gnu-parallel-execute-a-bash-script-25000-times-per-seconds-and-parallel-proc

### On CODE
#### in regards to Timestamp with imagemagick
1.  https://ubuntuforums.org/showthread.php?t=1235238
1. https://legacy.imagemagick.org/discourse-server/viewtopic.php?t=20213
1. https://legacy.imagemagick.org/discourse-server/viewtopic.php?t=9155
1. https://stackoverflow.com/questions/51922126/how-to-format-date-and-time-with-imagemagicks-identify-utility
1. https://stackoverflow.com/questions/26654709/extract-exif-data-as-text-using-imagemagick

#### in regards to Resize with imagemagick
1. https://stackoverflow.com/questions/8707694/batch-resize-images-into-new-folder-using-imagemagick
1. https://askubuntu.com/questions/135477/how-can-i-scale-all-images-in-a-folder-to-the-same-width
1. https://askubuntu.com/questions/1068850/resize-multiple-images-with-imagemagick-from-a-folder-to-other-and-keep-the-nam
1. https://gordonlesti.com/imagemagick-resize-all-images-in-a-directory
1. https://legacy.imagemagick.org/Usage/resize/#sample
1. https://askubuntu.com/questions/135477/how-can-i-scale-all-images-in-a-folder-to-the-same-width
1. https://askubuntu.com/questions/135477/how-can-i-scale-all-images-in-a-folder-to-the-same-width

### on FONT
1. https://askubuntu.com/questions/673615/imagemagick-convert-command-cannot-use-fonts
1. https://legacy.imagemagick.org/Usage/fonts/


### on Google drive
1. https://techstreams.medium.com/git-google-drive-simple-git-host-3a84db4fc1fd
1. https://github.com/labbots/google-drive-upload
1. https://towardsdatascience.com/uploading-files-to-google-drive-directly-from-the-terminal-using-curl-2b89db28bb06


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
