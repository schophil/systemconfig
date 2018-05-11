function @genpwd
  cat /dev/urandom | head -n 100 | iconv -f ISO-8859-1 -t UTF-8 | tr -dc '0-9A-Z' | fold -w $argv | head -n 1
end
