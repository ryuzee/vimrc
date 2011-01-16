set nocompatible
set tags=~/.tags

"=============================================================
" ハイライト 
"=============================================================
:syntax on

if has('gui_macvim')
:colorscheme evening
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
"set lcs=tab:>.,eol:$,trail:_,extends:¥
set lcs=tab:>.,extends:¥

"=============================================================
"全角スペースの位置を表示
"=============================================================
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /　/

"=============================================================
" フォント設定
"=============================================================
if has('gui_macvim')
	set guifont=Courier:h12
	set guifontwide=Courier:h12
	set antialias
endif

"=============================================================
" ファイル種類別にインデントする
"=============================================================
filetype plugin indent on

"=============================================================
" 言語別
"=============================================================
:autocmd FileType php set tabstop=4 shiftwidth=4 expandtab

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
" 幅など
"=============================================================
set columns=100
set lines=40

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
