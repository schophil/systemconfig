set shiftwidth=4 tabstop=4 expandtab autoindent softtabstop=4 smartindent
setlocal path=.,**

iab this $this-><Left><C-R>=EatChar('\s')<CR>
iab bean $this->bean-><Left><C-R>=EatChar('\s')<CR>
iab pubf public function<Left><C-R>=EatChar('\s')<CR>
iab get public function get<Left><C-R>=EatChar('\s')<CR>
iab set public function get<Left><C-R>=EatChar('\s')<CR>

func EatChar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

" only use
" set include=^\\s*use\\s*\\zs.*\\ze;
" use and inline new classes
set include=\\(\\(^\\s*use\\s*\\)\\\|\\(new\\s\\+\\)\\)\\zs[a-zA-Z\\\\]*\\ze
function! PhpInclude(fname)
    let parts = split(a:fname, '\')
    " Fail fast
    if len(parts) == 0
        return 0
    endif
    " If only one part, it is probably a file in the same namespace.
    if len(parts) == 1
        let fileName = parts[0] . '.php'
        " if fileName == expand("%:t")
        "     return 0
        " endif
	    let pathInCurrentDir = expand("%:h") . '/' . fileName
        echom 'Trying ' . pathInCurrentDir
	    let found = glob(pathInCurrentDir, 1)
	    if len(found)
		    return pathInCurrentDir
	    endif
        return 0
    endif
    " First try by removing the first level which is the namespace.
    let pathWithoutFirstLevel = 'src/classes/' . join(parts[1:-1], '/') . '.php'
    echom 'Trying ' . pathWithoutFirstLevel
    let found = glob(pathWithoutFirstLevel, 1)
    if len(found)
        return pathWithoutFirstLevel
    endif
    " Just return as-is.
    return 'src/classes/' . join(parts[0:-1],'/') . '.php'
endfunction
setlocal includeexpr=PhpInclude(v:fname)

setlocal define=^.*\\(function\\\|class\\)
