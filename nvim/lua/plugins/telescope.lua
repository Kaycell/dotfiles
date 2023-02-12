local Util = require("lazyvim.util")

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>/", Util.telescope("live_grep", { cwd = false }), desc = "Find in Files (cwd)" },
      { "<leader><space>", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = require("telescope.actions").close,
          },
        },
      },
    },
  },
}
