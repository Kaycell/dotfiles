local glb = vim.g

glb.netrw_banner    = false     -- Suppress the file explorer banner
glb.netrw_list_hide =           -- Hide dotfiles and parent dir on load
[[\(^\|\s\s\)\zs\.\S\+]]
glb.netrw_liststyle = 3         -- Tree style listing
glb.netrw_winsize   = 30        -- Pct of netrw window taken by new window
