local utils = require "astrocore.utils"
return {
  { import = "astrocommunity.pack.yaml" },
  {
    "AstroNvim/astrolsp",
    opts = {
      handlers = { dartls = false },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "dart")
      end
    end,
  },
  {
    "akinsho/flutter-tools.nvim",
    ft = "dart",
    init = function() astrocore.lsp.skip_setup = utils.list_insert_unique(astrocore.lsp.skip_setup, "dartls") end,
    opts = function()
      return {
        lsp = require("astrocore.utils.lsp").config "dartls",
        debugger = { enabled = true },
      }
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "jay-babu/mason-nvim-dap.nvim",
        opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "dart") end,
      },
    },
  },
  -- Add "flutter" extension to "telescope"
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = function() require("telescope").load_extension "flutter" end,
  },
}
