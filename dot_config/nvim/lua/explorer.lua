local glb = vim.g

local create_buf        = vim.api.nvim_create_buf
local open_win          = vim.api.nvim_open_win
local buf_is_valid      = vim.api.nvim_buf_is_valid
local win_is_valid      = vim.api.nvim_win_is_valid
local win_close         = vim.api.nvim_win_close
local get_option_value  = vim.api.nvim_get_option_value
local set_option_value  = vim.api.nvim_set_option_value

glb.netrw_banner    = false     -- Suppress the file explorer banner
glb.netrw_list_hide =           -- Hide dotfiles and parent dir on load
[[\(^\|\s\s\)\zs\.\S\+]]
glb.netrw_liststyle = 3         -- Tree style listing

local explorer_state = {
  buf        = nil,
  win        = nil,
  target_win = nil,
  augroup    = vim.api.nvim_create_augroup("FloatingExplorer", { clear = true }),
}

function Toggle()
  -- if the floating explorer is open, close it and stop
  if explorer_state.win and win_is_valid(explorer_state.win) then
    win_close(explorer_state.win, false)
    explorer_state.win = nil
    return
  end

  -- remember where to open files
  explorer_state.target_win = vim.api.nvim_get_current_win()

  -- create buffer if it doesn't exist or is invalid
  if not (explorer_state.buf and buf_is_valid(explorer_state.buf)) then
    explorer_state.buf = create_buf(false, true)
  end

  -- window geometry
  local height = math.floor(vim.o.lines * 0.8)
  local width  = math.floor(vim.o.columns * 0.8)
  local col    = math.floor((vim.o.columns - width) / 2)
  local row    = math.floor((vim.o.lines - height) / 2)

  -- create floating window
  explorer_state.win = open_win(explorer_state.buf, true, {
    border   = "rounded",
    relative = "editor",
    style    = "minimal",
    height   = height,
    width    = width,
    col      = col,
    row      = row,
  })

  -- run netrw in that window
  vim.cmd("silent Explore")

  -- record the actual netrw buffer
  explorer_state.buf = vim.api.nvim_get_current_buf()

  -- make this netrw buffer persistent and unlisted
  set_option_value("bufhidden", "hide",   { buf = explorer_state.buf })
  set_option_value("buflisted", false,    { buf = explorer_state.buf })

  -- when netrw opens a file, move it to target window and close floating window
  vim.api.nvim_create_autocmd("BufEnter", {
    group = explorer_state.augroup,
    callback = function()
      -- only handle if we're in the floating explorer window
      if not (explorer_state.win and win_is_valid(explorer_state.win)) then
        return
      end

      if vim.api.nvim_get_current_win() ~= explorer_state.win then
        return
      end

      local current_buf = vim.api.nvim_get_current_buf()

      -- still in netrw buffer = navigating directories, do nothing
      if current_buf == explorer_state.buf then
        return
      end

      -- if it's a directory buffer (netrw), do nothing
      if vim.bo[current_buf].filetype == "netrw" then
        explorer_state.buf = current_buf
        return
      end

      -- opened a file, move it to target window
      if explorer_state.target_win and win_is_valid(explorer_state.target_win) then
        vim.api.nvim_win_set_buf(explorer_state.target_win, current_buf)
      end

      -- close the floating window
      win_close(explorer_state.win, false)
      explorer_state.win = nil
    end,
  })
end
