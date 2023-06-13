-- vim options
-- use :help options for details
local configdir = vim.fn.stdpath("config")
local options = {
  backup = false,                                 -- save backups
  backupdir = configdir .. "/.backup//",          -- backup location
  clipboard = "",                                 -- use system clipboard
  cmdheight = 2,                                  -- command line height
  completeopt = { "menu", "menuone", "preview" }, -- autocomplete options
  conceallevel = 0,                               -- show concealed text
  cursorline = false,                             -- highlight current line
  dir = configdir .. "/.swp//",                   -- swap file directory
  expandtab = true,                               -- make tabs spaces
  fileencoding = "utf-8",                         -- encoding applied to files when writte
  hlsearch = true,                                -- search highlighting
  ignorecase = true,                              -- ignore case when searching
  linebreak = true,                               -- do not break lines mid word
  mouse = "a",                                    -- allow mouse in modes (n - normal, v - visual, i - insert, a - all see options for more)
  number = true,                                  -- add line numbers
  numberwidth = 2,                                -- set min number column width
  pumheight = 8,                                  -- pop up menu height for autocomplete
  relativenumber = true,                          -- display relative line numbers
  scrolloff = 8,                                  -- min num of lines above/below cursor
  shiftwidth = 2,                                 -- number of spaces for autoindent
  showmode = false,                               -- show the current mode
  showtabline = 2,                                -- always show page tabs
  sidescrolloff = 4,                              -- min num of cols either side if wrap is off
  signcolumn = "auto",                            -- whether to show the signcolumn (i.e for breakpoints)
  smartcase = true,                               -- override ignorecase if there is a capital
  splitbelow = true,                              -- horizontal split below
  splitright = true,                              -- vertical split right
  swapfile = true,                                -- enable swap files
  termguicolors = true,                           -- enable 24-bit RBG color in TUI
  timeoutlen = 300,                               -- time to wait for mapped sequence to complete (in ms)
  tabstop = 2,                                    -- number of spaces used to represent a <Tab> in a file
  updatetime = 4000,                              -- After this many ms of no typing write swap file to disk
  undofile = true,                                -- enable undofiles
  undodir = configdir .. "/.undo//",              -- undofile directory
  wrap = true,                                    -- whether lines wrap
  writebackup = true,                             -- enable backup before writing
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

