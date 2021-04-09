#!/bin/bash

font="Ubuntu"
pointsize="72"
fill="white"
gravity="SouthEast"
annotate="+100+100"

intput_format=".JPG"
output_format=".png"
photo="*${intput_format}"

indir="./photo_in/"
outdir="./photo_timestamp/"
files=$indir$photo

      #Check if input dir exists, else quit.
DIR="${indir}"
if [ -d "$DIR" ]; then
   echo "'$DIR' found as input dir, please wait ..."
else
   echo "Warning: '$DIR' NOT found. Exit script.";
   exit 1;
fi

      #Check if output dir exists, else create.
DIR="${outdir}"
if [ -d "$DIR" ]; then
   echo "'$DIR' found as output dir, please wait ..."
else
   echo "'$DIR' NOT found as output dir. Creating output dir.";
   mkdir "$DIR";
fi

    # check if files are there in input dir

echo "Adding timestamp to all the images.";
for file in $files ; do
      #retrieve date for timestamp and sanatize
  img_date=$(identify -format %[EXIF:DateTimeOriginal] "${file}");

      #sanatize date and format for date funtion
  date=$(echo ${img_date} | cut -d" " -f1 | tr ":" "-");
  time=$(echo ${img_date} | cut -d" " -f2 );
  img_date=$date" "$time;

      #re-create date for the timestamp
  my_date=$(date -d "${img_date}" +"%Y-%m-%d %H:%M");

      #retrieve the date of the image for the new filename and sanatize
  datetime=$(identify -format "%[EXIF:DateTimeOriginal]" "${file}" | tr " " "_" | tr ":" "-");
  
      #retrieve the filename of the image for the new filename
  inname=$(identify -format "%t" "${file}");

      #convert the image with timestamp to png
  convert ${file} -font "${font}" \
   -pointsize "${pointsize}" \
   -fill "${fill}" \
   -gravity "${gravity}" \
   -annotate "${annotate}" "${my_date}" \
   "${outdir}${datetime}_${inname}${output_format}";
done

# LICENSE
    ## CC BY-SA 4.0
    ## https://github.com/edzob/photo_scale_timestamp_script
