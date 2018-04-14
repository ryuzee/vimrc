" neocomplcacheの設定
let g:neocomplete#enable_at_startup = 1
" 大文字小文字を区別する
let g:neocomplete#enable_smart_cace = 1
"ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplete#max_list = 20
"自動補完を行う入力数を設定。初期値は2
let g:neocomplete#auto_completion_start_length = 2
"手動補完時に補完を行う入力数を制御。値を小さくすると文字の削除時に重くなる
let g:neocomplete#manual_completion_start_length = 5
"バッファや辞書ファイル中で、補完の対象となるキーワードの最小長さ。初期値は4。
let g:neocomplete#min_keyword_length = 4
"1:補完候補検索時に大文字・小文字を無視する
let g:neocomplete#enable_ignore_case = 1
"シンタックス補完を無効に
" let g:neocomplete#plugin_disable = {
" \ 'syntax_complete' : 1,
" \ }
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets/javascript,~/.vim/bundle/neosnippet/autoload/neosnippet/snippets,~/.vim/bundle/neosnippet_chef_recipe_snippet/neosnippets,~/.vim/bundle/PHPSnippetsCreator/dist'
" 補完を有効にしたい場合はset filetype=textなどにするとよい。
let g:neocomplete#text_mode_filetypes = {
\  'tex': 1,
\  'text': 1,
\  'gitcommit': 1,
\  'plaintex': 1,
\}
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
\ 'javascript' : '~/.vim/bundle/vim-node-dict/dict/node.dict,~/.vim/bundle/vim-jquery-dict/dict/jquery.dict',
\ 'ruby' : '~/.vim/bundle/vim-ruby-dict/dict/ruby.dict',
\ 'default' : ''
\ }

" <C-k> にマッピング
" Snippetの候補の選択およびプレースホルダーの移動は以下のコマンドで行う
" ★なお展開前に候補が出るのでC-nで選択することが必要★
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <C-s> <Plug>(neosnippet_start_unite_snippet)
xmap <C-k> <Plug>(neosnippet_expand_target)

" 展開された後はTabでいい感じにプレースホルダを移動していく
imap <expr><C-l>
\ neosnippet#expandable() <Bar><Bar> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-n>"
"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
