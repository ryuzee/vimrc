" easymotion / カーソル移動を楽にする
" http://blog.remora.cx/2012/08/vim-easymotion.html
" ; + (b|w)などで簡単選択
" w カーソルより右側の単語(word)の先頭にマッチ
" W カーソルより右側の単語(WORD)の先頭にマッチ
" b カーソルより左側の単語(word)の先頭にマッチ
" B カーソルより左側の単語(WORD)の先頭にマッチ
" e カーソルより右側の単語(word)の後ろにマッチ
" E カーソルより右側の単語(WORD)の後ろにマッチ
" geカーソルより左側の単語(word)の後ろにマッチ
" gEカーソルより左側の単語(WORD)の後ろにマッチ
" S 画面内すべてを対象として単語の先頭にマッチ
let g:EasyMotion_leader_key=";"
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" migemoを使って日本語文字列をアルファベットのまま検索可能にする
let g:EasyMotion_use_migemo = 1
" カラー設定変更
hi EasyMotionTarget ctermfg=25 guifg=#ff0000
hi EasyMotionShade  ctermfg=25 guifg=#aaaaaa
