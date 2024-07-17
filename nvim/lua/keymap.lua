-- keymap options
local opts = {
  silent = true,  -- キー入力時に表示メッセージを抑制
  noremap = true, -- 再帰的なマッピングを無効化
}

local coc_opts = {
  silent = true,               -- キー入力時に表示メッセージを抑制
  noremap = true,              -- 再帰的なマッピングを無効化
  expr = true,                 -- 式を評価してキー入力とする
  replace_keycodes = false,    -- keycodeを置換しない
}
-- 移動
vim.api.nvim_set_keymap('n', '<S-W>', 'k', opts)
vim.api.nvim_set_keymap('n', '<S-A>', 'h', opts)
vim.api.nvim_set_keymap('n', '<S-S>', 'j', opts)
vim.api.nvim_set_keymap('n', '<S-D>', 'l', opts)

-- tab操作用のキーマッピング
vim.api.nvim_set_keymap('n', 'tp', ':tabp<CR>', opts)
vim.api.nvim_set_keymap('n', 'tn', ':tabn<CR>', opts)
vim.api.nvim_set_keymap('n', 'tx', ':tabclose<CR>', opts)

-- NvimTreeのトグル
vim.api.nvim_set_keymap('n', ' ', ':NvimTreeToggle<CR>', opts)

-- coc.nvim用のTabキーのバインディング
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : "<Tab>"', coc_opts)
vim.keymap.set("i", "<S-TAB>", 'coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"', coc_opts)
vim.keymap.set("i", "<CR>", 'coc#pum#visible() ? coc#pum#confirm() : "<CR>"', coc_opts)
vim.api.nvim_set_keymap('n', 'j', '<Plug>(coc-definition)', opts)
vim.api.nvim_set_keymap('n', 'k', '<Plug>(coc-references)', opts)

-- fzf-luaを使用したプロジェクト内検索とファイル検索
vim.api.nvim_set_keymap('n', '<C-p>', ':FzfLua git_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-g>', ':FzfLua grep_project<CR>', opts)
vim.api.nvim_set_keymap('n', 'fr', [[<cmd>lua require('fzf-lua').grep({ search = vim.fn.expand('<cword>') })<CR>]], opts)

-- 次の変更 (Hunk) にジャンプ
vim.api.nvim_set_keymap('n', ']c', "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'", { noremap = true, silent = true, expr = true })
-- 前の変更 (Hunk) にジャンプ
vim.api.nvim_set_keymap('n', '[c', "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'", { noremap = true, silent = true, expr = true })
