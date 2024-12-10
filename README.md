# Neovim Config

This is my personal Neovim configuration, utilizing **Lazy.nvim** as the package manager.

## Features

- **LSP & Autocompletion**: Powered by `lspconfig`, `nvim-cmp`, and `LuaSnip` for intelligent code completion and navigation.
- **Git Integration**: With `fugitive` you have seamless git support directly in Neovim.
- **Telescope**: A fuzzy finder to quickly search for files, buffers, and other resources.
- **Harpoon**: Quick file navigation to jump between frequently used files.
- **Tree-sitter**: Provides syntax highlighting and better code understanding with intelligent parsing.

## Plugins

### UI & Navigation
- **[Telescope](https://github.com/nvim-telescope/telescope.nvim)**: Fuzzy finder for files, buffers, and more.
- **[lualine](https://github.com/nvim-lualine/lualine.nvim)**: A statusline plugin to display essential information.

### Git Integration
- **[vim-fugitive](https://github.com/tpope/vim-fugitive)**: Git commands directly in Neovim.

### Language Server Protocol (LSP)
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**: Collection of LSP configurations for various languages.
- **[mason.nvim](https://github.com/williamboman/mason.nvim)**: Handles installing and managing LSP servers, linters, and formatters.

### Autocompletion
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)**: Autocompletion plugin for Neovim.
- **[cmp-buffer](https://github.com/hrsh7th/cmp-buffer)**: Buffer completion source for `nvim-cmp`.
- **[cmp-path](https://github.com/hrsh7th/cmp-path)**: Path completion source for `nvim-cmp`.
- **[cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)**: LuaSnip completion source for `nvim-cmp`.
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)**: Snippet engine for Neovim.

### Syntax Highlighting
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Syntax highlighting and better parsing for many languages.

### File Navigation
- **[Harpoon](https://github.com/ThePrimeagen/harpoon)**: Easily manage and switch between files.

## Color Schemes
- **[Rose-Pine](https://github.com/rose-pine/neovim)**: A soft and elegant color scheme.
- **[Tokyonight](https://github.com/folke/tokyonight.nvim)**: A night-friendly color scheme.

## Installation

1. **Install Neovim** (if you haven't already) via [neovim.io](https://neovim.io/).

2. **Install Lazy.nvim**:
   Follow the installation instructions from the official Lazy.nvim repository:
   [Lazy.nvim Installation](https://github.com/folke/lazy.nvim)

3. **Clone the repository** (or add it to your config directory):

   Clone your configuration into `~/.config/nvim/` (or wherever your Neovim configuration is located).

   ```bash
   git clone https://github.com/yourusername/neovim-config ~/.config/nvim
   ```

4. **Install Plugins**:
   Open Neovim and run:

   ```vim
   :Lazy sync
   ```

   This will automatically install and set up all the plugins.

5. **Set the Color Scheme**:
   If you want to switch color schemes, change it in the configuration file:

   ```vim
   :colorscheme rose-pine
   ```

   You can switch to `tokyonight` by replacing `rose-pine` with `tokyonight`.

## Usage

- **Telescope**: Press `<leader>pf` to find files, `<leader>ps` to search for words in files, and `<C-p>` for git-files.
- **LSP**: Autocompletion and diagnostics should work out of the box when you open a file.
- **Git**: Use commands like `:Git`, `:Git commit -m "your commit message"`, etc., for Git operations.
- **Harpoon**:
    - Press `<leader>a` to mark.
    - Press `<leader>h`, `<leader>t`, `<leader>s` & `<leader>n` between files 1-4 marked respectively.
    - Press `<leader>e` to open GUI for marked files.

## Customization

The remaps are all done according to my work-flow under the [remaps](lua/setup/remap.lua). Make sure that you change this to your own personal preference as the vim experience has to be all but personalized. Welcome to the vim cult.
