return {
  "neovim/nvim-lspconfig",
  config = function()
    -- TODO: Trim this down?

    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "ge", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "gn", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "gq", vim.diagnostic.setloclist, opts)

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
      vim.keymap.set("n", "gh", vim.lsp.buf.hover, bufopts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
      vim.keymap.set("n", "gH", vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set("n", "gwa", vim.lsp.buf.add_workspace_folder, bufopts)
      vim.keymap.set("n", "gwr", vim.lsp.buf.remove_workspace_folder, bufopts)
      vim.keymap.set("n", "gwl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, bufopts)
      vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set("n", "g2", vim.lsp.buf.rename, bufopts)
      vim.keymap.set("n", "g3", vim.lsp.buf.code_action, bufopts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
      vim.keymap.set("n", "gF", vim.lsp.buf.formatting, bufopts)
    end

    -- Globally add borders to all nvim-lspconfig floating windows
    -- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#borders
    border = "single"
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or border
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    -- Setup lspconfig.
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

    require("lspconfig")["astro"].setup({
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
    })

    require("lspconfig")["cssls"].setup({
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
    })

    require("lspconfig")["emmet_ls"].setup({
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
      filetypes = { "html", "htmldjango" },
    })

    require("lspconfig")["html"].setup({
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
      filetypes = {
        "html",
        "typescriptreact",
        "javascriptreact",
        "css",
        "sass",
        "scss",
        "less",
        "htmldjango",
      },
    })

    require("lspconfig")["pyright"].setup({
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
    })

    require("lspconfig")["rust_analyzer"].setup({
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
    })

    require("lspconfig")["svelte"].setup({
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
    })

    require("lspconfig")["terraformls"].setup({
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
    })

    require("lspconfig")["tflint"].setup({
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
    })

    require("lspconfig")["tsserver"].setup({
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
    })

    require("lspconfig")["vimls"].setup({
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
    })

    -- require('lspconfig')['volar'].setup {
    --   on_attach = on_attach,
    --   flags = lsp_flags,
    --   capabilities = capabilities,
    -- }
    --
    -- require('lspconfig')['vuels'].setup {
    --   on_attach = on_attach,
    --   flags = lsp_flags,
    --   capabilities = capabilities,
    -- }

    -- https://github.com/2nthony/dotfiles/blob/main/.config/lvim/lua/plugins/lspconfig.lua

    -- vue
    -- enable take over mode, disable tsserver
    local lsp = require("lspconfig")
    local util = require("lspconfig.util")

    local vue_path = util.path.join(project_root, "node_modules", "vue")
    local is_vue = vim.fn.isdirectory(vue_path) == 1
    if is_vue then
      lsp.volar.setup({
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
        filetypes = {
          "vue",
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "json",
        },
      })
      lsp.tsserver.setup({
        root_dir = function()
          return false
        end,
        single_file_support = false,
      })
    end

    require("lspconfig")["lua_ls"].setup({
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
    })
  end,
}
