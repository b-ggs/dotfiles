return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/neodev.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local mason_registry = require("mason-registry")

    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    -- :help lspconfig-all

    lspconfig.bashls.setup({
      capabilities = capabilities,
    })

    lspconfig.cssls.setup({
      capabilities = capabilities,
    })

    lspconfig.html.setup({
      capabilities = capabilities,
    })

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })

    lspconfig.pyright.setup({
      capabilities = capabilities,
    })

    lspconfig.ruff.setup({
      capabilities = capabilities,
    })

    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
    })

    local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
      .. "/node_modules/@vue/language-server"

    lspconfig.tsserver.setup({
      capabilities = capabilities,
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = vue_language_server_path,
            languages = { "vue" },
          },
        },
      },
      filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    })

    lspconfig.typos_lsp.setup({
      capabilities = capabilities,
    })

    lspconfig.volar.setup({
      capabilities = capabilities,
    })

    vim.keymap.set("n", "ge", vim.diagnostic.open_float, { desc = "diagnostic open float" })
    vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, { desc = "diagnostic goto prev" })
    vim.keymap.set("n", "gn", vim.diagnostic.goto_next, { desc = "diagnostic goto next" })
    vim.keymap.set("n", "gq", vim.diagnostic.setloclist, { desc = "diagnostic set loclist" })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "LSP declaration" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "LSP definition" })
        vim.keymap.set("n", "gh", vim.lsp.buf.hover, { buffer = ev.buf, desc = "LSP hover" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "LSP implementation" })
        vim.keymap.set("n", "gH", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "LSP signature help" })
        vim.keymap.set(
          "n",
          "gwa",
          vim.lsp.buf.add_workspace_folder,
          { buffer = ev.buf, desc = "LSP add workspace folder" }
        )
        vim.keymap.set(
          "n",
          "gwr",
          vim.lsp.buf.remove_workspace_folder,
          { buffer = ev.buf, desc = "LSP remove workspace folder" }
        )
        vim.keymap.set("n", "gwl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, { buffer = ev.buf, desc = "LSP list workspace folders" })
        vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "LSP type definition" })
        vim.keymap.set("n", "g2", vim.lsp.buf.rename, { buffer = ev.buf, desc = "LSP rename" })
        vim.keymap.set("n", "g3", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "LSP code action" })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "LSP references" })
      end,
    })

    -- Globally add borders to all nvim-lspconfig floating windows
    -- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#borders
    local border = "single"
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or border
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end
  end,
}
