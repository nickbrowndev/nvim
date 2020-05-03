# nvim
Neovim Configuration Files

# Install Neovim
1. Download from https://github.com/neovim/neovim/releases/tag/stable
1. Unzip 
1. Add Neovim 'bin' directory to $path

# Set Location of Dotfiles
Set `$XDG_CONFIG_HOME` to the appropriate directory (minus 'nvim')
e.g. `'F:\Development\Github'` for `'F:\Development\Github\nvim\init.vim'`

Set `$XDG_DATA_HOME` to the appropriate directory 

# Configure Git 

`[core]
	editor = "nvim-qt"`

Start NeoVim
Run `:PlugInstall` to install all defined plugins (`:PlugUpdate` to update them)
