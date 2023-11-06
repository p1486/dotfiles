vim.g.mapleader =";"
local set = vim.keymap.set
set('n', 'ss', ':split<Return><C-w>w')
set('n', 'sv', ':vsplit<Return><C-w>w')
set('', 'sh', '<C-w>h')
set('', 'sk', '<C-w>k')
set('', 'sj', '<C-w>j')
set('', 'sl', '<C-w>l')
set('n', '<leade>rf', ':!rustfmt %')
set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
set("n", "<C-m>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
set("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
set("n", "<leade>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
set("n", "ma", "<cmd>lua vim.lsp.buf.code_action()<CR>")
set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
set("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
set("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
set("n", "<C-n>", "<cmd>Fern . -drawer -toggle -reveal=%<CR>")
set("n", "tt", "<cmd>terminal<CR>")
set("n", "tx", "<cmd>belowright new<CR><cmd>terminal<CR>")

local builtin = require('telescope.builtin')
set('n', '<leader>ff', builtin.find_files, {})
set('n', '<leader>fg', builtin.live_grep, {})
set('n', '<leader>fb', builtin.buffers, {})
set('n', '<leader>fh', builtin.help_tags, {})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
