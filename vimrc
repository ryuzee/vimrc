set nocompatible
set tags=~/.tags

call pathogen#runtime_append_all_bundles()

set splitbelow
set splitright

:imap <C-z> <C-y>

"=============================================================
" Vundle設定 
"=============================================================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"github repository
Bundle 'Shougo/neocomplcache'
Bundle 'gmarik/vundle'
Bundle 'vim-scripts/SQLUtilities'
Bundle 'vim-scripts/Align'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'nishigori/neocomplcache_phpunit_snippet'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-ref'
Bundle 'kana/vim-smartchr'
Bundle 'tpope/vim-surround'
Bundle 'mattn/zencoding-vim'
Bundle 'git://repo.or.cz/vcscommand'
Bundle 'ndreynolds/vim-cakephp'

"=============================================================
" ファイル種類別にインデントする
"=============================================================
filetype plugin indent on

"=============================================================
" 起動位置
"=============================================================
if has('gui_macvim')
:winpos 2 777
endif

"=============================================================
" 幅など
"=============================================================
if has('gui_running')
  set columns=120
  set lines=55
endif

"=============================================================
" neocomplcacheを有効にする
"=============================================================
let g:neocomplcache_enable_at_startup = 1
" 大文字小文字を区別する
let g:NeoComplCache_SmartCase = 1
" キャメルケース補完を有効にする
let g:NeoComplCache_EnableCamelCaseCompletion = 1
" アンダーバー補完を有効にする
let g:NeoComplCache_EnableUnderbarCompletion = 1
" <C-k> にマッピング
"imap <C-k> <Plug>(neocomplcache_snippets_expand)
"smap <C-k> <Plug>(neocomplcache_snippets_expand)
imap <C-s> <Plug>(neocomplcache_snippets_expand)
smap <C-s> <Plug>(neocomplcache_snippets_expand)

"=============================================================
" フォーカスがあたっていない場合は透明にする
"=============================================================
augroup hack234
  autocmd!
    if has('mac')
        autocmd FocusGained * set transparency=10
        autocmd FocusLost * set transparency=30
    endif
augroup END

"=============================================================
" (),[],{},<>,””,’’,“入力+()の中にカーソル戻す
"=============================================================
"imap {} {}<LEFT>
"imap [] []<LEFT>
"imap () ()<LEFT>
"imap <> <><Left>
"imap "" ""<Left>
"imap '' ''<Left>

"============================================================
" カーソル位置と現在行を示す
"============================================================
:set cursorline
:highlight CursorLine term=reverse cterm=reverse

"=============================================================
" Windowの形状設定 
"=============================================================
if has("gui_running")
  " GUIモードの時はフルスクリーンで起動する
  "set fuoptions=maxvert,maxhorz
  "set fuoptions=maxvert
  "au GUIEnter * set fullscreen
endif

if has('gui_macvim')
  set showtabline=2  " タブを常に表示
  set imdisable  " IMを無効化
  set transparency=0  " 透明度を指定
  set guioptions-=T   " ツールバー非表示
endif

"=============================================================
" ハイライト 
"=============================================================
:syntax on

"=============================================================
" 背景色の設定
"=============================================================
if has('gui_macvim')
":colorscheme Dark2 
:colorscheme evening 
endif

"=============================================================
" コメント行をグレー表示する(コンソール）
"=============================================================
hi Comment ctermfg=7

"=============================================================
" クリップボードの設定
"=============================================================
if has('gui_macvim')
  set clipboard=unnamed
endif

"=============================================================
" フォント設定
"=============================================================
if has('gui_macvim')
  set guifont=Inconsolata:h12
  set guifontwide=Courier:h12
"  set guifont=Courier:h12
"  set guifontwide=Courier:h12
  set antialias
endif



"=============================================================
" ファイル読み込みと保存関連 
"=============================================================
set hidden
set nobackup
set noswapfile

"=============================================================
" タブなどの制御文字を表示
"=============================================================
set list
"　タブを表示する。改行文字は表示しない
set lcs=tab:>.,trail:_,extends:\

"=============================================================
"全角スペースの位置を表示
"=============================================================
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
" au BufRead,BufNew * match JpSpace /　/



"=============================================================
" vim-refの設定
"=============================================================
let g:ref_phpmanual_path = $HOME . '/.vim/others/phpmanual'

"=============================================================
" 言語別
"=============================================================

"#############################################################
" 拡張子.phpの場合の設定
"#############################################################

"=============================================================
" makeコマンドを入力すると、PHPの構文エラーがないかどうかもチェック可能
" expandtab を設定するとタブをスペースに展開する
"=============================================================
:autocmd FileType php set tabstop=4 shiftwidth=4 makeprg=php\ -l\ % errorformat=%m\ in\ %f\ on\ line\ %l 

