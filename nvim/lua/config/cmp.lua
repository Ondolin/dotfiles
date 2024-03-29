local cmp = require'cmp'
local lspkind = require('lspkind')

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local next_item_tab = function(fallback)
    if cmp.visible() then
        cmp.select_next_item()
    elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
    elseif has_words_before() then
        cmp.complete()
    else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
    end
end

local next_item_arrow = function(fallback)
    if cmp.visible() then
        cmp.select_next_item()
    elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
    else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
    end
end

local previous_item = function(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
    elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
    else
        fallback()
    end
end

local function has_value (tab, val)
    for _, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local disabled_compleations = {}

local function load_cmp()
    local sources = {'path', 'nvim_lsp', 'vsnip'}

    -- table.insert(sources, 'copilot')
    -- table.insert(sources, 'cmp_tabnine')

    local sources_conf = {}

    for _, source in pairs(sources) do
        if not has_value(disabled_compleations, source) then
            table.insert(sources_conf, { name = source })
        end
    end

    cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        mapping = {
            ['<C-k>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            ['<C-j>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            ['<C-e>'] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            ['<Esc>'] = cmp.mapping(function(fallback)
                fallback()
            end, {
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            ['<CR>'] = cmp.mapping.confirm({ select = false }),
            ["<Tab>"] = cmp.mapping(next_item_tab, { "i", "s" }),
            ["<Down>"] = cmp.mapping(next_item_arrow, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(previous_item, { "i", "s" }),
            ["<Up>"] = cmp.mapping(previous_item, { "i", "s" }),
        },
        formatting = {
            format = lspkind.cmp_format({
                mode = 'symbol_text',
                maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

                -- The function below will be called before any actual modifications from lspkind
                -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                before = function (entry, vim_item)
                    return vim_item
                end,
                menu = ({
                    buffer = "[BUF]",
                    omni = "[OMNI]",
                    nvim_lsp = "[LSP]",
                    path = "[PATH]",
                    vsnip = "[SNIP]",
                    cmp_git = "[GIT]",
                    cmp_tabnine = "[TAB]",
                    copilot = "[COP]",
                })
            })
        },
        sources = cmp.config.sources(sources_conf)
    })


end

load_cmp()

local function load_cmp_sources(sources)
    for _, source in ipairs(sources) do

        for _, filetype in pairs(source[1]) do

            local conf = {}
            for _, c in pairs(source[2]) do
                if not has_value(disabled_compleations, c) then
                    table.insert(conf, { name = c })
                end
            end

            cmp.setup.filetype(filetype, {
                sources = cmp.config.sources(conf)
            })

        end

    end

end

local compleat_sources = {
    { {'tex'}, {'path', 'nvim_lsp', 'cmp_tabnine', 'vsnip', 'buffer'} },
    { {'lua'}, {'path', 'nvim_lsp', 'vsnip', 'buffer', 'nvim_lua'} },
    { {'toml'}, {'path', 'nvim_lsp', 'crates', 'vsnip'} }
}

load_cmp_sources(compleat_sources)

vim.api.nvim_create_user_command('DisableCopilot', function()
    table.insert(disabled_compleations, 'copilot')
    load_cmp_sources(compleat_sources)
    load_cmp()
end, { force = true })

vim.api.nvim_create_user_command('DisableTabnine', function()
    table.insert(disabled_compleations, 'cmp_tabnine')
    load_cmp_sources(compleat_sources)
    load_cmp()
end, { force = true })

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' },
        { name = 'vsnip' },
        { name = 'cmp_tabnine' },
    }, {
        { name = 'buffer' },
    })
})

require("cmp_git").setup()

cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' },
    })
})
