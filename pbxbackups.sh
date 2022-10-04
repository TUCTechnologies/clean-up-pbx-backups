#! /bin/bash
dir=/home

for pbx_dir in $dir/*
do
  files=($(find $pbx_dir | grep Switchvox_Backup))
  recent_files=($(find $pbx_dir -mtime -7 | grep Switchvox_Backup))
  
  for file in ${files[@]};
  do
    if [[ ! "${recent_files[*]}" =~ "$file" ]]; then
      echo deleting $file - $(date -r $file)
      rm $file
    fi 
  done
done
