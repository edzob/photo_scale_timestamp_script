#!/bin/bash

font="Ubuntu"
pointsize="72"
fill="white"
gravity="SouthEast"
annotate="+100+100"
files="./*.JPG"

for file in $files ; do
   convert "$file" -font "$font" -pointsize "$pointsize" -fill "$white" -gravity "$gravity" -annotate "$annotate" %[exif:DateTimeOriginal] "new-${file}";
done

#todo : Santize filename

# right-ctrl + home
# right-ctrl + L
