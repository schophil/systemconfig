function @archive_secure_zip
  zip -r newzip.zip $argv
  zipcloak newzip.zip
end
