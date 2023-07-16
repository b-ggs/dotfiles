return {
    "nvim-neotest/neotest",
    dependencies = {"nvim-neotest/neotest-vim-test"},
    opts = function() return {adapters = {require("neotest-vim-test")}} end,
    init = function()
        vim.cmd([[
          nmap <silent> tt <cmd>lua require("neotest").run.run()<CR>
          nmap <silent> ts <cmd>lua require("neotest").summary.toggle()<CR>
          nmap <silent> to <cmd>lua require("neotest").output.open()<CR>
        ]])
    end
}
