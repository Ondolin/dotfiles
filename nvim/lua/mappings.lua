
local nnoremap = function(lhs, rhs, silent)
    vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = silent })
end

local inoremap = function(lhs, rhs)
    vim.api.nvim_set_keymap("i", lhs, rhs, { noremap = true })
end

local vnoremap = function(lhs, rhs)
    vim.api.nvim_set_keymap("v", lhs, rhs, { noremap = true })
end

-- Escape redraws the screen and removes any search highlighting.
nnoremap("<esc>", ":noh<return><esc>")

-- TAB in normal mode will move to text buffer
nnoremap("<TAB>", ":bnext<CR>", true)
-- SHIFT-TAB will go back
nnoremap("<S-TAB>", ":bprevious<CR>", true)


-- LSP
nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", true)
nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", true)
nnoremap("gr", "<cmd>LspTrouble lsp_references<CR>", true)
nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", true)
nnoremap("<C-space>", "<cmd>lua vim.lsp.buf.hover()<CR>", true)
vnoremap("<C-space>", "<cmd>RustHoverRange<CR>")

nnoremap("ge", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", true)
nnoremap("gE", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", true)
nnoremap("<silent><leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", true)
nnoremap("<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", true)
nnoremap("<Leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", true)
vnoremap("<Leader>a", "<cmd>lua vim.lsp.buf.range_code_action()<CR>")

nnoremap("<Leader>ld", "<cmd>LspTrouble lsp_definitions<CR>", true)
nnoremap(
  "<Leader>le",
  "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
  true
)
nnoremap("<Leader>lE", "<cmd>LspTroubleWorkspaceToggle<CR>", true)

-- Telescope
nnoremap("<Leader>f", '<cmd>Telescope find_files<CR>')
nnoremap("<C-Tab>", '<cmd>Telescope buffers<CR>')
nnoremap("<C-f>", '<cmd>Telescope current_buffer_fuzzy_find<CR>')
inoremap(
  "<C-f>",
  '<Esc><cmd>Telescope current_buffer_fuzzy_find<CR>'
)

nnoremap("<Leader>n", '<cmd>NERDTreeFocus<CR>')

nnoremap("z=", '<cmd>Telescope spell_suggest <CR>')
nnoremap("<C-v>", '<cmd>Telescope neoclip <CR>')
