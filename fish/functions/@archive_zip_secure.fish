function @archive_zip_secure
  zip -r newzip.zip $argv
  zipcloak newzip.zip
end
