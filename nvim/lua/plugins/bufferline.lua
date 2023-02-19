return {
  {
    "akinsho/bufferline.nvim",
    ---@param opts BufferlineConfig
    opts = function(_, opts)
      --- @ class BufferlineOptions
      local usr_options = {
        show_buffer_close_icons = false,
      }
      opts.options = vim.tbl_extend("force", opts.options, usr_options)
    end,
  },
}
