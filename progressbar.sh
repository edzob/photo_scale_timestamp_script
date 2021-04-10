#!/bin/bash

intput_format=".png"
photo="*${intput_format}"
indir="./photo_scaled/" 
files=$indir$photo

_start_time=$SECONDS
_start=1
_end=100
# _end=${#indir[@]}
_end=$(ls ${indir} -Uba1 | grep ${intput_format} | wc -l)
counter=${_start}


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
    printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%% ${_progress_time} seconds running"

}

echo "Number of files in [${files}] is [${_end}]."

# Proof of concept
for number in $(seq ${_start} ${_end})
do
    sleep 0.1
    ProgressBar ${number} ${_end}
    ((counter=counter+1))
done
printf '\nFinished! '
progress_time=$(($SECONDS - $_start_time))
echo "This took ${progress_time} seconds for $[counter] files."
