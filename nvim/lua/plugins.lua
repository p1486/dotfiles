local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'lambdalisue/fern.vim',
        dependencies = {
            { 'lambdalisue/nerdfont.vim', },
            {
                'lambdalisue/fern-renderer-nerdfont.vim',
                config = function()
                    vim.g['fern#renderer'] = "nerdfont"
                    vim.g['fern#renderer#nerdfont#indent_markers'] = 1
                end
            },
        },
    },
    {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        }
    },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-vsnip",
    "onsails/lspkind.nvim",

    "norcalli/nvim-colorizer.lua",

    "nvim-tree/nvim-web-devicons",
    "nvim-lualine/lualine.nvim",

    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

    "romgrk/barbar.nvim",

    {
    'olivercederborg/poimandres.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('poimandres').setup {
            bold_vert_split = false,
            dim_nc_background = true,
            disable_background = true,
            disable_float_background = false,
            disable_italics = false,
        }
    end,
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },

    {
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({
                border_style = "single",
                devicon = true,
                title = true,
                symbol_in_winbar = {
                    enable = true,
                    separator = '›',
                    show_file = true,
                    folder_level = 1
                },
            })
        end
    },

    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",

    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

})

require("colorizer").setup()

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

require'nvim-treesitter.configs'.setup {

  ensure_installed = { "lua", "rust", "python", "markdown", "markdown_inline", "bash", "yaml", "json", "javascript", "tsx", "typescript"  },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}
require("ibl").setup()
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "pyright",
        "clangd",
        "tsserver",
    }
}
require("mason-lspconfig").setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {}
    end,
}
