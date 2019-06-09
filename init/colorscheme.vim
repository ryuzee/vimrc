" 見栄え関連の設定
if !has('gui_running')
  colorscheme molokai
  set t_Co=256
  " set background=dark
  " colorscheme solarized
endif
function! s:hl_colorscheme_modify_molokai()
  highlight! DiffText term=reverse cterm=bold ctermbg=239 gui=bold,italic guibg=#4C4745
  highlight! DiffDelete term=bold ctermfg=180 ctermbg=0 gui=bold guifg=#960050 guibg=#1E0010
  highlight! DiffAdd term=bold ctermbg=0 guibg=#13354A
  highlight! Visual ctermfg=236 ctermbg=119 guifg=#353535 guibg=#95e454
  highlight! default link MatchParen Title
endfunction
autocmd BufWinEnter,ColorScheme * call s:hl_colorscheme_modify_molokai()

" 挿入モードかどうかで色を変える
augroup InsertHook
  autocmd!
  autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
  autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

" コメント行をグレー表示する(コンソール）
highlight Comment ctermfg=7
