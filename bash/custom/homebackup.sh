homebackup() {
  devices=(/run/media/schophil/CCC1 /run/media/schophil/CCC2 /media/schophil/CCC1 /media/schophil/CCC2 /run/media/schophil/b95f2b1d-c646-4538-9050-5246ed334424 /run/media/schophil/f816f3c8-cac3-4355-9da0-4a7c0ce55598)

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
