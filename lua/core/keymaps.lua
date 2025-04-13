-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Diagnóstico/Erros
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Mostrar diagnóstico' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Diagnóstico anterior' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Próximo diagnóstico' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Lista de diagnósticos' })