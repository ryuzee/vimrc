" Windowの形状設定
if has('gui_running')
  set showtabline=2  " タブを常に表示
  set imdisable  " IMを無効化
  set guioptions-=T   " ツールバー非表示
endif
if has('gui_macvim')
  "set transparency=0  " 透明度を指定
endif

" ウィンドウサイズ
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
