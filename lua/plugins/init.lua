return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
  "scalameta/nvim-metals",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  ft = { "scala", "sbt", "java" },
  opts = function()
    local metals_config = require("metals").bare_config()
    metals_config.on_attach = function(client, bufnr)
      -- your on_attach function
    end

    return metals_config
  end,
  config = function(self, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = self.ft,
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end
   },
   {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
      -- Run gofmt + goimports on save

      local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
         require('go.format').goimports()
        end,
        group = format_sync_grp,
      })
      end,
      event = {"CmdlineEnter"},
      ft = {"go", 'gomod'},
      build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
     },
     {
       "neovim/nvim-lspconfig",
       config = function()
         require("nvchad.configs.lspconfig").defaults()
         require "configs.lspconfig"
       end,
     },
     {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          "lua-language-server", "stylua",
          "html-lsp", "css-lsp" , "prettier"
        },
      },
     },
     {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          "vim", "lua", "vimdoc",
          "html", "css", "go", "rust",
          "typescript", "javascript",
        },
        auto_install = { enable = true }
      },
     },
  }
