" Display {{{

  syntax enable " Turn on the syntax highlight.
  set nu " Show line numbers.
  " set cursorline
  " set cursorcolumn

" }}}

" Mappings {{{

  let mapleader = "-" " Set the global leader.
  inoremap jk <esc>  " Map jk in insert mode to esc.
  nnoremap H ^
  nnoremap L $
  
  " Open the vimrc file, and source it.
  nnoremap <leader>ev :vsplit $MYVIMRC<cr>
  nnoremap <leader>sv :source $MYVIMRC<cr>

" }}} 

" Status line{{{

  set laststatus=2      " Display the status line always.
  set statusline=%=     " Switch to the right side
  set statusline+=[%F]  " Path to the file
  set statusline+=\ -\  " Separator
  set statusline+=%y    " Filetype of the file
  set statusline+=\ -\  " Separator
  set statusline+=[%l   " Current line
  set statusline+=\ /\  " Separator
  set statusline+=%L]   " Total lines

" }}}

" Vimscript file folding settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
