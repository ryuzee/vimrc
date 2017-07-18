"===> PHP関連の設定 {{{1
augroup php_settings
  autocmd!
  " makeコマンドを入力すると、PHPの構文エラーがないかどうかもチェック可能
  " PSR2に従いタブからスペースに展開するように変更
  autocmd FileType php set tabstop=4 shiftwidth=4 autoindent smartindent expandtab makeprg=php\ -l\ % errorformat=%m\ in\ %f\ on\ line\ %l
  " 文字列の中のSQLをハイライトする
  autocmd FileType php let php_sql_query=1
  " Baselibメソッドのハイライトを行う
  autocmd FileType php let php_baselib=1
  " 文字列の中のHTMLをハイライトする
  autocmd FileType php let php_htmlInStrings=1
  " ショートタグのハイライトを無効にする
  autocmd FileType php let php_noShortTags=1
  " ] や ) の対応エラーをハイライトする
  autocmd FileType php let php_parent_error_close=1
  " cakephpのスニペットを有効にする
  autocmd FileType ctp set ft=php.cakephp
augroup END
" }}}

" cake.vimの設定 {{{2
" 自動でルートディレクトリを決める
" 詳細は :help cake
let g:cakephp_enable_auto_mode = 1
" コマンド
" :Cakphp {appディレクトリへのパス}
" カレントのバッファにコントローラを開く
" :Ccontroller {controller-name}
" 上下分割してコントローラを開く
" :Ccontrollersp {controller-name}
" 左右分割してコントローラを開く
" :Ccontrollervsp {controller-name}
" 新しいタブページにコントローラを開く
" :Ccontrollertab {controller-name}
" }}}
" クラスと関数の折り畳みを許可する {{{2
" zo 折り畳みを開く
" zc 折り畳みを閉じる
" zR 全部開く
" zM 全部閉じる
" zj 次の折り畳みに移動
" zk 前の折り畳みに移動
let php_folding=3
set foldmethod=marker
" }}}
" vim-php-cs-fixer の設定 {{{2
let g:php_cs_fixer_level = "psr2"
let g:php_cs_fixer_path = "/usr/local/bin/php-cs-fixer.phar"
nnoremap <silent> :pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent> :pcf :call PhpCsFunc1()<CR>
" 既存のバグがあるので一度Symfony形式に変換したあとでpsr2に変換
function! PhpCsFunc1()
  let g:php_cs_fixer_level = "symfony"
  call PhpCsFixerFixFile()
  let g:php_cs_fixer_level = "psr2"
  call PhpCsFixerFixFile()
endfunction
" }}}
"<=== PHP関連の設定ここまで}}}

