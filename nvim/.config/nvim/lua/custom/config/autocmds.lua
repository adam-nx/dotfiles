local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Opens non-text files in the default program instead of in Neovim
local openFile = augroup('openFile', {})
autocmd('BufReadPost', {
  pattern = {
    '*.epub',
    '*.jpeg',
    '*.jpg',
    '*.pdf',
    '*.png',
  },
  callback = function()
    vim.fn.jobstart('xdg-open "' .. vim.fn.expand '%' .. '"', {
      detach = true,
    })
    vim.api.nvim_buf_delete(0, {})
  end,
  group = openFile,
})

vim.api.nvim_create_autocmd('VimEnter', {
  group = vim.api.nvim_create_augroup('Persistence', { clear = true }),
  callback = function()
    -- NOTE: Before restoring the session, check:
    -- 1. No arg passed when opening nvim, means no `nvim --some-arg ./some-path`
    -- 2. No pipe, e.g. `echo "Hello world" | nvim`
    if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
      require('persistence').load()
    end
  end,
  -- HACK: need to enable `nested` otherwise the current buffer will not have a filetype(no syntax)
  nested = true,
})
