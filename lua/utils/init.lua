local M = {}

-- Reload configuration
function M.reload_config()
  vim.cmd('source $HOME/.config/nvim/init.lua')
  print('Config reloaded!')
end

return M