"=============================================================
" 文字列の中のSQLをハイライトする
"=============================================================
:autocmd FileType php let php_sql_query=1

"=============================================================
" 文字列の中のHTMLをハイライトする
"=============================================================
:autocmd FileType php let php_htmlInStrings=1

"=============================================================
" ショートタグのハイライトを無効にする
"=============================================================
:autocmd FileType php let php_noShortTags=1

"=============================================================
" 辞書から関数を選択できるようにする
" キーワード上でctrl + x ctrl + kを入力
"=============================================================
:autocmd FileType php set dictionary=~/.vim/dictionary/PHP.dict

"=============================================================
" cakephpのスニペットを有効にする
"=============================================================
":autocmd FileType php set ft=php.cakephp
:autocmd FileType ctp set ft=php.cakephp

"=============================================================
" python
"=============================================================
:autocmd FileType py set tabstop=4 shiftwidth=4 expandtab 
:autocmd FileType javascript set tabstop=4 shiftwidth=4 expandtab fileencoding=utf-8

"=============================================================
" クラスと関数の折り畳みを許可する
" zo 折り畳みを開く
" zc 折り畳みを閉じる
" zR 全部開く
" zM 全部閉じる
" zj 次の折り畳みに移動
" zk 前の折り畳みに移動
"=============================================================
let php_folding=1

"#############################################################
" // phpの設定ここまで
"#############################################################

"=============================================================
" タブ設定
"=============================================================
"set expandtab
"set tabstop=4
"set softtabstop=4
"set shiftwidth=4

"=============================================================
"括弧入力時に対応する括弧を表示
"=============================================================
set showmatch
set cindent

"=============================================================
" ルーラー表示
"=============================================================
set ruler

"=============================================================
"コマンドをステータス行に表示
"=============================================================
set showcmd

"=============================================================
"タイトルを表示
"=============================================================
set title

"=============================================================
"常にステータス行を表示
"=============================================================
set laststatus=2

"=============================================================
" 行番号表示
"=============================================================
:set number

"=============================================================
" Status行
"=============================================================
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"=============================================================
" ビープ音いらない 
"=============================================================
set vb t_vb=

"=============================================================
" 起動時のメッセージいらない 
"=============================================================
set shortmess+=I


"=============================================================
" 検索 
"=============================================================
set ignorecase
set smartcase
set wrapscan
set hlsearch

"=============================================================
" 文字コードの自動認識
"=============================================================
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif

"=============================================================
" 日本語を含まない場合は fileencoding に encoding を使うようにする
"=============================================================
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif

"=============================================================
" 改行コードの自動認識
"=============================================================
set fileformats=unix,dos,mac

"=============================================================
" □とか○の文字があってもカーソル位置がずれないようにする
"=============================================================
if exists('&ambiwidth')
  set ambiwidth=double
endif

"=============================================================
" QuickRunによる設定
"=============================================================
" 初期化
let g:quickrun_config = {}

augroup QuickRunPHPUnit
  autocmd!
  autocmd BufWinEnter,BufNewFile *Test.php set filetype=php.phpunit
augroup END

" make outputter for coloring output message.
let phpunit_outputter = quickrun#outputter#buffer#new()
function! phpunit_outputter.init(session)
  " call original process
  call call(quickrun#outputter#buffer#new().init, [a:session], self)
endfunction

function! phpunit_outputter.finish(session)
  " set color 
  highlight default PhpUnitOK         ctermbg=Green ctermfg=White
  highlight default PhpUnitFail       ctermbg=Red   ctermfg=White
  highlight default PhpUnitAssertFail ctermfg=Red
  call matchadd("PhpUnitFail","^FAILURES.*$")
  call matchadd("PhpUnitOK","^OK.*$")
  call matchadd("PhpUnitAssertFail","^Failed.*$")
  call call(quickrun#outputter#buffer#new().finish, [a:session], self)
endfunction

" regist outputter to quickrun
call quickrun#register_outputter("phpunit_outputter", phpunit_outputter)

" PHPUnit
let g:quickrun_config['php.phpunit'] = {
	\ 'command': 'phpunit', 
	\ 'cmdopt': '--stop-on-failure',
	\ 'outputter': 'phpunit_outputter'
	\ }
let g:quickrun_config['php.phpunit_cov'] = {
	\ 'command': 'phpunit', 
	\ 'outputter': 'phpunit_outputter', 
	\ 'cmdopt': '--stop-on-failure --coverage-html /tmp/result'
	\ }
" 面倒なのでrrでquickrun実行
silent! nmap <unique> <C-r> <Plug>(quickrun)
