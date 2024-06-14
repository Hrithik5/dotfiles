return {
  'kevinhwang91/nvim-bqf',
  ft = 'qf',  -- Load only for quickfix filetype
  config = function()
    require('bqf').setup({
      auto_resize_height = true,
      preview = {
        auto_preview = true,
        border_chars = { '│', '─', '╭', '╮', '╯', '╰', '│', '─' },
        delay_syntax = 50,
        win_height = 15,
        win_vheight = 15,
        wrap = false,
      },
      func_map = {
        open = 'o',
        drop = 'O',
        split = '<C-s>',
        vsplit = '<C-v>',
        tabdrop = '<C-t>',
        prevfile = 'p',
        nextfile = 'n',
        prev = '<C-p>',
        next = '<C-n>',
        stoggleup = '<S-x>',
        stoggledown = 'x',
        stogglevm = '<S-Space>',
        fzffilter = 'f',
      },
      filter = {
        fzf = {
          action_for = {['ctrl-s'] = 'split', ['ctrl-v'] = 'vsplit', ['ctrl-t'] = 'tab drop'},
          extra_opts = {'--bind', 'ctrl-o:toggle-all', '--prompt', '> '}
        }
      }
    })
  end
}
