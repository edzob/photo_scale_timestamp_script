#!/bin/bash

photo="*.jpg"
indir="./photo_timestamp/" 
outdir="./photo_scaled/"
files=$indir$photo
scale="[250x]"

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

echo "Creating scaled images.";
for file in $files ; do
    #retrieve the filename of the image for the new filename
  inname=$(identify -format "%t" ${file});
    #scale file
  convert "${file}${scale}" -set filename:base "%[basename]" ${outdir}${inname}.png;
done

# LICENSE
    ## CC BY-SA 4.0
    ## https://github.com/edzob/photo_scale_timestamp_script