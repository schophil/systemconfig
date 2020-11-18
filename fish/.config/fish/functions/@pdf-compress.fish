function @pdf-compress -d "Compress a pdf: [mode:prepress|ebook|screen] [file]"
  gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/$argv[1] -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$argv[1]_$argv[2] $argv[2]
end
