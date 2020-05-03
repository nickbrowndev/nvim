# nvim
Neovim Configuration Files

# Install Neovim
Download from https://github.com/neovim/neovim/releases/tag/stable
Unzip 
Add Neovim 'bin' directory to $path

# Set Location of Dotfiles
Set $XDG_CONFIG_HOME to the appropriate directory (minus 'nvim')
e.g. 'F:\Development\Github' for 'F:\Development\Github\nvim\init.vim'

Set $XDG_DATA_HOME to the appropriate directory 

# Configure Git 

[core]
	editor = "nvim-qt"

Start NeoVim
Run :PlugInstall to install all defined plugins
