-- Telescope (fuzzy finder)
local M = {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.1",
  cmd = { "Telescope" },
  dependencies = {
    "nvim-telescope/telescope-media-files.nvim", -- display preview of media files in telescope
    "nvim-lua/plenary.nvim",
    -- "debugloop/telescope-undo.nvim",
    "nvim-treesitter/nvim-treesitter",
  }
}

function M.config()
  local actions = require("telescope.actions")
  local telescope = require("telescope")

  -- This should be moved to keymaps if it works since it invokes Telescope
  -- but the command will not be mapped unless Telescope has already been invoked
  -- vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>",
  --   { silent = true, noremap = true, desc = "Telescope: Open undotree" }
  -- )

  telescope.setup({
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      path_display = { "smart" },
      file_ignore_patterns = { ".git/", "node_modules" },
      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,

          ["<C-c>"] = actions.close,

          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,

          ["<CR>"] = actions.select_default,
          ["<C-x>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-t>"] = actions.select_tab,

          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,

          ["<PageUp>"] = actions.results_scrolling_up,
          ["<PageDown>"] = actions.results_scrolling_down,

          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["<C-l>"] = actions.complete_tag,
          ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
        },

        n = {
          ["q"] = actions.close,
          ["<CR>"] = actions.select_default,
          ["<C-x>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-t>"] = actions.select_tab,

          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["H"] = actions.move_to_top,
          ["M"] = actions.move_to_middle,
          ["L"] = actions.move_to_bottom,

          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,
          ["gg"] = actions.move_to_top,
          ["G"] = actions.move_to_bottom,

          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,

          ["<PageUp>"] = actions.results_scrolling_up,
          ["<PageDown>"] = actions.results_scrolling_down,

          ["?"] = actions.which_key,
        },
      },
    },
    extensions = {
      media_files = {
        -- filetypes whitelist
        -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        filetypes = {"png", "webp", "jpg", "jpeg"},
        find_cmd = "rg" -- find command (defaults to `fd`)
      },
      -- undo = {
      --   -- defaults
      --   use_delta = true,
      --   use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
      --   side_by_side = true,
      --   diff_context_lines = vim.o.scrolloff,
      --   entry_format = "state #$ID, $STAT, $TIME",
      --   time_format = "",
      --   -- layout_strategy = "vertical",
      --   -- layout_config = {
      --   --   preview_height = 0.8,
      --   -- },
      --   mappings = {
      --     i = {
      --       -- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
      --       -- you want to replicate these defaults and use the following actions. This means
      --       -- installing as a dependency of telescope in it's `requirements` and loading this
      --       -- extension from there instead of having the separate plugin definition as outlined
      --       -- above.
      --       ["<C-cr>"] = require("telescope-undo.actions").yank_additions,
      --       ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
      --       ["<cr>"] = require("telescope-undo.actions").restore,
      --     },
      --     n = {
      --       ["y"] = require("telescope-undo.actions").yank_additions,
      --       ["Y"] = require("telescope-undo.actions").yank_deletions,
      --       ["<cr>"] = require("telescope-undo.actions").restore,
      --     },
      --   },
      -- },
    },
  })

  telescope.load_extension("undo")
  telescope.load_extension("media_files")
end

return M
