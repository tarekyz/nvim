return {
  -- Terminal
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup({
        open_mapping = [[<c-\>]],
        hide_number = true,
        start_on_insert = true,
        direction = 'float',
        float_opts = {
          border = 'curved',
          winblend = 0,
        },
      })

      -- Terminal instances
      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true })
      local bashtop = Terminal:new({ cmd = 'bashtop', hidden = true })
      local taskwarrior = Terminal:new({ cmd = 'taskwarrior-tui', hidden = true })

      -- Terminal toggle functions
      function _LAZYGIT_TOGGLE()
        lazygit:toggle()
      end

      function _BASHTOP_TOGGLE()
        bashtop:toggle()
      end

      function _TASKWARRIOR_TOGGLE()
        taskwarrior:toggle()
      end

      -- Keymaps
      vim.keymap.set('n', '<leader>lg', _LAZYGIT_TOGGLE, { silent = true, desc = 'LazyGit' })
      vim.keymap.set('n', '<leader>bt', _BASHTOP_TOGGLE, { silent = true, desc = 'Bashtop' })
      vim.keymap.set('n', '<leader>tw', _TASKWARRIOR_TOGGLE, { silent = true, desc = 'TaskWarrior' })
    end,
  },

  -- Formatting
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          lua = { 'stylua' },
          python = { 'ruff_format' },
          javascript = { 'prettierd', 'prettier', stop_after_first = true },
          typescript = { 'prettierd', 'prettier', stop_after_first = true },
          javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
          typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
          json = { 'prettierd', 'prettier', stop_after_first = true },
          markdown = { 'prettierd', 'prettier', stop_after_first = true },
          rust = { 'rustfmt' },
          go = { 'gofmt' },
          zig = { 'zig_fmt' },
          css = { 'prettierd', 'prettier', stop_after_first = true },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_format = 'fallback',
        },
      })
    end,
  },

  -- Debug Adapter Protocol
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'mfussenegger/nvim-dap-python',
      {
        'rcarriga/nvim-dap-ui',
        dependencies = { 'nvim-neotest/nvim-nio' },
      },
    },
    config = function()
      local dap = require('dap')

      -- DAP keymaps
      vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Continue' })
      vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Debug: Step Over' })
      vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Debug: Step Into' })
      vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'Debug: Step Out' })
      vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
      vim.keymap.set('n', '<Leader>B', dap.set_breakpoint, { desc = 'Debug: Set Breakpoint' })
      vim.keymap.set('n', '<Leader>lp', function()
        dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
      end, { desc = 'Debug: Log Point' })
      vim.keymap.set('n', '<Leader>dr', dap.repl.open, { desc = 'Debug: REPL' })
      vim.keymap.set('n', '<Leader>dl', dap.run_last, { desc = 'Debug: Run Last' })
    end,
  },

  -- Harpoon for file navigation
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require('harpoon')
      harpoon:setup({})

      vim.keymap.set('n', '<leader>1', function()
        harpoon:list():add()
      end, { desc = 'Add to harpoon' })
      vim.keymap.set('n', '<C-t>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Toggle harpoon menu' })

      -- Quick select
      vim.keymap.set('n', '<C-1>', function() harpoon:list():select(1) end)
      vim.keymap.set('n', '<C-2>', function() harpoon:list():select(2) end)
      vim.keymap.set('n', '<C-3>', function() harpoon:list():select(3) end)
      vim.keymap.set('n', '<C-4>', function() harpoon:list():select(4) end)

      -- Navigation
      vim.keymap.set('n', '<C-S-P>', function() harpoon:list():prev() end)
      vim.keymap.set('n', '<C-S-N>', function() harpoon:list():next() end)
    end,
  },

  -- Hop for easy motion
  {
    'smoka7/hop.nvim',
    version = '*',
    config = function()
      require('hop').setup({
        keys = 'etovxqpdygfblzhckisuran',
      })
      vim.keymap.set('n', '<leader>ho', '<cmd>HopWord<CR>', { desc = 'Hop to word' })
    end,
  },

  -- AI completion
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup({
        keymaps = {
          accept_suggestion = '<Right>',
          clear_suggestion = '<C-]>',
          accept_word = '<C-j>',
        },
        ignore_filetypes = { cpp = true },
        color = {
          suggestion_color = '#ffffff',
          cterm = 244,
        },
        log_level = 'info',
        disable_inline_completion = false,
        disable_keymaps = false,
        condition = function()
          return false
        end,
      })
    end,
  },
}

