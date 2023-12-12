-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- ChangeBackground changes the background mode based on macOS's `Appearance` setting.
function ChangeBackground()
  if os.execute("defaults read -g AppleInterfaceStyle 2&>1 /dev/null") == 0 then
    vim.go.background = "dark"
  else
    vim.go.background = "light"
  end
end

vim.api.nvim_create_autocmd({ "Signal" }, {
  pattern = { "SIGUSR1" },
  desc = "Changes the background mode based on macOS's `Appearance` setting",
  callback = ChangeBackground,
})
