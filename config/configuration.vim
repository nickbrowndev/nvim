" Basic Settings {{{
"set nocompatible 		"Turns of VI compatibility restrictions
set hidden              "Required to keep multiple buffers open

" }}} 

" File Encodings {{{
set fileencodings=utf-8,latin-1,cp1252
set encoding=utf-8
"}}}

" Colours & Fonts {{{
set termguicolors       "enable truecolour support
syntax enable		      	"enable syntax highlighting
set background=dark     "dark colour mode
set t_Co=256            "use 256 colors at the terminal
colorscheme gruvbox     "colour scheme
set guifont=Hack:h10,Fira_Code:h10,Consolas:h10,Courier\ New:h10
"}}}

" Spaces & Tabs {{{
set shiftwidth=2        "sets number of spaces used for < > indentation
set tabstop=2			      "number of visual spaces per TAB
set softtabstop=2	    	"number of spaces in tab when editing
set expandtab		      	"use spaces instead of tabs
set autoindent          "autoindent new lines
filetype indent on      "filetype specific indenting
filetype plugin on
set modelines=1		    	"ensure a foldline must be present to perform folding
set smarttab            "automatically use tab or space for indentation
set expandtab           "converts tabs to spaces
set smartindent         "makes indenting smart
set showtabline=2       "always show tabs
"}}}


" UI Settings {{{
set ruler			          "shows the ruler at the bottom
set number			        "show line numbers (:set nonumber)
set numberwidth=5       "number of characters to use for number gutter
set relativenumber	  	"set relative line numbers
set showmatch		      	"show matching brackets [{()}]
"set nowrap              "do not wrap long lines
set cursorline		    	"highlight current cursor line
set wildmenu		      	"visual autocomplete for command menu
set lazyredraw			    "only redraw screen when necessary
set showcmd			        "show command in bottom bar
set showmode            "show insert, replace, or visual mode in last line
set visualbell          "flash screen on bell
set pumheight=10        "set pop-up menu size
set mouse=a             "enable mouse cursor movement
set splitbelow          "make horizontal splits open below current window
set splitright          "make vertical splits open to the right of current window
set laststatus=0        "always display the status line
"set noshowmode          "don't show current editor mode (-- INSERT --)
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
set clipboard=unnamedplus "use system clipboard for copy and pasting
" }}}

" Folding {{{
"set foldenable          "enable section/code folding 
"set foldlevelstart=10   "open most folds by default 
"set foldnestmax=10      "maximum number of nested folds 
"set foldmethod=indent   "fold based on indent level 
" }}} 