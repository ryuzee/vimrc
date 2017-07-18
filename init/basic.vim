" 一般的な設定
set encoding=utf-8
scriptencoding utf-8
set tags=./.tags;,~/.vim/tags
set shortmess+=I               " 起動時のメッセージいらない
let g:bufferline_echo=0        " うっとおしい表示を消す
set hidden
set nobackup                   " バックアップ作らない
set noswapfile                 " swapファイル作らない
set autoread                   " 他で書き換えられたら自動で読み直す
set splitbelow                 " 標準で下分割
set splitright                 " 右分割にする
set showmatch                  " 括弧入力時に対応する括弧を表示
set cindent
set expandtab                  " タブは全部展開する
set ruler                      " ルーラー表示
set showcmd                    " コマンドをステータス行に表示
set title                      " タイトルを表示
set number                     " 行番号表示
set ignorecase                 " 大文字小文字を無視して検索
set smartcase                  " 大文字を入力すると大文字小文字無視を解除
set wrapscan                   " 先頭に戻って検索
set hlsearch                   " 前回の検索結果が残ってればハイライトする
set textwidth=0                " 自動改行させない
set shellslash                 " Windowsでもパス区切りにスラッシュを使える
set lazyredraw                 " Dont redraw screen while Macro proceeding
set backspace=indent,eol,start " バックスペースでなんでも消せるように
set formatoptions+=m           " 整形オプション，マルチバイト系を追加
set formatoptions-=ro          " 挿入モードで改行した時に # を自動挿入しない
set wildmenu                   " コマンド補完を強化
set wildmode=list:full         " リスト表示，最長マッチ
set fileformats=unix,dos,mac   " 改行コードの自動認識
set list                       " タブなどの制御文字を表示
set tabstop=4
set lcs=tab:>.,trail:_,extends:\  " タブを表示する。改行文字は表示しない
set laststatus=2               "常にステータス行を表示
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set modeline
set modelines=5
set cursorline
set complete+=k                " ctrl + n で補完
set noundofile                 " undoファイル作りたくないんだよ
set display+=lastline
set imdisable
syntax on                      " シンタックスハイライトを有効にする

" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

imap <C-z> <C-y>
let mapleader = "\<Space>"     " リーダーを|からスペースに変える
nmap <Esc><Esc> :nohlsearch<CR><Esc>
