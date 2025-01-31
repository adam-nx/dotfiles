-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local set = vim.keymap.set

--  See `:help y`
--  See `:help <C-r>`
set('v', '/', 'y/<C-R>"<CR>')
set('v', '<leader>g', 'y:grep "<C-r>""<CR>')

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- F1 is Esc
set({ 'n', 'i' }, '<F1>', '<Esc>')
set({ 'n', 'v' }, '<C-s>', ':update<CR>')
set({ 'i' }, '<C-s>', '<Esc>:update<CR>')

-- Diagnostic keymaps
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Autosave
set('n', '<Silent><Esc>', '<esc>:update<cr>', { desc = 'Autosave' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- stylua: ignore
set('n', '<Leader>C', ':let @+ = fnamemodify(expand("%"), ":~:.")<CR><cmd>echo "Copied path to clipboard!"<CR>', { desc = 'Copy path to file' })
-- stylua: ignore
set( 'n', '<Leader>R', ':let @+ = "https://gitlab.com/adalpha/pillar/-/blob/master/" . fnamemodify(expand("%"), ":~:.")<CR><cmd>echo "Copied path to clipboard!"<CR>', { desc = 'Copy remote path to file' })

set('n', '<F3>', ':set spell!<CR>', { desc = 'Enable spelling' })

set('v', 'J', ":m '>+1<CR>gv=gv")
set('v', 'K', ":m '<-2<CR>gv=gv")

set('v', '<leader>t', ":!column -t -s '|' -o '|'<CR>", { desc = 'format markdown [t]able' }) -- https://heitorpb.github.io/bla/format-tables-in-vim/
