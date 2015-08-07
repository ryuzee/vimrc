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

" 一般的な設定 {{{
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
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).'][%{fugitive#statusline()}]['.&ft.']['.&ff.']'}%=%l,%c%V%8P
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set modeline
set modelines=5
set complete+=k                " ctrl + n で補完
set noundofile                 " undoファイル作りたくないんだよ
set display+=lastline
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

" Shift + 矢印でウィンドウサイズを変更 {{{
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
" }}}

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
nnoremap ;; gT
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

" }}}

" NeoBundle settings {{{
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

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'thinca/vim-quickrun'
" PHPUnit formatter {{{
" http://www.karakaram.com/vim/phpunit-location-list/
NeoBundle 'karakaram/vim-quickrun-phpunit'
" }}}
if v:version >= 703
  " http://d.hatena.ne.jp/yuhei_kagaya/20111216/1324023977
  NeoBundle 'violetyk/cake.vim'
  " インデントをわかりやすく表示する {{{
  NeoBundle 'nathanaelkane/vim-indent-guides'
  " }}}
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'ujihisa/unite-colorscheme'
  NeoBundle 'ujihisa/unite-font'
  NeoBundle 'Shougo/unite-outline'
  NeoBundle 'ujihisa/unite-locate'
  NeoBundle 'kmnk/vim-unite-svn'
  NeoBundle 'choplin/unite-vim_hacks'
  NeoBundle 'tsukkee/unite-help'
  NeoBundle 'tsukkee/unite-tag'
  NeoBundle 'oppara/vim-unite-cake'
  NeoBundle 'Shougo/neocomplcache'
  NeoBundle 'ryuzee/neocomplcache_php_selenium_snippet'
  NeoBundle 'Shougo/neosnippet'
  NeoBundle 'Shougo/neosnippet-snippets'
  NeoBundle 'ryuzee/neosnippet_chef_recipe_snippet'
  NeoBundle 'glidenote/serverspec-snippets'
  " PHPの標準関数用スニペット {{{
  NeoBundle 'tekkoc/PHPSnippetsCreator'
  " }}}
  NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
    \ },
  \ }
  NeoBundle 'Shougo/vimshell'
endif

" マニュアルやWebを参照できるようにする {{{
NeoBundle 'thinca/vim-ref'
" }}}

NeoBundle 'git://repo.or.cz/vcscommand'

" ブラウザを開く {{{
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'thinca/vim-openbuf'
" }}}

NeoBundle "markcornick/vim-vagrant"

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

" ステータスラインをCoooolにする {{{
NeoBundle 'bling/vim-airline'
" }}}

" バッファをステータスラインに表示 {{{
NeoBundle 'bling/vim-bufferline'
" }}}

NeoBundle 'tpope/vim-endwise'
NeoBundle 'tomtom/tcomment_vim'

" PHPのコードを整形する {{{
" http://docs.komagata.org/4988
NeoBundle 'stephpy/vim-php-cs-fixer'
" }}}

" PDV - PHP Documentor for VIM - 2 {{{
if v:version >= 704
  NeoBundle 'SirVer/ultisnips'
  NeoBundle 'tobyS/vmustache'
  NeoBundle 'ryuzee/pdv' " Forked ver from tobyS/pdv
endif
" }}}

" Rubocopを使ってソースコードのフォーマットチェック {{{
NeoBundle 'ngmy/vim-rubocop'
"}}}

NeoBundle 'godlygeek/tabular'
NeoBundle 'rcmdnk/vim-markdown'

" マークダウンをブラウザを使ってプレビュー表示する {{{
NeoBundle 'kannokanno/previm'
" }}}

" 同一ディレクトリ内のファイルを簡単にリストアップして編集 {{{
" http://mattn.kaoriya.net/software/vim/20111228013428.htm
NeoBundle 'kien/ctrlp.vim'
" }}}

" Alignでテキスト整形 {{{
" http://nanasi.jp/articles/vim/align/align_vim_ctrl.html
NeoBundle 'vim-scripts/Align'
" easy-alignに置き換え？
" http://alpaca.tc/blog/vim/plugins-best-of-vim-1.html
NeoBundle 'junegunn/vim-easy-align'
" }}}

" SQLを整形 {{{
NeoBundle 'vim-scripts/SQLUtilities'
"}}}

" sudoつけて特権で編集可能にする {{{
" http://nanasi.jp/articles/vim/sudo_vim.html
NeoBundle 'sudo.vim'
"}}}

" フォントの大小切り替え {{{
" - で縮小、+で拡大、:Fontzoom size指定
NeoBundle 'thinca/vim-fontzoom'
"}}}

