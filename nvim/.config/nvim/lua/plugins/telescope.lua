return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    { "<Leader>f", ":Telescope find_files<CR>" },
    { "<Leader>g", ":Telescope live_grep<CR>" },
    { "<Leader>b", ":Telescope buffers<CR>" },
    { "<Leader>d", ":Telescope tags<CR>" },
    { "<Leader>/", ":Telescope current_buffer_fuzzy_find<CR>" },
    { "<Leader>k", ":Telescope keymaps<CR>" },
    { "<Leader>s", ":Telescope lsp_dynamic_workspace_symbols<CR>" },
  },
  lazy = true,
  config = function()
    local previewers = require("telescope.previewers")

    -- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#disable-highlighting-for-certain-files
    local _bad = { ".*%.csv", ".*%.lua", "Dockerfile.*" } -- Put all filetypes that slow you down in this array
    local bad_files = function(filepath)
      for _, v in ipairs(_bad) do
        if filepath:match(v) then
          return false
        end
      end

      return true
    end

    local new_maker = function(filepath, bufnr, opts)
      opts = opts or {}
      if opts.use_ft_detect == nil then opts.use_ft_detect = true end
      opts.use_ft_detect = opts.use_ft_detect == false and false or bad_files(filepath)
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end

    require("telescope").setup {
      defaults = {
        buffer_previewer_maker = new_maker,
        preview = {
          filesize_limit = 0.05, -- in MB
        },
      }
    }
  end,
}
