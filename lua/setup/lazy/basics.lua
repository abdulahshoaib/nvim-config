return{
    'nvim-lua/plenary.nvim',
    'github/copilot.vim',
    'rafamadriz/friendly-snippets',
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    }
}