" コメントアウトを楽にする {{{
NeoBundle 'scrooloose/nerdcommenter'
" }}}

" キーボードで簡単に移動候補を出して操作 {{{
NeoBundle 'easymotion/vim-easymotion'
" }}}

" Yankの履歴をいい感じに取り出す {{{
NeoBundle 'LeafCage/yankround.vim'
" }}}

" メソッドや変数宣言の一覧を表示 {{{
" vim-script
" タグを作りたいところで、ctags -R したあとに:TlistすればOK
NeoBundle 'taglist.vim'
"}}}

" 文字列をいい感じに囲ったり、囲んでるものを外す {{{
" See http://vimblog.hatenablog.com/entry/vim_plugin_surround_vim
" 例) 文字列上でdtsとかやるとタグを全部外せる
NeoBundle 'tpope/vim-surround'
"}}}

" zencodingを使って楽にhtmlを書く {{{
" https://github.com/mattn/emmet-vim/blob/master/doc/emmet.txt
" 例) table>tr*3>td*2<Ctrl+y>, みたいにすると展開される
NeoBundle 'mattn/emmet-vim'
"}}}

" vimの戦闘力を明らかにする {{{
" :Scouterコマンド
NeoBundle 'thinca/vim-scouter'
"}}}

" 直近開いたファイルとかを起動時に開く {{{
NeoBundle "mhinz/vim-startify"
"}}}

" さまざまなファイルのフォーマットチェック系 {{{
" :SyntasticCheck で実行
NeoBundle 'scrooloose/syntastic'
"}}}

" ログを色付け {{{
NeoBundle 'vim-scripts/AnsiEsc.vim'
" }}}

" Dim inactive window / 日本語入力の設定 {{{
NeoBundle 'blueyed/vim-diminactive'
" }}}

" :ExciteTranslateとやれば翻訳される {{{
NeoBundle 'mattn/excitetranslate-vim'
" }}}

" 再起動を簡単にできるようにする {{{
" :Restart あたりでOK
NeoBundle 'xolox/vim-session'
" }}}

" ファイルリストをツリー表示する {{{
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'jistr/vim-nerdtree-tabs'
" }}}

" BootstrapのHTMLを簡単に書けるようにするスニペット {{{
NeoBundle 'chrisgillis/vim-bootstrap3-snippets'
"}}}

" JSONファイルをハイライトしていい感じに表示してくれる {{{
NeoBundle 'elzr/vim-json'
"}}}

NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-easytags'

" :TagbarToggle コマンドでタグを別窓で表示する {{{
NeoBundle 'majutsushi/tagbar'
" }}}

" phpでタグをいい感じに扱う {{{
NeoBundle 'vim-scripts/tagbar-phpctags', {
  \   'build' : {
  \     'others' : 'chmod +x bin/phpctags',
  \   },
  \ }
" }}}

" 文末の空白を削除する {{{
" :FixWhitespaceとすればまとめて文末削除できる
NeoBundle 'bronson/vim-trailing-whitespace'
" }}}

NeoBundle 'fuenor/im_control.vim'

NeoBundle 'ujihisa/neco-look'

" 英語のオンライン辞書などを引けるようにする {{{
NeoBundle 'mfumi/ref-dicts-en'
" }}}

" Macの辞書を引く {{{
" http://itchyny.hatenablog.com/entry/20130916/1379305665
" :Dictionaryで呼び出し
NeoBundle 'itchyny/dictionary.vim'
" }}}

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

" Google Suggestも使う {{{
NeoBundle 'mattn/googletranslate-vim'
" と思ったけどインターネット接続必須になり重いので一端取りやめる。環境次第
" NeoBundle 'mopp/googlesuggest-source.vim'
" NeoBundle 'mattn/googlesuggest-complete-vim'
" NeoBundle 'sousu/neco-googlesuggest'
" }}}

" 簡単にメモを取る {{{
NeoBundle 'glidenote/memolist.vim'
" }}}

" vの連打で範囲が変えられるようにする {{{
NeoBundle 'terryma/vim-expand-region'
" }}}

" Gitを扱う {{{

"：Gstatus
"    新しい窓を作ってgit statusを表示
"：Gwrite
"    現在開いているソースをgit add
"：Gread
"    現在開いているソースの直前のコミット時のソースを表示
"：Gmove destination/path
"    現在開いているソースをgit mvする
"：Gremove
"    現在開いているソースをgit rmする
"：Gcommit
"    git commit
"：Gblame
"    現在のソースをgit blame。vimが色づけしてくれる
"：Gdiff
"    現在のソースの変更点をvimdiffで表示
NeoBundle 'tpope/vim-fugitive'
" }}}

