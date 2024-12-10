homebackup() {
  devices=(/run/media/schophil/CCC1 /run/media/schophil/CCC2 /media/schophil/CCC1 /media/schophil/CCC2)

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

    if [[ "$answer" == "" || "$answer" == "y" ]]; then
      rsync -a --stats --info=progress2 /home/schophil $backupTarget/Backups
    else
      echo "Doing nothing"
    fi
  fi
}
