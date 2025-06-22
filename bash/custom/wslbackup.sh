wslbackup() {
  folders=(
    /home/schophil/aiv
    /home/schophil/.bashrc
    /home/schophil/.config/jet
    /home/schophil/.ssh
    /home/schophil/.aws/config
    /home/schophil/.m2/settings.xml
    /home/schophil/.m2/settings-security.xml
  )
  target="/mnt/c/Users/phili/Backup"
  # Create tar archive of folders
  tar -czvf "/home/schophil/tmp/wslbackup.tar.gz" \
    --exclude='/home/schophil/aiv/*/target' \
    --transform='s/^home\/schophil\///' \
    "${folders[@]}"
  cp -f "/home/schophil/tmp/wslbackup.tar.gz" "$target"
  rm -f "/home/schophil/tmp/wslbackup.tar.gz"
}
