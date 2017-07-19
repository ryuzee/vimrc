" eblookを使ってローカル辞書検索
" <LEADER> y でカーソル位置の文字を検索できる
" <LEADER> CTRL + y で検索ウィンドウを表示できる
" See eblook.sh
let eblook_dictlist1 = [
  \{
  \'book': $HOME . '/dictionary/epwing',
  \'name': 'edict2',
  \'title': 'edict2',
  \},
\]
" eblookがeuc-jpで動作している？っぽいのでエンコードを指定しておく
let eblookenc = 'euc-jp'
let eblook_entrywin_height = 10
let eblook_contentwin_height = 10
let eblook_stemming = 1
