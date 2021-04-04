#!/bin/bash

font="Roboto"
pointsize="72"
fill="white"
gravity="SouthEast"
annotate="+100+100"

indir="./photo_in/" #with slash at end
photo="*.jpg"
files=$indir$photo
outdir="./photo_out/"

# check if input dir exists
# check if output dir exists
# check if files are there in input dir

for file in $files ; do
  #retrieve date for timestamp and sanatize
  img_date=$(identify -format %[EXIF:DateTimeOriginal] ${file});
  date=$(echo ${img_date} | cut -d" " -f1 | tr ":" "-");
  time=$(echo ${img_date} | cut -d" " -f2 );
  img_date=$date" "$time;
  #create date for the timestamp
  my_date=$(date -d "${img_date}" +"%Y-%m-%d %H:%M");

  #retrieve the date of the image for the new filename and sanatize
  datetime=$(identify -format "%[EXIF:DateTimeOriginal]" ${file} | tr " " "_" | tr ":" "-");
  #retrieve the filename of the image for the new filename
  inname=$(identify -format "%t" ${file});

  #convert the image with timestamp to png
  convert ${file} -font ${font} \
   -pointsize ${pointsize} \
   -fill ${fill} \
   -gravity ${gravity} \
   -annotate ${annotate} "${my_date}" \
   ${outdir}${datetime}_${inname}.png;
done

# LICENSE
# CC BY-SA 4.0
# https://github.com/edzob/photo_scale_timestamp_script