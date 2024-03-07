set number
set encoding=UTF-8
set backspace=indent,eol,start
set updatetime=250
set belloff=all
set expandtab
set tabstop=2
set shiftwidth=2
set clipboard=unnamed,unnamedplus

nnoremap tc :tabnew<CR>
" 前のタブを開く
nnoremap tp :tabp<CR>
" 次のタブを開く
nnoremap tn :tabn<CR>
" タブを閉じる
nnoremap tx :tabclose<CR>

" terminal :T
command! -nargs=* T split | wincmd j | resize 10 | terminal <args>

" hide tmux
if !has('gui_running') && $TMUX !=# ''
    augroup Tmux
        autocmd!
        autocmd VimEnter,VimLeave * silent !tmux set status
    augroup END
endif
