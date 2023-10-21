local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fa', function()
    builtin.find_files({
        search_dirs = { "~", "~/repos", "~/.config" },
        prompt_title = "< Home | Repos | Config >",
        hidden = true, -- to find hidden files as well
        follow = true, -- to resolve symlinks
        ignore = { "node_modules" } -- add other directories to exclude if needed
    })
end, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
