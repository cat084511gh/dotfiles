call plug#begin()

"--------------------------------------

  " indent
  Plug 'Yggdroot/indentLine'

  " space highlight
  Plug 'bronson/vim-trailing-whitespace'

"---------------------------------------

  " color_scheme
  Plug 'jacoborus/tender.vim'

  " status_line
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " fzf file search
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " coc
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

source <sfile>:h/color_scheme.plug
source <sfile>:h/status_line.plug
source <sfile>:h/coc.plug
