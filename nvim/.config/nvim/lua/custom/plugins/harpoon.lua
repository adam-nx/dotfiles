local function get_key()
  local result = vim.system({ 'git', 'rev-parse', '--abbrev-ref', 'HEAD' }, { text = true }):wait()
  if result.code == 0 then
    return vim.fn.getcwd() .. '$' .. result.stdout:gsub('%s+', '')
  else
    return vim.fn.getcwd()
  end
end

return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },

  opts = {
    settings = {
      save_on_toggle = true,
      sync_on_ui_close = true,
      key = get_key,
    },
  },

  keys = function()
        -- stylua: ignore
        local keys = {
            { '<leader>a', function() require('harpoon'):list():add() end, desc = 'H[a]rpoon File', },
            { '<leader>A', function() local harpoon = require 'harpoon' harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = 'H[A]rpoon Quick Menu',
          },
        }
    for i = 1, 9 do
           -- stylua: ignore
          table.insert(keys, { '<leader>' .. i, function() require('harpoon'):list():select(i) end, })
    end
    return keys
  end,
}
