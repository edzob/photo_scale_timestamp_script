#!/bin/bash

font="Roboto"
pointsize="72"
fill="white"
gravity="SouthEast"
annotate="+100+100"

indir="./photo_in/" 
photo="*.jpg"
files=$indir$photo
outdir="./photo_out/"

for file in $files ; do
  img_date=$(identify -format %[EXIF:DateTimeOriginal] ${file}); date=$(echo ${img_date} | cut -d" " -f1 | tr ":" "-"); time=$(echo ${img_date} | cut -d" " -f2 ); img_date=$date" "$time;
  my_date=$(date -d "${img_date}" +"%Y-%m-%d %H:%M");
  datetime=$(identify -format "%[EXIF:DateTimeOriginal]" ${file} | tr " " "_" | tr ":" "-");
  inname=$(identify -format "%t" ${file});
  convert ${file} -font ${font} -pointsize ${pointsize} -fill ${fill} -gravity ${gravity} -annotate ${annotate} "${my_date}" ${outdir}${datetime}_${inname}.png;
done

# LICENSE
# CC BY-SA 4.0
# https://github.com/edzob/photo_scale_timestamp_script