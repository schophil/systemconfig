homebackup() {
  devices=(
    /media/schophil/CCC1
    /media/schophil/CCC2
    /media/schophil/b1f88bd7-172d-4e0f-a3a9-dea1bd4a17b8
    /media/schophil/880c1ccb-744f-4065-b3e1-7633983856b6
  )

  for i in ${devices[@]}; do
    echo "Trying $i"
    if [[ -d $i ]]; then
      backupTarget=$i
      break
    fi
  done

  if [[ -z "$backupTarget" ]]; then
    echo "No backup device detected!"
  else
    echo "Backing up to $backupTarget"
    echo -n "Proceed? [Y/n]: "
    read -r answer

    if [[ "$answer" == "" || "$answer" == "y" || "$answer" == "Y" ]]; then
      rsync -a --stats --info=progress2 /home/schophil $backupTarget/Backups
    else
      echo "Doing nothing"
    fi
  fi
}
