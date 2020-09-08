set shiftwidth=4 tabstop=4 expandtab autoindent softtabstop=4 smartindent
setlocal path=.,**

set include=^\\s*use\\s*\\zs.*\\ze;
function! PhpInclude(fname)
    let parts = split(a:fname, '\')
    " remove first level
    let pathWithoutFirstLevel = 'src/classes/' . join(parts[1:-1], '/') . '.php'
    let found = glob(pathWithoutFirstLevel, 1)
    if len(found)
        return pathWithoutFirstLevel
    endif
    return 'src/classes/' . join(parts[0:-1],'/') . '.php'
endfunction
setlocal includeexpr=PhpInclude(v:fname)

setlocal define=^.*\\(function\\\|class\\)
