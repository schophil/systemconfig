set shiftwidth=4 tabstop=4 expandtab autoindent softtabstop=4 smartindent
setlocal path=.,**

nnoremap <Leader>t :terminal ./vendor/bin/phpunit --testdox --verbose %<CR>

iab this $this-><Left><C-R>=EatChar('\s')<CR>
iab bean $this->bean-><Left><C-R>=EatChar('\s')<CR>
iab pubf public function<Left><C-R>=EatChar('\s')<CR>
iab get public function get<Left><C-R>=EatChar('\s')<CR>
iab set public function get<Left><C-R>=EatChar('\s')<CR>

func EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc

let g:php_include_cache_max_size = 100
let g:php_include_cache = []

function PhpGetClassName(fname)
    let parts = split(a:fname, '\')
    return parts[len(parts) - 1]
endfunction

function PhpRememberHit(fname, path)
    let className = PhpGetClassName(a:fname)
    let g:php_include_cache += [className, a:path]
    if len(g:php_include_cache) >= g:php_include_cache_max_size
        unlet g:php_include_cache[0]
        unlet g:php_include_cache[0]
    endif
endfunction

function PhpMatchHit(fname)
    let className = PhpGetClassName(a:fname)
    return index(g:php_include_cache, className) >= 0
endfunction

function PhpGetLastHit(fname)
    let className = PhpGetClassName(a:fname)
    let classNameIndex = index(g:php_include_cache, className)
    return g:php_include_cache[classNameIndex + 1]
endfunction

" only use
" set include=^\\s*use\\s*\\zs.*\\ze;
" use and inline new classes
set include=\\(\\(^\\s*use\\s*\\)\\\|\\(new\\s\\+\\)\\)\\zs[a-zA-Z\\\\]*\\ze
function! PhpInclude(fname)
    echom 'Trying ' . a:fname ' with include cache size ' . len(g:php_include_cache)
    if PhpMatchHit(a:fname)
        return PhpGetLastHit(a:fname)
    endif
    let parts = split(a:fname, '\')
    " Fail fast
    if len(parts) == 0
        return 0
    endif
    if len(parts) == 1
        " If only one part, it is probably a file in the same namespace.
        return PhpIncludeClassName(parts[0])
    endif
    return PhpIncludeImport(a:fname, parts)
endfunction

function PhpIncludeImport(fname, parts)
    " First try by removing the first level which is the namespace.
    let pathWithoutNamespace = 'src/classes/' . join(a:parts[1:-1], '/') . '.php'
    let found = glob(pathWithoutNamespace, 1)
    if len(found)
        call PhpRememberHit(a:fname, pathWithoutNamespace)
        return pathWithoutNamespace
    endif
    " Just return as-is.
    return 'src/classes/' . join(a:parts[0:-1],'/') . '.php'
endfunction

function PhpIncludeClassName(className)
    let fileName = a:className . '.php'
    let pathInCurrentDir = expand("%:h") . '/' . fileName
    " echom 'Trying ' . pathInCurrentDir
    let found = glob(pathInCurrentDir, 1)
    if len(found)
        call PhpRememberHit(a:className, pathInCurrentDir)
        return pathInCurrentDir
    endif
    return 0
endfunction

setlocal includeexpr=PhpInclude(v:fname)

setlocal define=^.*\\(function\\\|class\\)
