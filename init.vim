" MY VIMRC
" To refresh this file
" :source / :so % 	 (when editing) 
" :source / :so $MYVIMRC (when not editing)

" Install Plugins Using Plug.vim https://github.com/junegunn/vim-plug
call plug#begin(stdpath('data') . '/plugged')

" GUI
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Theme
Plug 'morhetz/gruvbox'

" Navigation
" Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'kien/ctrlp.vim'

" Git Integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

call plug#end()

"Configuration 
:source $XDG_DATA_HOME/config/configuration.vim
:source $XDG_DATA_HOME/config/keymapping.vim
:source $XDG_DATA_HOME/config/statusline.vim

" Plugin Configuration
:source $XDG_DATA_HOME/config/ctrlp.vim
":source $XDG_DATA_HOME/config/nerdtree.vim

