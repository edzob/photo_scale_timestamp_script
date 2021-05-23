#!/bin/bash
font=$2
    # Setting annotate 
pointsize="235"
fill_color="white"
fill_color="SeaGreen1"
#23804f 
stroke_color="black"
stroke_width="5"
gravity="SouthEast"
annotate="+100+100"
    #input file
file=$1
    #output file
output_format=$4
outdir=$3
    #format EXIF datetime to timestamp, filename-time and filename
img_date_file=$(identify -format \
  %[EXIF:DateTimeOriginal] "${file}");
date=$(echo ${img_date_file} | cut -d" " -f1 | tr ":" "-");
time=$(echo ${img_date_file} | cut -d" " -f2 );
img_date_temp=$date" "$time;
img_date_my=$(date -d "${img_date_temp}" +"%Y-%m-%d %H:%M");
file_timestamp=$(identify -format \
  "%[EXIF:DateTimeOriginal]" "${file}" | tr " " "_" | tr ":" "-");
file_name=$(identify -format "%t" "${file}");
    #timestamp photo
convert ${file} \
  -font "${font}" \
  -pointsize "${pointsize}" \
  -fill "${fill_color}" \
  -stroke "${stroke_color}" \
  -strokewidth "${stroke_width}" \
  -gravity "${gravity}" \
  -annotate "${annotate}" \
  "${img_date_my}" \
  "${outdir}${file_timestamp}_${file_name}${output_format}";

# LICENSE
  ## CC BY-SA 4.0
  ## https://github.com/edzob/photo_scale_timestamp_script
