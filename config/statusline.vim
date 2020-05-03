" Status Line {{{
set laststatus=2                    " Use statusline
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#Cursor#
set statusline+=\ %{mode()}\        " Current Editor Mode
set statusline+=%#PmenuSel#
set statusline+=%{FugitiveStatusline()}  " Git branch
set statusline+=%#LineNr#
set statusline+=\ [%2n]             " Buffer Number
set statusline+=\ %f                " File
set statusline+=%h%m%r%w\           " File modified status 
set statusline+=%=                  " Side separator
set statusline+=%#CursorColumn#
set statusline+=\ %y                " File Type
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]  " File Format
set statusline+=\ %p%%              " Percentage through
set statusline+=\ %l[%c]:%L         " Line Number [ Column } : Max Lines
set statusline+=\ 
" }}}