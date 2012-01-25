set nocompatible
set tags=~/.tags

"=============================================================
" bundle/vim-pathogen/autoload以下にあるpathogen.vimの
" シンボリックリンクを~/.vim/autoloadに配置しておくこと
"=============================================================
call pathogen#runtime_append_all_bundles()

if 0 
set splitbelow
set splitright
endif

:imap <C-z> <C-y>

"=============================================================
" Vundle設定 
"=============================================================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" vimprocはインストールしたあと、cd bundle/vimproc/にてmake -f
" make_xxx.makしてビルドすること

"github repository
Bundle 'thinca/vim-quickrun'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
Bundle 'gmarik/vundle'
Bundle 'vim-scripts/SQLUtilities'
Bundle 'vim-scripts/Align'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'nishigori/neocomplcache_phpunit_snippet'
Bundle 'thinca/vim-ref'
Bundle 'kana/vim-smartchr'
" 文字列の囲み関係の処理
" iw (単語)
" aw (単語+次の文字までの空白)
" it (タグの内部 <strong>hoge</strong> の hoge)
" at (直近の外側にあるタグ含む文字列 <p><strong>hoge</strong></p> の場合、
"    hoge や、strong 上でコマンドを入力すれば、<strong>hoge</strong> が対象になる)
" i( (括弧内を以下略。 ib でも可。)
" a( (括弧含め以下略。 ab でも可。 b は多分ブラケットの b です)
" 例)
" ysiw" --> "で文字列を囲む
" ys$"　--> カーソルから行末までを"で囲む
" cs"'　--> "で囲まれているものを'に変える
Bundle 'tpope/vim-surround'
Bundle 'mattn/zencoding-vim'
Bundle 'git://repo.or.cz/vcscommand'
Bundle 'ndreynolds/vim-cakephp'
Bundle 'ryuzee/neocomplcache_php_selenium_snippet'
Bundle 'vim-scripts/Diablo3.git'
Bundle 'scrooloose/syntastic.git'


" vim-script
" :Tlistでタグを表示する
Bundle 'taglist.vim'
" SourceExplorer
" :TrinityToggleAllで4ペインでソースコードを閲覧可能にする
Bundle 'trinity.vim'
Bundle 'Source-Explorer-srcexpl.vim'
Bundle 'unite.vim'
Bundle 'sudo.vim'

"=============================================================
" QuickRunによる設定
"=============================================================
" 初期化
let g:quickrun_config = {}
let g:quickrun_config['*'] = {'split': ''}

augroup QuickRunPHPUnit
  autocmd!
  autocmd BufWinEnter,BufNewFile *Test.php set filetype=php.phpunit
augroup END

let phpunit_outputter = quickrun#outputter#buffer#new()
let phpunit_outputter.config.targets = ["buffer"]

" make outputter for coloring output message.
function! phpunit_outputter.init(session)
  " call original process
  call call(quickrun#outputter#buffer#new().init, [a:session], self)
endfunction

function! phpunit_outputter.finish(session)
  " set color 
  highlight default PhpUnitOK         ctermbg=Green ctermfg=White
  highlight default PhpUnitFail       ctermbg=Red   ctermfg=White
  highlight default PhpUnitAssertFail ctermfg=Red
  "highlight default dollar ctermfg=Red
  call matchadd("PhpUnitFail","^FAILURES.*$")
  call matchadd("PhpUnitOK","^OK.*$")
  call matchadd("PhpUnitAssertFail","^Failed.*$")
  "call matchadd("dollar","assert.*$")
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

""" unite.vim
" 入力モードで開始する
" let g:unite_enable_start_insert=1
let g:unite_enable_split_vertically = 1 "縦分割で開く
let g:unite_winwidth = 40
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -no-quit -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -no-quit -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite -no-quit file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite -no-quit buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -no-quit -buffer-name=files buffer file_mru bookmark file<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

"=============================================================
" neocomplcacheを有効にする
"=============================================================
let g:neocomplcache_enable_at_startup = 1
" 大文字小文字を区別する
let g:neocomplcache_SmartCase = 1
" キャメルケース補完を有効にする
let g:neocomplcache_enable_camel_case_completion = 1
" アンダーバー補完を有効にする
let g:NeoComplCache_EnableUnderbarCompletion = 1
"ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplcache_max_list = 20
"自動補完を行う入力数を設定。初期値は2
let g:neocomplcache_auto_completion_start_length = 4 
"手動補完時に補完を行う入力数を制御。値を小さくすると文字の削除時に重くなる
let g:neocomplcache_manual_completion_start_length = 3
"バッファや辞書ファイル中で、補完の対象となるキーワードの最小長さ。初期値は4。
let g:neocomplcache_min_keyword_length = 4
"シンタックスファイル中で、補完の対象となるキーワードの最小長さ。初期値は4。
let g:neocomplcache_min_syntax_length = 4
"1:補完候補検索時に大文字・小文字を無視する
let g:neocomplcache_enable_ignore_case = 1
"入力に大文字が入力されている場合、大文字小文字の区別をする
let g:neocomplcache_enable_smart_case = 1

" <C-k> にマッピング
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
"imap <C-s> <Plug>(neocomplcache_snippets_expand)
"smap <C-s> <Plug>(neocomplcache_snippets_expand)

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
  :colorscheme Diablo3
elseif has('gui')
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
"nnoremap <silent> <Space>K :<C-u>call ref#jump('normal', 'alc')<CR>
"vnoremap <silent> <Space>K :<C-u>call ref#jump('visual', 'alc')<CR>

" カーソル位置の単語をalcで検索する。カーソルがある状態で:alcで実行
nnoremap <silent> :alc :<C-u>call ref#jump('normal', 'alc')<CR>
vnoremap <silent> :alc :<C-u>call ref#jump('visual', 'alc')<CR>

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
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ft.']['.&ff.']'}%=%l,%c%V%8P

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

