# Neovim Config

Personal Neovim config using `lazy.nvim`.

## Install

1. Install Neovim and `tree-sitter-cli`.

2. Back up any existing config:

```sh
mv ~/.config/nvim ~/.config/nvim.bak
```

3. Clone this repo:

```sh
git clone https://github.com/WhoisCipher/nvim-config ~/.config/nvim
```

4. Start Neovim:

```sh
nvim
```

`lazy.nvim` bootstraps itself. Plugins and Mason LSP servers install from the config.

## LSP

Configured through Mason:

- JavaScript/TypeScript: `ts_ls`
- Go: `gopls`
- C/C++: `clangd`
- Tailwind CSS: `tailwindcss`
- SQL: `sqls`
- Lua: `lua_ls`
- Rust: `rust_analyzer`
