set shiftwidth=2 tabstop=2 expandtab autoindent softtabstop=2 smartindent
nnoremap <leader>pp :call formatJSON()<cr>

function FormatJSON()
  " Every { followed by a non white space character should be followed by a new line
  silent %s/{\(\S\)/{\r\1/ge
  " Lists of objects
  silent %s/\[{/\[\r{/ge
  silent %s/}\]/}\r\]/ge
  silent %s/\]}/\]\r}/ge
  silent %s/,{/,\r{/ge
  " Every } preceeded by non-space characters should be
  " on a new line
  silent %s/\(\S\)}/\1\r}/ge
  " New lines after values
  silent %s/,"/,\r"/ge
  " Space after each ": followed by a non-space character.
  silent %s/":\(\S\)/": \1/ge
  noh
  " TODO: remove empty lines if any
  " Use the normal formatting of vim to finish up
  silent normal! ggVG==
endfunction

