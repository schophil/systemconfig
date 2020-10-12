function @create_task
  set -l year (date "+%Y") 
  set -l fulldate (date "+%Y%m%d")
  set -l dir "./$year/$fulldate""_""$argv"
  mkdir -p $dir
  touch $dir/task.md
  echo $dir/task.md
end
