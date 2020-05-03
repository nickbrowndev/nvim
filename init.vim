" MY VIMRC
" To refresh this file
" :source / :so % 	 (when editing) 
" :source / :so $MYVIMRC (when not editing)

" Install Plugins Using Plug.vim https://github.com/junegunn/vim-plug
call plug#begin(stdpath('data') . '/plugged')

" Theme
Plug 'morhetz/gruvbox'

" Git Integration
Plug 'tpope/vim-fugitive'

" Comments
Plug 'tpope/vim-commentary'


call plug#end()


" Base this file off 'defaults.vim'
"unlet! skip_defaults_vim
"source $VIMRUNTIME/defaults.vim

" Basic Settings {{{
"set nocompatible 		"Turns of VI compatibility restrictions


" }}} 

" File Encodings {{{
set fileencodings=utf-8,latin-1,cp1252
set encoding=utf-8
"}}}

" Colours & Fonts {{{
set termguicolors       "enable truecolour support
" TODO syntax enable			"enable syntax highlighting
set background=dark     "dark colour mode
set t_Co=256            "use 256 colors at the terminal
colorscheme gruvbox     "colour scheme
set guifont=Hack:h10,Fira_Code:h10,Consolas:h10,Courier\ New:h10
"}}}

" Spaces & Tabs {{{
set shiftwidth=4        "sets number of spaces used for < > indentation
set tabstop=4			"number of visual spaces per TAB
set softtabstop=4		"number of spaces in tab when editing
set expandtab			"use spaces instead of tabs
set autoindent          "autoindent new lines
filetype indent on      "filetype specific indenting
filetype plugin on
set modelines=1			"ensure a foldline must be present to perform folding
"}}}


" UI Settings {{{
set ruler			    "shows the ruler at the bottom
set number			    "show line numbers (:set nonumber)
set numberwidth=5       "number of characters to use for number gutter
"set relativenumber		"set relative line numbers
set showmatch			"show matching brackets [{()}]
"set nowrap              "do not wrap long lines
set cursorline			"highlight current cursor line
set wildmenu			"visual autocomplete for command menu
set lazyredraw			"only redraw screen when necessary
set showcmd			    "show command in bottom bar
set showmode            "show insert, replace, or visual mode in last line
set visualbell          "flash screen on bell
" }}}

" Navigation {{{
set scrolloff=3         "show 3 lines above or below cursor when scrolling
"}}}

" Searching {{{
set path+=**
set ignorecase          "turn off case sensitivity
set incsearch           "search as characters are entered
set hlsearch            "highlight search matches
set complete+=kspell    "Add dictionary to autocomplete when spelling enabled
set nospell             "'set spell' sets the dictionary
" }}}
 
" Copy/Pasting {{{
" not sure which of these works/works best
"set clipboard=unnamed  "use system clipboard for copy and pasting
"set clipboard=unnamedplus "use system clipboard for copy and pasting
" }}}

" Folding {{{
"set foldenable          "enable section/code folding 
"set foldlevelstart=10   "open most folds by default 
"set foldnestmax=10      "maximum number of nested folds 
"set foldmethod=indent   "fold based on indent level 
" }}} 

" Movement {{{
" Move vertically by visual line
nnoremap j gj
nnoremap k gk
inoremap jk <ESC>
" }}}

" Plugins {{{
"packloadall             "Load all packages now (is this required?)
silent! helptags ALL    "Generate help tags from all packages and ignore errors

" NERDTree {{{
"let NERDTreeShowHidden=1 "Show hidden files by default
"toggle NERDTree using Ctrl+N
"map <C-n> :NERDTreeToggle<CR>
" }}}

" NERDTree-Git {{{
" }}}
" 
" Surround {{{
" }}}
"
" CtrlP {{{
"nnoremap <leader>f :CtrlP<CR>
"let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
"if executable('ag')
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"endif
" Use Git to index files instead of searching
"if executable('git')
"let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s']
"endif
" }}}
"
" }}}


" Performes folding on the file
" vim:foldmethod=marker:foldlevel=10
"
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
