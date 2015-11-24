" _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
"
"      _ __ ___  _   _  __   _(_)_ __ ___  _ __ ___
"     | '_ ` _ \| | | | \ \ / / | '_ ` _ \| '__/ __|
"     | | | | | | |_| |  \ V /| | | | | | | | | (__
"     |_| |_| |_|\__, |   \_/ |_|_| |_| |_|_|  \___|
"                |___/
"
" _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
" ryuzee's vimrc

"===> 一般的な設定 {{{
set nocompatible
filetype off
set encoding=utf-8
scriptencoding utf-8
set tags=./.tags;,~/.vim/tags
set vb t_vb=                   " ビープ音いらない
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
" set virtualedit=all            " 文字がなくても選択可能に
set lcs=tab:>.,trail:_,extends:\  " タブを表示する。改行文字は表示しない
set laststatus=2               "常にステータス行を表示
" %< truncate long  line
" %f relative filename
" %m modofication flag
" %r readonly flag
" %h help buffer
" %w preview window flag
" %= separator between leftside and right side
" %l cursor position
" %c column number
if filereadable(expand('~/.vim/bundle/vim-fugitive'))
  set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).'][%{fugitive#statusline()}]['.&ft.']['.&ff.']'}%=%l,%c%V%8P
endif
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set modeline
set modelines=5
set cursorline
set complete+=k                " ctrl + n で補完
set noundofile                 " undoファイル作りたくないんだよ
set display+=lastline
set imdisable
:syntax on                     " シンタックスハイライトを有効にする
:imap <C-z> <C-y>
let mapleader = "\<Space>"     " リーダーを|からスペースに変える
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" クリップボードの設定 {{{
if has('gui')
  set clipboard=unnamed,unnamedplus
endif
"}}}

" autoindent有効時にコード貼り付けでインデントがぐっちゃぐちゃになるのを防ぐ {{{
set pastetoggle=<F10>
nnoremap <F10> :set paste!<CR>:set paste?<CR>
" }}}

" (),[],{},<>,””,’’,“入力+()の中にカーソル戻す {{{
imap {} {}<LEFT>
imap [] []<LEFT>
imap () ()<LEFT>
imap <> <><Left>
imap "" ""<Left>
imap '' ''<Left>
" }}}

"全角スペースの位置を表示 {{{
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=yellow
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif
" }}}

" □とか○の文字があってもカーソル位置がずれないようにする {{{
if exists('&ambiwidth')
  set ambiwidth=double
endif
" }}}

" 文字コードの自動認識 {{{
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

" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" }}}
"<=== 一般的な設定[ここまで] }}}

"===> NeoBundleの設定 {{{
if has('vim_starting')
  set nocompatible
  " neobundle をインストールしていない場合は自動インストール
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    " vim からコマンド呼び出しているだけ neobundle.vim のクローン
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  " runtimepath の追加は必須
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

