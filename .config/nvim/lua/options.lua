-- vim options
-- use :help options for details
local configdir = vim.fn.stdpath("config")
local options = {
  backup = false,                                 -- save backups
  backupdir = configdir .. "/.backup//",          -- backup location
  clipboard = "",                                 -- use system clipboard
  cmdheight = 2,                                  -- command line height
  colorcolumn = { "80" },                         -- set vertical rule
  completeopt = { "menu", "menuone", "preview" }, -- autocomplete options
  conceallevel = 0,                               -- show concealed text
  cursorline = true,                              -- highlight current line
  cursorlineopt = "number",                       -- highlight current line number
  dir = configdir .. "/.swp//",                   -- swap file directory
  expandtab = true,                               -- make tabs spaces
  exrc = true,
  fileencoding = "utf-8",                         -- encoding applied to files when writte
  hlsearch = true,                                -- search highlighting
  incsearch = true,                               -- show where the pattern as it is typed
  ignorecase = true,                              -- ignore case when searching
  linebreak = true,                               -- do not break lines mid word
  mouse = "a",                                    -- allow mouse in modes (n - normal, v - visual, i - insert, a - all see options for more)
  number = true,                                  -- add line numbers
  numberwidth = 2,                                -- set min number column width
  -- pumblend = 20,                                  -- set pop up menu opacity
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
  updatetime = 200,                               -- After this many ms of no typing write swap file to disk
  undofile = true,                                -- enable undofiles
  undodir = configdir .. "/.undo//",              -- undofile directory
  wrap = false,                                   -- whether lines wrap
  writebackup = true,                             -- enable backup before writing
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Disable the default markdown style
vim.g.markdown_recommended_style = 0

-- default colour change in colorscheme
vim.cmd("hi ColorColumn guibg=#1FDBE2")

