# nvim - Neovim Configuration Files

My configuration for Neovim

## Prerequisits

### Install Neovim (Windows)

Run `winget install Neovim.Neovim` in a Windows command prompt

### Install a Nerd Font

Install a Nerd Font (e.g. "Hack"): [NerdFonts.com](https://www.nerdfonts.com/font-downloads).

### Install a C++ Compiler
Either use Zig or MSYS2.

#### Zig (preferred)
- Install `ZIG`, from [ziglang.org](https://ziglang.org/download/). E.g. download executable to e.g. `/Programs/Development/Zig`
- Add to System path

#### MSYS2
Install `MSYS2`, see [this guide](https://github.com/HO-COOH/CPPDevOnWindows#install-clang).

Outdated:
> Run `winget install -i LLVM.LLVM` and install for all users This seemed to work, but didn't - :LspInstall clangd to install a C++ compiler for Treesitter to use-

### Install NPM

Run `winget install -e --id OpenJS.NodeJS`

## Config Installation

Clone to appropriate directory. 
Neovim will look for a `init.lua` at `%XDG_CONFIG_HOME%\nvim\init.lua`
If intending to use default location, clone repository to `~/AppData/Local`

If using a custom location, clone to that location and set `%XDG_CONFIG_HOME%` to point to directory **above** the repository root 

## Main Configuration Dependencies

Lazy.nvim
Treesitter.nvim
Telescope.nvim
Lualine
 