" 基本 {{{
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
\ 'build' : {
  \ 'windows' : 'make -f make_mingw32.mak',
  \ 'cygwin' : 'make -f make_cygwin.mak',
  \ 'mac' : 'make -f make_mac.mak',
  \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" }}}

" Unite関連 {{{
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-font'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'ujihisa/unite-locate'
NeoBundle 'kmnk/vim-unite-svn'
NeoBundle 'choplin/unite-vim_hacks'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'tsukkee/unite-tag'
"}}}

" ColorScheme {{{
NeoBundle 'thinca/vim-guicolorscheme'
NeoBundle 'vim-scripts/Diablo3.git'
NeoBundle 'vim-scripts/Lucius'
NeoBundle 'vim-scripts/mrkn256.vim'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'tomasr/molokai'
NeoBundle 'inkpot'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'altercation/vim-colors-solarized'
" }}}

" 見栄え {{{
NeoBundle 'nathanaelkane/vim-indent-guides' " インデントをわかりやすく表示する
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'osyo-manga/vim-gift'
NeoBundle 'osyo-manga/vim-automatic'
NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'LeafCage/foldCC'
" }}}

" 移動・ファイル操作 {{{
NeoBundle 'xolox/vim-easytags'
NeoBundle 'taglist.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'thinca/vim-singleton'
" }}}

" ファイル編集 {{{
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'vim-scripts/Align'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'tpope/vim-surround'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'vim-scripts/SQLUtilities'
" }}}

" 検索 {{{
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'haya14busa/incsearch-fuzzy.vim'
NeoBundle 'haya14busa/incsearch-easymotion.vim'
NeoBundle "osyo-manga/vim-anzu"
NeoBundle 't9md/vim-quickhl'
NeoBundle 'osyo-manga/vim-over'
" }}}

" バージョン管理 {{{
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'jaxbot/github-issues.vim'
" }}}

" 外部リソース参照 {{{
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'thinca/vim-openbuf'
NeoBundle 'thinca/vim-ref'
NeoBundle 'mfumi/ref-dicts-en'
NeoBundle 'mojako/ref-sources.vim'
" }}}

" 言語関連 {{{
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mattn/jscomplete-vim'
NeoBundle 'heavenshell/vim-jsdoc'
NeoBundle 'moll/vim-node'
NeoBundle 'myhere/vim-nodejs-complete'
NeoBundle 'guileen/vim-node-dict'
NeoBundle 'ryuzee/vim-jquery-dict'
NeoBundle 'honza/vim-snippets'
NeoBundle 'ryuzee/neosnippet_chef_recipe_snippet'
NeoBundle 'glidenote/serverspec-snippets'
" Javascriptをチェックする場合は、npm install jshint -g を先に実施しておく
NeoBundle 'scrooloose/syntastic'
NeoBundle "markcornick/vim-vagrant"
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'chrisgillis/vim-bootstrap3-snippets'
NeoBundle 'elzr/vim-json'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mustardamus/jqapi'
NeoBundle 'tokuhirom/jsref'

" Ruby関連 {{{
NeoBundle 'ngmy/vim-rubocop'
NeoBundle 'ryuzee/vim-ruby-dict'
NeoBundle 'tpope/vim-rails', { 'autoload' : {
      \ 'filetypes' : ['haml', 'ruby', 'eruby'] }}
" }}}
NeoBundle 'basyura/unite-rails'

" PHP関連 {{{
NeoBundle 'ryuzee/neocomplcache_php_selenium_snippet'
NeoBundle 'nishigori/neocomplcache-phpunit-snippet'
NeoBundle 'oppara/vim-unite-cake'
NeoBundle 'tekkoc/PHPSnippetsCreator'
" PHPのコードを整形する http://docs.komagata.org/4988
NeoBundle 'stephpy/vim-php-cs-fixer'
" phpでタグをいい感じに扱う
NeoBundle 'vim-scripts/tagbar-phpctags', {
  \   'build' : {
  \     'others' : 'chmod +x bin/phpctags',
  \   },
  \ }
" PHPファイルの中にHTMLがある場合のインデントをいい感じに扱う
NeoBundle 'ryuzee/php.vim-html-enhanced'
" PDV - PHP Documentor for VIM - 2
if v:version >= 704
  NeoBundle 'SirVer/ultisnips'
endif
NeoBundle 'tobyS/vmustache'
NeoBundle 'ryuzee/pdv' " Forked ver from tobyS/pdv
" PHPUnit formatter http://www.karakaram.com/vim/phpunit-location-list/
NeoBundle 'karakaram/vim-quickrun-phpunit'
" http://d.hatena.ne.jp/yuhei_kagaya/20111216/1324023977
NeoBundle 'violetyk/cake.vim'
" }}}

" その他分類不能 {{{
NeoBundle 'kannokanno/previm'
NeoBundle 'sudo.vim'
NeoBundle 'thinca/vim-scouter'
NeoBundle "mhinz/vim-startify"
NeoBundle 'blueyed/vim-diminactive'
NeoBundle 'mattn/excitetranslate-vim'
NeoBundle 'xolox/vim-session'
NeoBundle 'xolox/vim-misc'
NeoBundle 'fuenor/im_control.vim'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'itchyny/dictionary.vim'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'mattn/googletranslate-vim'
NeoBundle 'itchyny/calendar.vim'
NeoBundle 'TwitVim'
NeoBundle 'ryuzee/dbext.vim'
NeoBundle 'kakkyz81/evervim'

" eblookを使ってローカル辞書検索 {{{
" <LEADER> y でカーソル位置の文字を検索できる
" <LEADER> CTRL + y で検索ウィンドウを表示できる
NeoBundle 'deton/eblook.vim'
" Download EB library from ftp://ftp.sra.co.jp/pub/misc/eb/eb-4.4.3.tar.bz2
" See http://openlab.jp/edict/eblook/
" Download eblook from http://openlab.jp/edict/eblook/dist/eblook-1.6.1.tar.gz
" 辞書ファイルは以下から入手
" http://www.vector.co.jp/soft/data/writing/se369320.html
" }}}
" }}}

" vimrc に記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
call neobundle#end()
" }}}

"===> 見栄え関連の設定 {{{
if !has('gui_running')
  :colorscheme molokai
  set t_Co=256
endif
function! s:hl_colorscheme_modify_molokai()
  hi! DiffText term=reverse cterm=bold ctermbg=239 gui=bold,italic guibg=#4C4745
  hi! DiffDelete term=bold ctermfg=180 ctermbg=0 gui=bold guifg=#960050 guibg=#1E0010
  hi! DiffAdd term=bold ctermbg=0 guibg=#13354A
  hi! Visual ctermfg=236 ctermbg=119 guifg=#353535 guibg=#95e454
  hi! default link MatchParen Title
endfunction
autocmd BufWinEnter,ColorScheme * call s:hl_colorscheme_modify_molokai()

" 挿入モードかどうかで色を変える {{{
augroup InsertHook
autocmd!
  autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
  autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END
"}}}

" ファイル種類別にインデントする {{{
filetype plugin indent on
"}}}

" vim-indent-guides設定 / インデントをわかりやすく表示する {{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'calendar']
"}}}

" フォーカスがあたっていない場合は透明にする {{{
" 数字が大きいほど透明度が高い
augroup hack234
  autocmd!
    if has('mac')
      autocmd FocusGained * set transparency=0
      autocmd FocusLost * set transparency=20
    endif
augroup END
"}}}

" Windowの形状設定 {{{
if has('gui')
  set showtabline=2  " タブを常に表示
  set imdisable  " IMを無効化
  set guioptions-=T   " ツールバー非表示
endif
if has('gui_macvim')
  set transparency=0  " 透明度を指定
endif
"}}}

" Shift + 矢印でウィンドウサイズを変更 {{{
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
" }}}

" vim-airline / ステータスラインをいい感じにする {{{
let g:Powerline_symbols = 'fancy'
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 0
let g:airline_left_sep = '⮀'
let g:airline_right_sep = '⮂'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⭠ '
let g:airline#exclude_filenames = ['NERD_Tree_1']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '>'
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮀'
let g:airline#extensions#readonly#symbol = '⭤ '
"}}}

" コメント行をグレー表示する(コンソール）{{{
hi Comment ctermfg=7
"}}}

" 折りたたみの設定を変える {{{
" NOTE: 一端微妙なのでやめておく
" set foldtext=foldCCtext()
"}}}

" Syntasticの設定 {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_enable_balloons = 1
" }}}
"<=== 見栄え関連の設定ここまで }}}

"===> QuickRunによる設定 {{{
let g:quickrun_config = {}
let g:quickrun_config['*'] = {'split': ''}

augroup QuickRunPHPUnit
  autocmd!
  autocmd BufWinEnter,BufNewFile *Test.php set filetype=phpunit.php
augroup END

let g:quickrun_config['phpunit'] = {}
let g:quickrun_config['phpunit']['outputter'] = 'phpunit'
let g:quickrun_config['phpunit']['command'] = 'phpunit'
let g:quickrun_config['phpunit']['exec'] = '%c %o %s'
" 面倒なのでrrでquickrun実行
silent! nmap <unique> <C-r> <Plug>(quickrun)
"<=== QuickRunの設定ここまで}}}

"===> unite.vimの設定 {{{
" 入力モードで開始する
let g:unite_enable_start_insert=1
" 縦分割で開く(オフにする)
let g:unite_enable_split_vertically = 0
" Windowの幅
let g:unite_winwidth = 40
" Window
let g:unite_winheight = 10
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -no-quit -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uc :<C-u>Unite colorscheme<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -no-quit -buffer-name=files file<CR>
nnoremap <silent> ,ufl :<C-u>UniteWithBufferDir -vertical -winwidth=30 -no-quit -buffer-name=files file<CR>
nnoremap <silent> ,um :<C-u>Unite -no-quit file_mru<CR>
nnoremap <silent> ,uml :<C-u>Unite -no-quit -vertical -winwidth=30 file_mru<CR>
nnoremap <silent> ,uo :<C-u>Unite outline<CR>
nnoremap <silent> ,uol :<C-u>Unite -vertical -no-quit -winwidth=30 outline<CR>
nnoremap <silent> ,ur :<C-u>Unite -no-quit -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite -no-quit buffer file_mru<CR>
nnoremap <silent> ,uy :<C-u>Unite yankround<CR>
nnoremap <silent> ,ucc :<C-u>Unite cake_controller<CR>
nnoremap <silent> ,ucm :<C-u>Unite cake_model<CR>
nnoremap <silent> ,ucv :<C-u>Unite cake_view<CR>
nnoremap <silent> ,uch :<C-u>Unite cake_helper<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')

" unite.vim上でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " ESCキーを2回押すと終了する
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction
let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <Space>s :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
" reset not it is <C-l> normally
:nnoremap <Space>r <Plug>(unite_restart)
call unite#custom_default_action('file', 'tabopen')
"<=== unite.vimの設定ここまで}}}

" yankroundの設定 {{{
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
" }}}

"===> vim-refの設定 {{{1
" 利用可能なソースは以下の通り
" - clojure  (|ref-clojure.txt|)
" - erlang   (|ref-erlang.txt|)
" - man      (|ref-man.txt|)
" - perldoc  (|ref-perldoc.txt|)
" - phpmanual(|ref-phpmanual.txt|)
" - pydoc    (|ref-pydoc.txt|)
" - refe     (|ref-refe.txt|)
"
" shift + k でキーワード検索可能
let g:ref_alc_cmd='lynx -dump -nonumbers %s'
let g:ref_phpmanual_cmd='lynx -dump -nonumbers -display_charset utf-8 %s'
let g:ref_source_webdict_cmd = 'lynx -dump -nonumbers -display_charset utf-8 %s'

" 以下のコマンドでマニュアルを取得しておく
" wget --trust-server-names http://jp1.php.net/get/php_manual_ja.tar.gz/from/this/mirror
" tar xvfz php_manual_ja.tar.gz -C ~/.vim/others/
" また動作させる環境にlynxが必要なので、Macであれば、brew install lynxとしておく
"
" phpの場合は Ref phpmanual Hogehoge
let g:ref_phpmanual_path = $HOME . '/.vim/others/php-chunked-xhtml'
let g:ref_jquery_doc_path = $HOME . '/.vim/bundle/jqapi'
let g:ref_javascript_doc_path = $HOME . '/.vim/bundle/jsref/htdocs'

" カーソル位置の単語をPHPマニュアルから検索する。カーソルがある状態で:phpで実行 {{{2
nnoremap <silent> :php :<C-u>call ref#jump('normal', 'phpmanual')<CR>
vnoremap <silent> :php :<C-u>call ref#jump('visual', 'phpmanual')<CR>
"}}}
"<=== vim-refの設定ここまで}}}

"===> PHP関連の設定 {{{1
" makeコマンドを入力すると、PHPの構文エラーがないかどうかもチェック可能
" PSR2に従いタブからスペースに展開するように変更
:autocmd FileType php set tabstop=4 shiftwidth=4 autoindent smartindent expandtab makeprg=php\ -l\ % errorformat=%m\ in\ %f\ on\ line\ %l
" 文字列の中のSQLをハイライトする
:autocmd FileType php let php_sql_query=1
" Baselibメソッドのハイライトを行う
:autocmd FileType php let php_baselib=1
" 文字列の中のHTMLをハイライトする
:autocmd FileType php let php_htmlInStrings=1
" ショートタグのハイライトを無効にする
:autocmd FileType php let php_noShortTags=1
" ] や ) の対応エラーをハイライトする
:autocmd FileType php let php_parent_error_close=1
" PHP documenter script bound to ,pdoc {{{
if v:version >= 704
  let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
  autocmd Filetype php nnoremap <buffer> ,pdoc :call pdv#DocumentWithSnip()<CR>
endif
" }}}
" cakephpのスニペットを有効にする
:autocmd FileType ctp set ft=php.cakephp
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
"}}}
" クラスと関数の折り畳みを許可する {{{2
" zo 折り畳みを開く
" zc 折り畳みを閉じる
" zR 全部開く
" zM 全部閉じる
" zj 次の折り畳みに移動
" zk 前の折り畳みに移動
let php_folding=3
set foldmethod=marker
"}}}
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
"}}}
"<=== PHP関連の設定ここまで}}}

"===> python関連の設定 {{{1
:autocmd FileType py set tabstop=4 shiftwidth=4 expandtab
"<=== python関連の設定ここまで}}}

"===> Ruby関連の設定 {{{1
:autocmd FileType ruby set tabstop=2 shiftwidth=2 expandtab softtabstop=2 autoindent smartindent fileencoding=utf-8
:autocmd FileType eruby set tabstop=2 shiftwidth=2 expandtab softtabstop=2 autoindent smartindent fileencoding=utf-8
autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec    set filetype=ruby
autocmd BufNewFile,BufRead *.builder,*.rxml,*.rjs  set filetype=ruby
autocmd BufNewFile,BufRead [rR]akefile,*.rake      set filetype=ruby
autocmd BufNewFile,BufRead [rR]antfile,*.rant      set filetype=ruby
autocmd BufNewFile,BufRead .irbrc,irbrc            set filetype=ruby
autocmd BufNewFile,BufRead .pryrc                  set filetype=ruby
autocmd BufNewFile,BufRead *.ru                    set filetype=ruby
autocmd BufNewFile,BufRead Capfile                 set filetype=ruby
autocmd BufNewFile,BufRead Gemfile                 set filetype=ruby
autocmd BufNewFile,BufRead Guardfile,.Guardfile    set filetype=ruby
autocmd BufNewFile,BufRead Cheffile                set filetype=ruby
autocmd BufNewFile,BufRead Berksfile               set filetype=ruby
autocmd BufNewFile,BufRead [vV]agrantfile          set filetype=ruby
autocmd BufNewFile,BufRead .autotest               set filetype=ruby
autocmd BufNewFile,BufRead [tT]horfile,*.thor      set filetype=ruby
autocmd BufNewFile,BufRead *.rabl                  set filetype=ruby
autocmd BufNewFile,BufRead *.jbuilder              set filetype=ruby
autocmd BufNewFile,BufRead Puppetfile              set filetype=ruby
autocmd BufNewFile,BufRead [Bb]uildfile            set filetype=ruby
autocmd BufNewFile,BufRead *.erb,*.rhtml           set filetype=eruby

" chef_dict {{{2
" 辞書ファイル追加
" git clone https://github.com/OpsRockin/opscode_chef.vim_dict.git ~/.vim/dictionary/opscode_chef.dict
if has("win32") || has("win64")
  autocmd FileType ruby set dictionary+=~/vimfiles/dictionary/opscode_chef.vim_dict/*.dict
else
  autocmd FileType ruby set dictionary+=~/.vim/dictionary/opscode_chef.vim_dict/*.dict
end
"}}}
"<=== Ruby関連の設定ここまで}}}

"===> JavaScript関連の設定 {{{1
:let g:jscomplete_use = ['dom', 'moz']
:autocmd FileType javascript set tabstop=4 shiftwidth=4 expandtab fileencoding=utf-8
" Nodejs補完
:setl omnifunc=jscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'
let g:node_usejscomplete = 1
autocmd BufNewFile,BufRead *.js set filetype=javascript
"<=== JavaScript関連の設定ここまで }}}

"===> Markdown関連の設定 {{{
autocmd BufNewFile,BufRead *.md,*.rdoc set fileencoding=utf-8
autocmd BufRead,BufNewFile *.md set filetype=markdown
"<=== Markdown関連の設定ここまで}}}

"===> CSVファイル関連の設定 {{{
augroup filetypedetect
  au! BufRead,BufNewFile *.csv,*.tsv set filetype=csv
augroup END
"<=== CSVファイル関連の設定ここまで }}}

"===> Reviewファイル関連の設定 {{{
augroup Review
  autocmd!
  autocmd BufWinEnter,BufNewFile *.re set filetype=review
augroup END
"<=== Reviewファイル関連の設定ここまで }}}

"===> 検索系の設定 {{{
" incsearch.vim / インクリメンタル検索の機能改善 {{{
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
map zz/ <Plug>(incsearch-easymotion-/)
map zz? <Plug>(incsearch-easymotion-?)
map zzg/ <Plug>(incsearch-easymotion-stay)

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction
" <Space> + / でいい感じに曖昧に検索してeasy-motionで移動できるようになる!
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
"}}}

" vim-anzu / 検索でヒットした件数を表示する {{{
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-n-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
"}}}

" quickhlの設定 / 文字列をいい感じに簡単にハイライトする {{{
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
nmap <Space>j <Plug>(quickhl-cword-toggle)
nmap <Space>] <Plug>(quickhl-tag-toggle)
map H <Plug>(operator-quickhl-manual-this-motion)
let g:quickhl_manual_enable_at_startup = 1
let g:quickhl_manual_keywords = [
        \ "TODO",
        \ "FIXME",
        \ ]
"}}}
" over.vim {{{
" over.vimの起動
nnoremap <silent> ,m :OverCommandLine<CR>
" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>
"}}}
"<=== 検索系の設定ここまで}}}

"===> ファイル整形系の設定 {{{
" vim-trailing-whitespaceの設定 {{{
" :FixWhitespaceとすればまとめて文末削除できる
let g:extra_whitespace_ignored_filetypes = ['unite', 'calendar']
" }}}

" vim-easy-align / Alignでテキスト整形 {{{
" VisualModeで選択してEnterを押下し、揃えたい文字を入れる
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"}}}

" Nerd_Commenterでコメントアウトを簡単にする {{{
let g:NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1
nmap //// <Plug>NERDCommenterToggle
vmap //// <Plug>NERDCommenterToggle
nmap ///9 <Plug>NERDCommenterToEOL  " カーソル位置以降
vmap ///s <Plug>NERDCommenterSexy
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle
"}}}
"<=== ファイル整形系の設定ここまで}}}

"===> 移動・ファイル選択の設定{{{
" 画面スクロール {{{
nnoremap <Space><Space>   <PageDown>
nnoremap ;;   <PageUp>
" }}}

" タブ移動の設定 {{{
" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Shift + Tab でタブ移動、Tab + Tab で左移動する
nnoremap <S-Tab> gt
nnoremap <Tab><Tab> gT
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" tc 新しいタブを一番右に作る
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tx タブを閉じる
map <silent> [Tag]x :tabclose<CR>
" tn 次のタブ
map <silent> [Tag]n :tabnext<CR>
" tp 前のタブ
map <silent> [Tag]p :tabprevious<CR>
" }}}


" このコマンドを使うと、同一ディレクトリ内のファイルを簡単に
" リストアップして編集できる
" http://mattn.kaoriya.net/software/vim/20111228013428.htm
let g:ctrlp_map = '<c-x>'
"}}}

" easymotion / カーソル移動を楽にする {{{
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
hi clear EasyMotionTarget
hi clear EasyMotionShade
au BufEnter * hi EasyMotionTarget ctermfg=25 guifg=#ff0000
au BufEnter * hi EasyMotionShade ctermfg=25 guifg=#aaaaaa"
"}}}

" nerdtree / ファイルの一覧を表示 {{{
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
"}}}

" tagbar / タグをいい感じに扱う {{{
let g:tagbar_width = 40
let g:tagbar_autofocus = 1
" Map for toggle
noremap <silent> :tt :TagbarToggle<CR>
"}}}

" vim-expand-region / 選択しやすくする vの連打で範囲が変えられる {{{
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"}}}
" 複数行カーソルのキーマップ {{{
let g:multi_cursor_start_key='<F6>' " Macの場合はFn + F6で起動
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" }}}
"<=== 移動・ファイル選択の設定ここまで}}}

"===> neocomplcacheの設定 {{{
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
let g:neocomplcache_auto_completion_start_length = 2
"手動補完時に補完を行う入力数を制御。値を小さくすると文字の削除時に重くなる
let g:neocomplcache_manual_completion_start_length = 5
"バッファや辞書ファイル中で、補完の対象となるキーワードの最小長さ。初期値は4。
let g:neocomplcache_min_keyword_length = 4
"シンタックスファイル中で、補完の対象となるキーワードの最小長さ。初期値は4。
let g:neocomplcache_min_syntax_length = 4
"1:補完候補検索時に大文字・小文字を無視する
let g:neocomplcache_enable_ignore_case = 1
"入力に大文字が入力されている場合、大文字小文字の区別をする
let g:neocomplcache_enable_smart_case = 1
"シンタックス補完を無効に
let g:neocomplcache_plugin_disable = {
\ 'syntax_complete' : 1,
\ }
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets/javascript,~/.vim/bundle/neosnippet/autoload/neosnippet/snippets,~/.vim/bundle/neosnippet_chef_recipe_snippet/neosnippets,~/.vim/bundle/PHPSnippetsCreator/dist'
" 補完を有効にしたい場合はset filetype=textなどにするとよい。
let g:neocomplcache_text_mode_filetypes = {
\  'tex': 1,
\  'text': 1,
\  'gitcommit': 1,
\  'plaintex': 1,
\}
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
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
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"<=== neocomplcacheの設定ここまで}}}

" open-browser の設定 / URLの上でと押すとブラウザを開く {{{
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap br <Plug>(openbrowser-smart-search)
vmap br <Plug>(openbrowser-smart-search)
"}}}

" VimShell {{{
let g:vimshell_prompt = '$ '
"}}}

" vim-sessionの設定 / 再起動を簡単にできるようにする {{{
:let g:session_autosave = 'no'
nnoremap <silent> :Restart :RestartVim<CR>
"}}}

" Japanese input {{{
" 「日本語入力固定モード」切替キー
inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
" PythonによるIBus制御指定
let IM_CtrlIBusPython = 1
" バッファ毎に日本語入力固定モードの状態を制御。
let g:IM_CtrlBufLocalMode = 1
"}}}

"===> 英文関係の設定 {{{
" Excitetranslate {{{
" trと入れれば翻訳できるように設定
nnoremap <silent> tr :<C-u>ExciteTranslate<CR>
vnoremap <silent> tr :<C-u>ExciteTranslate<CR>
autocmd BufEnter ==Translate==\ Excite nnoremap <buffer> <silent> q :<C-u>close<CR>
"}}}

" ref-dicts-en / 辞書を引けるようにする(vim-refが必要) {{{
let g:ref_source_webdict_sites = {
\   'wiki': {
\     'url': 'http://ja.wikipedia.org/wiki/%s',
\   },
\   'en' : {
\     'url' : 'http://ejje.weblio.jp/content/%s'
\   }
\ }
function! g:ref_source_webdict_sites.en.filter(output)
      return join(split(a:output, "\n")[75 :], "\n")
endfunction

function! g:ref_source_webdict_sites.wiki.filter(output)
  return join(split(a:output, "\n")[17 :], "\n")
endfunction

" デフォルトサイト
let g:ref_source_webdict_sites.default = 'en'
nnoremap <silent> en :<C-u>call ref#jump('normal', 'webdict')<CR>
vnoremap <silent> en :<C-u>call ref#jump('visual', 'webdict')<CR>
" }}}

" eblookの設定 {{{
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
"}}}
"<=== 英文関連の設定ここまで}}}

" memolist / 簡単にメモ取りたい {{{
let g:memolist_path = "~/Dropbox/memo"
nnoremap mn  :MemoNew<CR>
nnoremap ml  :MemoList<CR>
nnoremap mg  :MemoGrep<CR>
" }}}

" vim-automatic / ウィンドウをごにょごにょ楽に操作する {{{
nnoremap <silent> <plug>(quit) :<c -u>q<cr>
" 新しいウィンドウは <ESC><ESC> で閉じれるようにする
function! s:my_temporary_window_init(config, context)
  silent! nunmap <ESC><ESC>
  nmap <buffer> <C-[> :<C-u>q<CR>
  nmap <buffer> <ESC> :<C-u>q<CR>
endfunction

if has('gui')
let g:automatic_default_match_config = {
      \   'is_open_other_window' : 1,
      \ }
let g:automatic_default_set_config = {
      \   'height' : '20%',
      \   'move' : 'bottom',
      \   'apply' : function('s:my_temporary_window_init')
      \ }
let g:automatic_config = [
      \   { 'match' : { 'buftype' : 'help' } },
      \   { 'match' : { 'filetype' : 'eblook' } },
      \   { 'match' : { 'filetype' : 'gitcommit' } },
      \   { 'match' : { 'bufname' : 'gissues/*' } },
      \   { 'match' : { 'bufname' : '^.vimshell' } },
      \   { 'match' : {
      \        'bufname' : '^.unite'
      \      },
      \     'set' : {
      \       'move' : 'top',
      \       'width' : 8
      \     }
      \   },
      \   {
      \     'match' : {
      \       'filetype' : '^ref-.+',
      \       'autocmds' : [ 'FileType' ]
      \     },
      \     'set' : {
      \       'move' : 'right',
      \       'height' : '100%',
      \       'width' : 60
      \     }
      \   },
      \   {
      \     'match' : {
      \       'bufname' : 'Tagbar',
      \       'autocmds' : [ 'FileType' ]
      \     },
      \     'set' : {
      \       'move' : 'right',
      \       'height' : '100%',
      \       'width' : 60
      \     }
      \   },
      \   {
      \     'match' : {
      \       'bufname' : '\[quickrun output\]',
      \     },
      \     'set' : {
      \       'height' : 8,
      \     }
      \   },
      \   {
      \     'match' : {
      \       'autocmds' : [ 'CmdwinEnter' ]
      \     },
      \     'set' : {
      \       'is_close_focus_out' : 1,
      \       'unsettings' : [ 'move', 'resize' ]
      \     },
      \   }
      \ ]
endif
" }}}

" TwitVimの設定 {{{
let twitvim_force_ssl = 1
let twitvim_count = 80
" }}}

" dbextの設定 {{{
" 詳細は、http://qiita.com/0829/items/ce92a752bf832a06bcf2
let g:dbext_map_prefix = '&s'
" }}}

"最後の処理 {{{
" ~/.vimrc.localが存在する場合のみ設定を読み込む
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif

" プロジェクトローカル
let s:local_vimrc = expand('.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif
" }}}
