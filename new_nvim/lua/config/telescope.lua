local actions = require("telescope.actions")

-- This is your opts table
require("telescope").setup {
    --extensions = {
    --  ["ui-select"] = {
    --    require("telescope.themes").get_dropdown {
    --      -- even more opts
    --    }
    --  }
    --},
    defaults = {
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_better,
            ["<C-k>"] = actions.move_selection_worse,
            ["<C-q>"] = actions.send_to_qflist,
            ["<Esc>"] = actions.close,
          },
        },
    },
}

-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
--require("telescope").load_extension("ui-select")

require("telescope").load_extension("fzf")
