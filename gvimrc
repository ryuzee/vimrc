" set background=dark
" colorscheme solarized
:colorscheme molokai

" フォント設定
if has('gui_macvim')
  set guifont=RictyDiminished-RegularForPowerline:h14
  set guifontwide=RictyDiminished-RegularForPowerline:h14
  set antialias
elseif has('gui')
  set guifont=Ricty\ Diminished\ for\ Powerline\ 12
  set guifontwide=Ricty\ Diminished\ for\ Powerline\ 12
else
  set guifont=Ricty\ Diminished\ for\ Powerline\ 12
  set guifontwide=Ricty\ Diminished\ for\ Powerline\ 12
endif

" gvimでウインドウの位置とサイズを記憶する
" http://vim-users.jp/2010/01/hack120/
if has('gui')
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