" インクリメンタル検索の機能改善 {{{
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'haya14busa/incsearch-fuzzy.vim'
NeoBundle 'haya14busa/incsearch-easymotion.vim'
" }}}

" 検索にヒットした件数をステータスラインに表示する {{{
NeoBundle "osyo-manga/vim-anzu"
" }}}

" ウィンドウをごにょごにょ楽に操作する {{{
NeoBundle 'osyo-manga/vim-gift'
NeoBundle 'osyo-manga/vim-automatic'
" }}}

" カレンダー {{{
NeoBundle 'itchyny/calendar.vim'
" }}}

" CSVファイルをいい感じに扱う {{{
NeoBundle 'chrisbra/csv.vim'
" }}}

" 複数行カーソル {{{
" VisualModeで選択して、<CTRL>+n をクリックし編集するとまとめていける
NeoBundle 'terryma/vim-multiple-cursors'
" }}}

" VimでTwitter {{{
NeoBundle 'TwitVim'
" }}}

" 文字列をいい感じに簡単にハイライトする {{{
NeoBundle 't9md/vim-quickhl'
" }}}

" vimrc に記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
call neobundle#end()
" }}}

" Look and Feel {{{
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

"}}}

" vim-indent-guides設定 / インデントをわかりやすく表示する {{{
if v:version >= 703
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_auto_colors = 1
  let g:indent_guides_color_change_percent = 30
  let g:indent_guides_guide_size = 1
  let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'calendar']
endif
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

