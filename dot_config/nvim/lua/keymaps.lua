local glb = vim.g
local keymap = vim.keymap.set

glb.mapleader = ' '

keymap('n', '<space>', '<Nop>')

-- System clipboard
keymap({ "n", "v" }, "<leader>y", '"+y', {
    desc = "Yank into the system clipboard"
})
keymap({ "n", "v" }, "<leader>Y", '"+Y', {
    desc = "Yank to EOL into the system clipboard"
})
keymap({ "n", "v" }, "<leader>d", '"+d', {
    desc = "Cut into the system clipboard"
})
keymap({ "n", "v" }, "<leader>D", '"+D', {
    desc = "Cut to EOL into the system clipboard"
})
keymap({ "n", "v" }, "<leader>p", '"+p', {
    desc = "Paste the system clipboard after cursor"
})
keymap({ "n", "v" }, "<leader>P", '"+P', {
    desc = "Paste the system clipboard before cursor"
})
