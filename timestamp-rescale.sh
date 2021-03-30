#!/bin/bash

font="Ubuntu"
pointsize="72"
fill="white"
gravity="SouthEast"
annotate="+100+100"
FILES="./photo/*.JPG"

for file in $FILES ; do
   convert "$file" -font "$font" -pointsize "$pointsize" -fill "$white" -gravity "$gravity" -annotate "$annotate" %[exif:DateTimeOriginal] "new-${file}";
done

#todo : Santize filename
#todo : output is 1 original file with timestamp, and is 1 scaled file with timestamp
