#!/bin/bash

intput_format=".png"
photo="*${intput_format}"

indir="./photo_timestamp/" 
outdir="./photo_scaled/"
files=$indir$photo

scale="[350x]"

_start_time=$SECONDS
_start=1
_end=$(ls ${indir} -Uba1 | grep ${intput_format} | wc -l)
counter=${_start}

################################################################
################################################################
      ### from https://stackoverflow.com/questions/238073/how-to-add-a-progress-bar-to-a-shell-script
      # 1. Create ProgressBar function
      # 1.1 Input is currentState($1) and totalState($2)
function ProgressBar {
      # Process data
  let _progress=(${1}*100/${2}*100)/100
  let _done=(${_progress}*4)/10
  let _left=40-$_done
      # Build progressbar string lengths
  _fill=$(printf "%${_done}s")
  _empty=$(printf "%${_left}s")
  _progress_time=$(($SECONDS - $_start_time))
      # 1.2 Build progressbar strings and print the ProgressBar line
      # 1.2.1 Output example:                           
      # 1.2.1.1 Progress : [########################################] 100%
  printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%% $((${_progress_time} / 60)) minutes and $((${_progress_time} % 60)) seconds"
}

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
if [${_end}<1]; then
  echo "Error: No files [${_end}] found in [${files}]."
  exit 1;
fi

################################################################
################################################################

echo "Scaling all [${_end}] the images.";
for file in $files ; do
  (
  ProgressBar ${counter} ${_end}
    #retrieve the filename of the image for the new filename
  inname=$(identify -format "%t" ${file});
    #scale file
  convert "${file}${scale}" -set filename:base "%[basename]" ${outdir}${inname}.png;
  ((counter=counter+1))
  ) &
done
wait
printf '\nscaling is finished!\n'
run_time=$(($SECONDS - $_start_time))
echo "This took $((${run_time} / 60)) minutes and $((${run_time} % 60)) seconds."

# LICENSE
    ## CC BY-SA 4.0
    ## https://github.com/edzob/photo_scale_timestamp_script