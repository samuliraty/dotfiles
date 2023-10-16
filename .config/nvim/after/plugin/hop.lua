local hop = require('hop')

-- Map '<leader>h' to hop.hint_words function
vim.keymap.set('', '<leader>h', hop.hint_words, { remap = true })
