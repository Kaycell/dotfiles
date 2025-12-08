vim.pack.add({
    { src = 'https://github.com/catppuccin/nvim' },
})
require('catppuccin').setup({})

vim.pack.add({
    { src = 'https://github.com/mason-org/mason.nvim' },
})
require("mason").setup({})
