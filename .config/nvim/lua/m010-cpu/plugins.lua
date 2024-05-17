local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Theme --
  {
    "svrana/neosolarized.nvim",
    dependencies = { "tjdevries/colorbuddy.nvim" },
  },
  "norcalli/nvim-colorizer.lua", -- color codes highlight,
  -- Status --
  "nvim-lualine/lualine.nvim",  -- status bar,
  "akinsho/nvim-bufferline.lua", -- tab bar,
  -- Startup Time --
  "dstein64/vim-startuptime",
  -- LSP --
  {
    "williamboman/mason.nvim", -- LSP manager
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig", -- LSP
  },
  "glepnir/lspsaga.nvim",    -- LSP UIs
  "onsails/lspkind-nvim",    -- vscode pictograms
  "L3MON4D3/LuaSnip",        -- More Snippet
  "stevearc/conform.nvim",
  -- Completion --
  "hrsh7th/nvim-cmp",    -- Completion
  "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source built-in LSP,
  "hrsh7th/cmp-nvim-lua", -- nvim-cmp source LUA API,
  "hrsh7th/cmp-path",    -- nvim-cmp source path,
  "hrsh7th/cmp-buffer",  -- nvim-cmp source buffer,
  "hrsh7th/cmp-cmdline", -- nvim-cmp source vim cmp-cmdline,
  -- File Explorer --
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {},
    cmd = "NvimTreeToggle",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  },
  "nvim-telescope/telescope.nvim",             -- file finder
  "nvim-telescope/telescope-file-browser.nvim", -- file browser
  "nvim-lua/plenary.nvim",                     -- telescope dependencies
  "sharkdp/fd",                                -- find upgrade
  "BurntSushi/ripgrep",                        -- grep upgrade
  "nvim-tree/nvim-web-devicons",
  -- Autopairs & Autotag --
  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",
  -- Comments --
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  -- Debugger --
  -- use {
  --  'mfussenegger/nvim-dap',
  --  'jay-babu/mason-nvim-dap.nvim',
  --  'rcarriga/nvim-dap-ui',
  --  'theHamsta/nvim-dap-virtual-text',
  --  'nvim-telescope/telescope-dap.nvim',
  --  cmd = 'dap',
  -- }
  -- Popup UI --
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  -- More --
  {
    "folke/trouble.nvim", -- troubleshooting UI
    cmd = "Trouble",
  },
  "echasnovski/mini.indentscope", -- indent scope
  "lewis6991/gitsigns.nvim",     -- git signs
})
