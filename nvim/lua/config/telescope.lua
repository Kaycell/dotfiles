local M = {}

function M.setup()
  vim.api.nvim_set_keymap('n', '<Leader>p',  [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<Leader>f',  [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })

  require("telescope").setup {
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {
        }
      }
    }
  }

  require("telescope").load_extension("ui-select")
end

return M
