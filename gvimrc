colorscheme jellybeans

" フォント設定 
"{{{
if has('gui_macvim')
  set guifont=Inconsolata:h12
  set guifontwide=Courier:h12
  set antialias
elseif has('gui_running')
  set gfn=Takaoゴシック\ 10 
endif
"}}}

" gvimでウインドウの位置とサイズを記憶する 
" http://vim-users.jp/2010/01/hack120/
"{{{
if has('gui_running')
  let g:save_window_file = expand('~/.vimwinpos')
  augroup SaveWindow
    autocmd!
    autocmd VimLeavePre * call s:save_window()
    function! s:save_window()
      let options = [
        \ 'set columns=' . &columns,
        \ 'set lines=' . &lines,
        \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
        \ ]
      call writefile(options, g:save_window_file)
    endfunction
  augroup END
  if filereadable(g:save_window_file)
    execute 'source' g:save_window_file
  endif
endif
"}}}


:hi CursorLine guibg=DarkGreen
