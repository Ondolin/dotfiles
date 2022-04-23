require("plugins")
require("general")
require("statusline")

require("config/cmp")
require("config/lspconfig")
require("config/setup")
require("config/rust-tools")
require("config/prolog")
require("config/telescope")
require("config/latex")
require("config/tabnine")
require("config/copilot")
require("config/term")

require("mappings")

vim.cmd("colorscheme dracula")

-- This line enables and disables the modifyOtherKeys option (makes <C-Tab> mappings possible)
vim.cmd("autocmd UIEnter * if v:event.chan ==# 0 | call chansend(v:stderr, \"\\x1b[>4;2m\") | endif")
vim.cmd("autocmd UILeave * if v:event.chan ==# 0 | call chansend(v:stderr, \"\\x1b[>4;0m\") | endif")

vim.cmd("call vimtex#init()")
