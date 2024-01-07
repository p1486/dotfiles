local o = vim.opt
local c = vim.cmd
o.relativenumber = true
o.title = true
o.autoindent = true
o.syntax = "on"
o.wrap = false
o.hlsearch = true
o.termguicolors = true
o.mouse = "a"
o.encoding = "utf-8"
o.fileencoding = "utf-8"
o.ambiwidth = "single"
o.tabstop = 4
o.shiftwidth = 4
o.clipboard:append{ "unnamedplus" }
o.ignorecase = true
o.smartcase = true
o.autoread = true
o.laststatus = 3
o.background = "dark"
o.signcolumn = "yes"
o.cmdheight = 0
o.incsearch = true
o.hidden = true
o.swapfile = false
o.copyindent = true
o.cursorline= true
o.shell = "zsh"
o.guicursor = "a:blinkwait700-blinkon400-blinkoff250"
o.helplang = "ja,en"
o.splitright = true
o.expandtab = true
o.smarttab = true
o.winblend = 20
c("autocmd TermOpen * :startinsert")
c("autocmd TermOpen * setlocal norelativenumber")
c("autocmd TermOpen * setlocal nonumber")

vim.api.nvim_create_augroup("vimrc", { clear = true })
vim.api.nvim_create_autocmd("VimLeave", {
    group = "vimrc",
    pattern = "*.rs",
    command = ":!rustfmt %"
})
vim.api.nvim_create_autocmd("VimLeave", {
    group = "vimrc",
    pattern = "*.go",
    command = ":!go fmt %"
})
vim.api.nvim_create_autocmd("VimLeave", {
    group = "vimrc",
    pattern = { "*.c", "*.cc", "*.cpp", "*.h", "*.hpp" },
    command = ":!clang-format -i --style='{ IndentWidth: 4, BasedOnStyle: LLVM}' %"
})
