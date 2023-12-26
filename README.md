# nvim - Neovim Configuration Files

My configuration for Neovim


## Install Neovim (Windows)

Run `winget install Neovim.Neovim` in a Windows command prompt

## Config Installation

Clone to appropriate directory. 
Neovim will look for a `init.lua` at `%XDG_CONFIG_HOME%\nvim\init.lua`
If intending to use default location, clone repository to `~/AppData/Local`

If using a custom location, clone to that location and set `%XDG_CONFIG_HOME%` to point to directory **above** the repository root 

## Post-Installation Setup

Install `MSYS2`, see https://github.com/HO-COOH/CPPDevOnWindows#msvc

Outdated:
> Run `winget install -i LLVM.LLVM` and install for all users This seemed to work, but didn't - :LspInstall clangd to install a C++ compiler for Treesitter to use-

## Main Dependencies

Lazy.nvim
Treesitter.nvim
Telescope.nvim
Lualine
 
