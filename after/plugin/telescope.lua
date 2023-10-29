local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
vim.keymap.set('n', '<leader>tg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ts', builtin.grep_string, {})
vim.keymap.set('n', '<leader>td', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>to', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>th', builtin.search_history, {})
vim.keymap.set('n', '<leader>tm', builtin.marks, {})
vim.keymap.set('n', '<leader>tw', builtin.spell_suggest, {})
vim.keymap.set('n', '<leader>tl', builtin.highlights, {})
vim.keymap.set('n', '<leader>tc', builtin.current_buffer_fuzzy_find, {})

