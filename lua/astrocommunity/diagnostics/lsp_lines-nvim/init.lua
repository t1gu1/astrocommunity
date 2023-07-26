return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<leader>uD"] = { function() require("lsp_lines").toggle() end, desc = "Toggle virtual diagnostic lines" },
        },
      },
    },
  },
  opts = {},
  config = function(_, opts)
    -- disable diagnostic virtual text
    local lsp_utils = require "astrocore.utils.lsp"
    lsp_utils.diagnostics[3].virtual_text = false
    vim.diagnostic.config(lsp_utils.diagnostics[vim.g.diagnostics_mode])
    require("lsp_lines").setup(opts)
  end,
}
