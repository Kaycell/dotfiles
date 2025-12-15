vim.pack.add({
    -- Color scheme
    { src = 'https://github.com/catppuccin/nvim' },
    -- File explorer
    { src = 'https://github.com/stevearc/oil.nvim' },
    -- Treesitter
    {
        src = 'https://github.com/nvim-treesitter/nvim-treesitter',
        version = 'main',
    },
})
require('catppuccin').setup()
require('oil').setup()
require('nvim-treesitter').install(require('treesitter').parsers())
