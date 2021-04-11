#!/bin/bash

intput_format=".JPG"
output_format=".png"
photo="*${intput_format}"

indir="./photo_in/"
outdir="./photo_timestamp/"
files=$indir$photo

start_time=$SECONDS
files_count=$(ls ${indir} -Uba1 | grep ${intput_format} | wc -l)
################################################################
################################################################
    # Setting FONT
FONT_INSTALLED=$(fc-list | grep -i "roboto");
if [ -z "$FONT_INSTALLED" ]; then 
    echo "The Roboto font is not currently installed.";
    FONT_INSTALLED=$(fc-list | grep -i "ubuntu");
    if [ -z "$FONT_INSTALLED" ]; then 
    echo "The Ubuntu font is not currently installed.";
      font="Arial"
    else
      font="Ubuntu";
    fi
else
  font="Roboto";
fi
################################################################
################################################################
      #Check if input dir exists, else quit.
DIR="${indir}"
if [ -d "$DIR" ]; then
   echo "'$DIR' found as input dir, please wait ..."
else
   echo "Error: '$DIR' NOT found. Exit script.";
   exit 1;
fi

      #Check if output dir exists, else create.
DIR="${outdir}"
if [ -d "$DIR" ]; then
   echo "'$DIR' found as output dir, please wait ..."
else
   echo "Warning: '$DIR' NOT found as output dir. Creating output dir.";
   mkdir "$DIR";
fi

    # check if files are there in input dir
if (( ${_end} < 1 )); then
  echo "Error: No files [${files_count}] found in [${files}]."
  exit 1;
fi
################################################################
################################################################

echo "Adding timestamp to all [${files_count}] the images.";


find "${indir}" -name "*${intput_format}" | parallel -I% --max-args 1 timestamp_file.sh % "${font}" "${outdir}" "${output_format}"; 

printf '\nadding timestamp is finished!\n'
run_time=$(($SECONDS - $start_time))
echo "This took $((${run_time} / 60)) minutes and $((${run_time} % 60)) seconds."

# LICENSE
    ## CC BY-SA 4.0
    ## https://github.com/edzob/photo_scale_timestamp_script