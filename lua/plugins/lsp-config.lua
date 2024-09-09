return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls","basedpyright"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      local config = require('plugins.lsp-config')
      lspconfig.lua_ls.setup({})
      local on_attach = config.on_attach
      local capabilities = config.capabilities
      lspconfig.basedpyright.setup({
        on_attach,
        capabilities,
        filetypes = {'python'}
      })
      vim.keymap.set('n', "K", vim.lsp.buf.hover,{})
    end
  }

}
