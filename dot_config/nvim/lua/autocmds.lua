local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight yanked text
local highlight_group = augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ timeout = 170 })
    end,
    group = highlight_group,
})

-- Ruler at column 80
local ns = vim.api.nvim_create_namespace('ruler')
local function set_ruler()
    vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)

    if vim.bo.filetype == 'oil' then
        return
    end

    local lines = vim.api.nvim_buf_line_count(0)
    for l = 0, lines - 1 do
        local text = vim.api.nvim_buf_get_lines(0, l, l + 1, false)[1] or ''
        if  vim.fn.type(text) == vim.v.t_string
            and vim.fn.strdisplaywidth(text) < 80 then
            vim.api.nvim_buf_set_extmark(0, ns, l, 0, {
                virt_text = { { '│', 'LineNr' } },
                virt_text_win_col = 79,
                hl_mode = 'combine',
            })
        end
    end
end
autocmd({ 'BufEnter', 'TextChanged', 'TextChangedI', 'InsertLeave' }, {
    callback = set_ruler,
})

-- Treesitter
autocmd("FileType", {
    pattern = require("treesitter").supported_filetypes,
    callback = function() vim.treesitter.start() end,
})
