homebackup() {
    if [[ -d /media/schophil/CCC1 ]]; then
        echo "Detected backup device CCC1..."
        backupTarget=/media/schophil/CCC1
    elif [[ -d /media/schophil/CCC2 ]]; then
        echo "Detected backup device CCC2..."
        backupTarget=/media/schophil/CCC2
    else
        echo "No backup device detected!"
        exit;
    fi

    echo "Backing up to $backupTarget"
    echo -n "Proceed? [Y/n]: "
    read -r answer

    if [[ "$answer" == "" || "$answer" == "y" ]]; then
        rsync -a --stats --info=progress2 /home/schophil $backupTarget/Backups
    else
        echo "Doing nothing"
    fi
}
