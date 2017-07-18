" shift + k でキーワード検索可能
let g:ref_alc_cmd='lynx -dump -nonumbers %s'
let g:ref_phpmanual_cmd='lynx -dump -nonumbers -display_charset utf-8 %s'
let g:ref_source_webdict_cmd = 'lynx -dump -nonumbers -display_charset utf-8 %s'

" phpの場合関連の設定
let g:ref_phpmanual_path = $HOME . '/.vim/others/php-chunked-xhtml'
let g:ref_jquery_doc_path = $HOME . '/.vim/bundle/jqapi'
let g:ref_javascript_doc_path = $HOME . '/.vim/bundle/jsref/htdocs'

" カーソル位置の単語をPHPマニュアルから検索する。カーソルがある状態で:phpで実行
nnoremap <silent> :php :<C-u>call ref#jump('normal', 'phpmanual')<CR>
vnoremap <silent> :php :<C-u>call ref#jump('visual', 'phpmanual')<CR>
