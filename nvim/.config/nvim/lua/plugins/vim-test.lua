return {
    "vim-test/vim-test",
    init = function()
        vim.cmd([[
            nmap <silent> tn :TestNearest<CR>
            nmap <silent> tf :TestFile<CR>
            let test#strategy = "neovim"
            let test#neovim#term_position = "vert"
            " Override this value in local.nvimrc
            let test#python#djangotest#executable="docker exec web python manage.py test"
        ]])
    end
}
