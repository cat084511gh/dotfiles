-- options
vim.opt.number = true
vim.opt.encoding = 'UTF-8'
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.updatetime = 250
vim.opt.belloff = 'all'
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.clipboard = { 'unnamed', 'unnamedplus' }
vim.opt.laststatus = 3
vim.o.binary = true
vim.o.eol = true

-- hide tmux settings
if not vim.fn.has('gui_running') and os.getenv('TMUX') then
  vim.api.nvim_create_augroup('Tmux', { clear = true })
  vim.api.nvim_create_autocmd({ 'VimEnter', 'VimLeave' }, {
    pattern = '*',
    command = 'silent !tmux set status',
    group = 'Tmux',
  })
end
