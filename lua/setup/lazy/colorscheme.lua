return {
    {
        'Skardyy/makurai-nvim',
        config = function()
            vim.cmd('colorscheme makurai')
        end
    },
    {
        'folke/tokyonight.nvim',
        config = function()
            require('tokyonight').setup({
                style = 'storm',
                transparent = true,
                terminal_colors = true,
                styles = {
                    sidebar = 'dark',
                    float = 'dark',
                },
            })
        end
    },

    {
        'rose-pine/neovim',
        name = 'rose-pine',
    }
}
