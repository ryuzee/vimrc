" nerdtree / ファイルの一覧を表示
nnoremap <silent><C-c> :NERDTreeCWD<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Tree表示の際にgitの登録状況を表示する
" デフォルト設定の文字はずれるので自分で記号を指定する
let g:NERDTreeIndicatorMap = {
  \ "Modified"  : "*",
  \ "Staged"    : "s",
  \ "Untracked" : "-",
  \ "Renamed"   : "r",
  \ "Unmerged"  : "u",
  \ "Deleted"   : "D",
  \ "Dirty"     : "d",
  \ "Clean"     : "c",
  \ "Unknown"   : "?"
  \ }
let g:nerdtree_tabs_open_on_gui_startup = 0