" Windowの形状設定 "{{{
if has('gui')
  set showtabline=2  " タブを常に表示
  set imdisable  " IMを無効化
  set guioptions-=T   " ツールバー非表示
endif
if has('gui_macvim')
  set transparency=0  " 透明度を指定
endif
"}}}

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
" set guifont=RictyDiminished-Regular-Powerline.ttf:h14

" カーソル位置と現在行を示す {{{
:set cursorline
:hi CursorLine term=underline cterm=underline
"}}}

" コメント行をグレー表示する(コンソール）{{{
hi Comment ctermfg=7
"}}}

"// Look and Feel }}}

" QuickRunによる設定 {{{
let g:quickrun_config = {}
let g:quickrun_config['*'] = {'split': ''}

augroup QuickRunPHPUnit
  autocmd!
  autocmd BufWinEnter,BufNewFile *Test.php set filetype=phpunit
augroup END

let g:quickrun_config['phpunit'] = {}
let g:quickrun_config['phpunit']['outputter'] = 'phpunit'
let g:quickrun_config['phpunit']['command'] = 'phpunit'
let g:quickrun_config['phpunit']['exec'] = '%c %o %s'
" 面倒なのでrrでquickrun実行
silent! nmap <unique> <C-r> <Plug>(quickrun)
"}}}

" ファイル種類別にインデントする {{{
filetype plugin indent on
"}}}

" unite.vim {{{
if v:version >= 703
  " 入力モードで開始する
  let g:unite_enable_start_insert=1
  " 縦分割で開く(オフにする)
  let g:unite_enable_split_vertically = 0
  " Windowの幅
  let g:unite_winwidth = 40
  " Window
  let g:unite_winheight = 10
  " 全部乗せ
  nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -no-quit -buffer-name=files buffer file_mru bookmark file<CR>
  " バッファ一覧
  nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
  " colorscheme
  nnoremap <silent> ,uc :<C-u>Unite colorscheme<CR>
  " ファイル一覧
  nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -no-quit -buffer-name=files file<CR>
  nnoremap <silent> ,ufl :<C-u>UniteWithBufferDir -vertical -winwidth=30 -no-quit -buffer-name=files file<CR>
  " 最近使用したファイル一覧
  nnoremap <silent> ,um :<C-u>Unite -no-quit file_mru<CR>
  nnoremap <silent> ,uml :<C-u>Unite -no-quit -vertical -winwidth=30 file_mru<CR>
  " outline
  nnoremap <silent> ,uo :<C-u>Unite outline<CR>
  nnoremap <silent> ,uol :<C-u>Unite -vertical -no-quit -winwidth=30 outline<CR>
  " レジスタ一覧
  nnoremap <silent> ,ur :<C-u>Unite -no-quit -buffer-name=register register<CR>
  " 常用セット
  nnoremap <silent> ,uu :<C-u>Unite -no-quit buffer file_mru<CR>
  " Yankround
  nnoremap <silent> ,uy :<C-u>Unite yankround<CR>

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
endif
"}}}

" neocomplcacheを有効にする {{{
if v:version >= 703
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
  let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet/autoload/neosnippet/snippets,~/.vim/bundle/neosnippet_chef_recipe_snippet/autoload/neosnippet/snippets,~/.vim/bundle/PHPSnippetsCreator/dist'
  " 補完を有効にしたい場合はset filetype=textなどにするとよい。
  let g:neocomplcache_text_mode_filetypes = {
  \  'tex': 1,
  \  'text': 1,
  \  'gitcommit': 1,
  \  'plaintex': 1,
  \}

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
endif
"}}}

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

" vim-ref {{{1
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

" カーソル位置の単語をPHPマニュアルから検索する。カーソルがある状態で:phpで実行 {{{2
nnoremap <silent> :php :<C-u>call ref#jump('normal', 'phpmanual')<CR>
vnoremap <silent> :php :<C-u>call ref#jump('visual', 'phpmanual')<CR>
"}}}

"}}}

" 言語別 : php {{{1

" makeコマンドを入力すると、PHPの構文エラーがないかどうかもチェック可能 {{{2
" PSR2に従いタブからスペースに展開するように変更
:autocmd FileType php set tabstop=4 shiftwidth=4 expandtab makeprg=php\ -l\ % errorformat=%m\ in\ %f\ on\ line\ %l
"}}}

" 文字列の中のSQLをハイライトする {{{2
:autocmd FileType php let php_sql_query=1
"}}}

" Baselibメソッドのハイライトを行う {{{2
:autocmd FileType php let php_baselib=1
"}}}

" 文字列の中のHTMLをハイライトする {{{2
:autocmd FileType php let php_htmlInStrings=1
"}}}

" ショートタグのハイライトを無効にする {{{2
:autocmd FileType php let php_noShortTags=1
"}}}

" ] や ) の対応エラーをハイライトする {{{2
:autocmd FileType php let php_parent_error_close=1
"}}}

" 辞書から関数を選択できるようにする {{{2
" キーワード上でctrl + x ctrl + kを入力
:autocmd FileType php set dictionary=~/.vim/dictionary/PHP.dict
"}}}

" PHP documenter script bound to ,pdoc {{{
if v:version >= 704
  let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
  autocmd Filetype php nnoremap <buffer> ,pdoc :call pdv#DocumentWithSnip()<CR>
endif
" }}}

" cakephpのスニペットを有効にする {{{2
:autocmd FileType ctp set ft=php.cakephp
"}}}

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
let g:php_cs_fixer_path = "/usr/local/bin/php-cs-fixer.phar"
nnoremap <silent> :pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent> :pcf :call PhpCsFixerFixFile()<CR>
"}}}

"}}}

" 言語別 : python {{{1
:autocmd FileType py set tabstop=4 shiftwidth=4 expandtab
:autocmd FileType javascript set tabstop=4 shiftwidth=4 expandtab fileencoding=utf-8
"}}}

" 言語別 : ruby {{{1
:autocmd FileType ruby set tabstop=2 shiftwidth=2 expandtab softtabstop=2 autoindent smartindent fileencoding=utf-8
:autocmd FileType eruby set tabstop=2 shiftwidth=2 expandtab softtabstop=2 autoindent smartindent fileencoding=utf-8
autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec    set filetype=ruby
" Ruby on Rails
autocmd BufNewFile,BufRead *.builder,*.rxml,*.rjs  set filetype=ruby
" Rakefile
autocmd BufNewFile,BufRead [rR]akefile,*.rake      set filetype=ruby
" Rantfile
autocmd BufNewFile,BufRead [rR]antfile,*.rant      set filetype=ruby
" IRB config
autocmd BufNewFile,BufRead .irbrc,irbrc            set filetype=ruby
" Pry config
autocmd BufNewFile,BufRead .pryrc                  set filetype=ruby
" Rackup
autocmd BufNewFile,BufRead *.ru                    set filetype=ruby
" Capistrano
autocmd BufNewFile,BufRead Capfile                 set filetype=ruby
" NeoBundler
autocmd BufNewFile,BufRead Gemfile                 set filetype=ruby
" Guard
autocmd BufNewFile,BufRead Guardfile,.Guardfile    set filetype=ruby
" Chef
autocmd BufNewFile,BufRead Cheffile                set filetype=ruby
autocmd BufNewFile,BufRead Berksfile               set filetype=ruby
" Vagrant
autocmd BufNewFile,BufRead [vV]agrantfile          set filetype=ruby
" Autotest
autocmd BufNewFile,BufRead .autotest               set filetype=ruby
" eRuby
autocmd BufNewFile,BufRead *.erb,*.rhtml           set filetype=eruby
" Thor
autocmd BufNewFile,BufRead [tT]horfile,*.thor      set filetype=ruby
" Rabl
autocmd BufNewFile,BufRead *.rabl                  set filetype=ruby
" Jbuilder
autocmd BufNewFile,BufRead *.jbuilder              set filetype=ruby
" Puppet librarian
autocmd BufNewFile,BufRead Puppetfile              set filetype=ruby
" Buildr Buildfile
autocmd BufNewFile,BufRead [Bb]uildfile            set filetype=ruby

" chef_dict {{{2
" 辞書ファイル追加
" git clone https://github.com/OpsRockin/opscode_chef.vim_dict.git ~/.vim/dictionary/opscode_chef.dict
if has("win32") || has("win64")
  autocmd FileType ruby set dictionary+=~/vimfiles/dictionary/opscode_chef.vim_dict/*.dict
else
  autocmd FileType ruby set dictionary+=~/.vim/dictionary/opscode_chef.vim_dict/*.dict
end
"}}}

"}}}

" ファイルタイプ別の設定 / Markdown {{{
autocmd BufNewFile,BufRead *.md,*.rdoc set fileencoding=utf-8
autocmd BufRead,BufNewFile *.md set filetype=markdown
"}}}

" ファイルタイプ別の設定 / CSV {{{
augroup filetypedetect
  au! BufRead,BufNewFile *.csv,*.tsv set filetype=csv
augroup END
" }}}

" ファイルタイプ別の設定 / Review {{{
augroup Review
  autocmd!
  autocmd BufWinEnter,BufNewFile *.re set filetype=review
augroup END
" }}}

" open-browser の設定 / URLの上でと押すとブラウザを開く {{{
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap br <Plug>(openbrowser-smart-search)
vmap br <Plug>(openbrowser-smart-search)
"}}}

" Nerd_Commenter の基本設定 {{{
let g:NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1
nmap //// <Plug>NERDCommenterToggle
vmap //// <Plug>NERDCommenterToggle
nmap ///9 <Plug>NERDCommenterToEOL  " カーソル位置以降
vmap ///s <Plug>NERDCommenterSexy
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle
"}}}

" VimShell {{{
if v:version >= 703
  let g:vimshell_prompt = '$ '
endif
"}}}

" ctrlp <c-x> {{{
" このコマンドを使うと、同一ディレクトリ内のファイルを簡単に
" リストアップして編集できる
" http://mattn.kaoriya.net/software/vim/20111228013428.htm
let g:ctrlp_map = '<c-x>'
"}}}

" vim-easy-align / Alignでテキスト整形 {{{
" VisualModeで選択してEnterを押下し、揃えたい文字を入れる
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
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

" vim-sessionの設定 / 再起動を簡単にできるようにする {{{
:let g:session_autosave = 'no'
nnoremap <silent> :Restart :RestartVim<CR>
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
" }}}

" vim-trailing-whitespaceの設定 {{{
" :FixWhitespaceとすればまとめて文末削除できる
let g:extra_whitespace_ignored_filetypes = ['unite', 'calendar']
" }}}

" Japanese input {{{
" 「日本語入力固定モード」切替キー
inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
" PythonによるIBus制御指定
let IM_CtrlIBusPython = 1
" バッファ毎に日本語入力固定モードの状態を制御。
let g:IM_CtrlBufLocalMode = 1
"}}}

" Excitetranslate {{{
" trと入れれば翻訳できるように設定
nnoremap <silent> tr :<C-u>ExciteTranslate<CR>
vnoremap <silent> tr :<C-u>ExciteTranslate<CR>
autocmd BufEnter ==Translate==\ Excite nnoremap <buffer> <silent> q :<C-u>close<CR>
"}}}

" 英文を書くときに色々補完する {{{

" googlesuggest* {{{
" let g:googlesuggest_language = 'en'
" }}}

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

" memolist / 簡単にメモ取りたい {{{
let g:memolist_path = "~/Dropbox/memo"
nnoremap mn  :MemoNew<CR>
nnoremap ml  :MemoList<CR>
nnoremap mg  :MemoGrep<CR>
" }}}

" vim-expand-region / 選択しやすくする vの連打で範囲が変えられる {{{
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" }}}

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
" }}}

" vim-anzu / 検索でヒットした件数を表示する {{{
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-n-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
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
      \       'filetype' : '\v^ref-.+',
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
        \ "ryuzee",
        \ ]
" }}}

"最後の処理 {{{
" ~/.vimrc.localが存在する場合のみ設定を読み込む
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif
" }}}
