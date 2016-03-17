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

"===> NeoBundleの設定 {{{
set nocompatible
if has('vim_starting')
  " neobundle をインストールしていない場合は自動インストール
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    " vim からコマンド呼び出しているだけ neobundle.vim のクローン
    call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
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
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'thinca/vim-quickrun'
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
" }}}

" ColorScheme {{{
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'thinca/vim-guicolorscheme'
NeoBundle 'tomasr/molokai'
" }}}

" 見栄え {{{
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'osyo-manga/vim-gift'
NeoBundle 'osyo-manga/vim-automatic'
NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'LeafCage/foldCC'
NeoBundle 'thinca/vim-zenspace'
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
NeoBundle 'ctrlpvim/ctrlp.vim'
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
NeoBundle 'markcornick/vim-vagrant'
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
NeoBundle 'tpope/vim-rails', {
  \   'autoload' : {
  \     'filetypes' : [
  \       'haml',
  \       'ruby',
  \       'eruby'
  \     ]
  \   }
  \ }
NeoBundle 'basyura/unite-rails'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'vim-scripts/ruby-matchit'
" }}}

" PHP関連 {{{
NeoBundle 'ryuzee/neocomplcache_php_selenium_snippet'
NeoBundle 'nishigori/neocomplcache-phpunit-snippet'
NeoBundle 'oppara/vim-unite-cake'
NeoBundle 'tekkoc/PHPSnippetsCreator'
NeoBundle 'stephpy/vim-php-cs-fixer'
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
NeoBundle 'ujihisa/neco-look'
NeoBundle 'itchyny/dictionary.vim'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'mattn/googletranslate-vim'
NeoBundle 'itchyny/calendar.vim'
NeoBundle 'deton/eblook.vim'
" }}}

filetype plugin indent on
call neobundle#end()
NeoBundleCheck
" }}}

"===> 一般的な設定 {{{
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
set lcs=tab:>.,trail:_,extends:\  " タブを表示する。改行文字は表示しない
set laststatus=2               "常にステータス行を表示
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
syntax on                      " シンタックスハイライトを有効にする

" クリップボードの設定 {{{
if has('gui_running')
  set clipboard=unnamed,unnamedplus
endif
" }}}

" 全角ハイライト {{{
augroup vimrc-highlight
  autocmd!
  autocmd ColorScheme * highlight ZenSpace ctermbg=Yellow guibg=Yellow
augroup END
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

"===> 見栄え関連の設定 {{{
if !has('gui_running')
  colorscheme molokai
  set t_Co=256
endif
function! s:hl_colorscheme_modify_molokai()
  highlight! DiffText term=reverse cterm=bold ctermbg=239 gui=bold,italic guibg=#4C4745
  highlight! DiffDelete term=bold ctermfg=180 ctermbg=0 gui=bold guifg=#960050 guibg=#1E0010
  highlight! DiffAdd term=bold ctermbg=0 guibg=#13354A
  highlight! Visual ctermfg=236 ctermbg=119 guifg=#353535 guibg=#95e454
  highlight! default link MatchParen Title
endfunction
autocmd BufWinEnter,ColorScheme * call s:hl_colorscheme_modify_molokai()

" 挿入モードかどうかで色を変える {{{
augroup InsertHook
  autocmd!
  autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
  autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END
" }}}

" コメント行をグレー表示する(コンソール）{{{
highlight Comment ctermfg=7
" }}}

" vim-indent-guides設定 / インデントをわかりやすく表示する {{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'calendar']
" }}}

" フォーカスがあたっていない場合は透明にする {{{
" 数字が大きいほど透明度が高い
augroup transparency
  autocmd!
    if has('mac')
      autocmd FocusGained * set transparency=0
      autocmd FocusLost * set transparency=20
    endif
augroup END
" }}}

" Windowの形状設定 {{{2
if has('gui_running')
  set showtabline=2  " タブを常に表示
  set imdisable  " IMを無効化
  set guioptions-=T   " ツールバー非表示
endif
if has('gui_macvim')
  set transparency=0  " 透明度を指定
endif
" }}}

" vim-airline / ステータスラインをいい感じにする {{{2
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
" }}}

" Syntasticの設定 {{{2
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
nnoremap [unite] <Nop>
nmap     ,u [unite]
nnoremap [unite]a   :<C-u>UniteWithBufferDir -no-quit -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap [unite]b   :<C-u>Unite buffer<CR>
nnoremap [unite]c   :<C-u>Unite colorscheme<CR>
nnoremap [unite]f   :<C-u>UniteWithBufferDir -no-quit -buffer-name=files file<CR>
nnoremap [unite]fl  :<C-u>UniteWithBufferDir -vertical -winwidth=30 -no-quit -buffer-name=files file<CR>
nnoremap [unite]m   :<C-u>Unite -no-quit file_mru<CR>
nnoremap [unite]uml :<C-u>Unite -no-quit -vertical -winwidth=30 file_mru<CR>
nnoremap [unite]o   :<C-u>Unite outline<CR>
nnoremap [unite]ol  :<C-u>Unite -vertical -no-quit -winwidth=30 outline<CR>
nnoremap [unite]r   :<C-u>Unite -no-quit -buffer-name=register register<CR>
nnoremap [unite]u   :<C-u>Unite -no-quit buffer file_mru<CR>
nnoremap [unite]y   :<C-u>Unite yankround<CR>
nnoremap [unite]cc  :<C-u>Unite cake_controller<CR>
nnoremap [unite]cm  :<C-u>Unite cake_model<CR>
nnoremap [unite]cv  :<C-u>Unite cake_view<CR>
nnoremap [unite]ch  :<C-u>Unite cake_helper<CR>

augroup unite_settings
  autocmd!
  " ウィンドウを分割して開く
  autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  autocmd FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  " ウィンドウを縦に分割して開く
  autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  autocmd FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  " unite.vim上でのキーマッピング
  autocmd FileType unite call s:unite_my_settings()
augroup END

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
nnoremap <Space>search :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
" reset not it is <C-l> normally
nnoremap <Space>reset <Plug>(unite_restart)
" call unite#custom_default_action('file', 'tabopen')

" Rails用 {{{
function! UniteRailsSetting()
  nnoremap <C-s><C-s><C-s>  :<C-U>Unite rails/view<CR>
  nnoremap <C-s><C-s>       :<C-U>Unite rails/model<CR>
  nnoremap <C-s>            :<C-U>Unite rails/controller<CR>
  nnoremap <C-s>c           :<C-U>Unite rails/config<CR>
  nnoremap <C-s>s           :<C-U>Unite rails/spec<CR>
  nnoremap <C-s>m           :<C-U>Unite rails/db -input=migrate<CR>
  nnoremap <C-s>l           :<C-U>Unite rails/lib<CR>
  nnoremap <C-s>ra          :<C-U>Unite rails/rake<CR>
  nnoremap <C-s>h           :<C-U>Unite rails/heroku<CR>
endfunction
augroup MyAutoCmd
  autocmd!
  autocmd User Rails call UniteRailsSetting()
augroup END
" }}}
" <=== unite.vimの設定ここまで }}}

"===> vim-refの設定 {{{1
" shift + k でキーワード検索可能
let g:ref_alc_cmd='lynx -dump -nonumbers %s'
let g:ref_phpmanual_cmd='lynx -dump -nonumbers -display_charset utf-8 %s'
let g:ref_source_webdict_cmd = 'lynx -dump -nonumbers -display_charset utf-8 %s'

" phpの場合は Ref phpmanual Hogehoge
let g:ref_phpmanual_path = $HOME . '/.vim/others/php-chunked-xhtml'
let g:ref_jquery_doc_path = $HOME . '/.vim/bundle/jqapi'
let g:ref_javascript_doc_path = $HOME . '/.vim/bundle/jsref/htdocs'

" カーソル位置の単語をPHPマニュアルから検索する。カーソルがある状態で:phpで実行 {{{2
nnoremap <silent> :php :<C-u>call ref#jump('normal', 'phpmanual')<CR>
vnoremap <silent> :php :<C-u>call ref#jump('visual', 'phpmanual')<CR>
" }}}
"<=== vim-refの設定ここまで}}}

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
  " PHP documenter script bound to ,pdoc {{{2
  if v:version >= 704
    let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
    autocmd Filetype php nnoremap <buffer> ,pdoc :call pdv#DocumentWithSnip()<CR>
  endif
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

"===> python関連の設定 {{{1
augroup pythontype
  autocmd!
  autocmd FileType py set tabstop=4 shiftwidth=4 expandtab
augroup END
"<=== python関連の設定ここまで}}}

"===> vim関連の設定 {{{1
augroup vimtype
  autocmd!
  autocmd BufNewFile,BufRead *vimrc,*.vim            set filetype=vim
  autocmd FileType vim set tabstop=2 shiftwidth=2 expandtab
augroup END
"<=== vim関連の設定ここまで}}}

"===> Ruby関連の設定 {{{1
augroup rubytype
  autocmd!
  autocmd FileType ruby set tabstop=2 shiftwidth=2 expandtab softtabstop=2 autoindent smartindent fileencoding=utf-8
  autocmd FileType eruby set tabstop=2 shiftwidth=2 expandtab softtabstop=2 autoindent smartindent fileencoding=utf-8
  " git clone https://github.com/OpsRockin/opscode_chef.vim_dict.git ~/.vim/dictionary/opscode_chef.dict
  autocmd FileType ruby set dictionary+=~/.vim/dictionary/opscode_chef.vim_dict/*.dict
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
augroup END

augroup railstype
  autocmd!
  autocmd BufEnter * if (exists("b:rails_root") && expand("%") =~ ".*\.rb$" && expand("%") !~ ".*\.erb$") | set filetype=ruby.rails | endif
  autocmd BufEnter * if (expand("%") =~ "_spec\.rb$") || (expand("%") =~ "^spec.*\.rb$") | set filetype=ruby.rspec | endif
augroup END

" vim-railsの設定 {{{
" 横着移動
nnoremap Rc :Econtroller<CR>
nnoremap Rm :Emodel<CR>
nnoremap Rv :Eview<CR>
" }}}

"<=== Ruby関連の設定ここまで}}}

"===> JavaScript関連の設定 {{{1
augroup htmltype
  autocmd!
  autocmd FileType html set tabstop=2 shiftwidth=2 expandtab fileencoding=utf-8
  autocmd BufNewFile,BufRead *.html set filetype=html
augroup END

"===> JavaScript関連の設定 {{{1
augroup jstype
  autocmd!
  autocmd FileType javascript set tabstop=2 shiftwidth=2 expandtab fileencoding=utf-8
  autocmd BufNewFile,BufRead *.js set filetype=javascript
augroup END

" Nodejs補完
let g:jscomplete_use = ['dom', 'moz']
setl omnifunc=jscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'
let g:node_usejscomplete = 1
"<=== JavaScript関連の設定ここまで }}}

"===> Markdown関連の設定 {{{
augroup markdowntype
  autocmd!
  autocmd BufNewFile,BufRead *.md,*.rdoc set fileencoding=utf-8
  autocmd BufRead,BufNewFile *.md set filetype=markdown
augroup END
"<=== Markdown関連の設定ここまで}}}

"===> CSVファイル関連の設定 {{{
augroup filetypedetect
  autocmd!
  autocmd BufRead,BufNewFile *.csv,*.tsv set filetype=csv
augroup END
"<=== CSVファイル関連の設定ここまで }}}

"===> Reviewファイル関連の設定 {{{
augroup Review
  autocmd!
  autocmd BufWinEnter,BufNewFile *.re set filetype=review
augroup END
"<=== Reviewファイル関連の設定ここまで }}}

"===> 検索系の設定 {{{
" incsearch.vim / インクリメンタル検索の機能改善 {{{2
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

" vim-anzu / 検索でヒットした件数を表示する {{{2
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-n-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
" }}}

" quickhlの設定 / 文字列をいい感じに簡単にハイライトする {{{2
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
" }}}

" 検索後にジャンプした際に検索単語を画面中央に持ってくる {{{
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" }}}

" over.vim {{{2
" over.vimの起動
nnoremap <silent> ,m :OverCommandLine<CR>
" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>
" }}}
"<=== 検索系の設定ここまで }}}

"===> ファイル整形系の設定 {{{
" vim-trailing-whitespaceの設定 {{{2
" :FixWhitespaceとすればまとめて文末削除できる
let g:extra_whitespace_ignored_filetypes = ['unite', 'calendar']
" }}}

" vim-easy-align / Alignでテキスト整形 {{{2
" VisualModeで選択してEnterを押下し、揃えたい文字を入れる
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" Nerd_Commenterでコメントアウトを簡単にする {{{2
let g:NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1
nmap //// <Plug>NERDCommenterToggle
vmap //// <Plug>NERDCommenterToggle
nmap ///9 <Plug>NERDCommenterToEOL  " カーソル位置以降
vmap ///s <Plug>NERDCommenterSexy
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle
" }}}
"<=== ファイル整形系の設定ここまで }}}

"===> 移動・ファイル選択の設定 {{{

" ctrlp {{{2
" このコマンドを使うと、同一ディレクトリ内のファイルを簡単に
" リストアップして編集できる
" http://mattn.kaoriya.net/software/vim/20111228013428.htm
let g:ctrlp_map = '<c-x>'
" }}}

" easymotion / カーソル移動を楽にする {{{2
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
" }}}

" nerdtree / ファイルの一覧を表示 {{{2
nnoremap <silent><C-c> :NERDTreeCWD<CR>
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
" }}}

" tagbar / タグをいい感じに扱う {{{2
let g:tagbar_width = 40
let g:tagbar_autofocus = 1
" Map for toggle
noremap <silent> :tt :TagbarToggle<CR>
" }}}

" 複数行カーソルのキーマップ {{{2
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
imap <expr><C-l>
\ neosnippet#expandable() <Bar><Bar> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-n>"
"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"<=== neocomplcacheの設定ここまで }}}

" open-browser の設定 / URLの上でと押すとブラウザを開く {{{
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap br <Plug>(openbrowser-smart-search)
vmap br <Plug>(openbrowser-smart-search)
" }}}

" VimShell {{{
let g:vimshell_prompt = '$ '
" }}}

" vim-sessionの設定 / 再起動を簡単にできるようにする {{{
:let g:session_autosave = 'no'
nnoremap <silent> :Restart :RestartVim<CR>
" }}}

"===> 英文関係の設定 {{{

" Excitetranslate {{{2
" trと入れれば翻訳できるように設定
nnoremap <silent> tr :<C-u>ExciteTranslate<CR>
vnoremap <silent> tr :<C-u>ExciteTranslate<CR>
augroup translate_settings
  autocmd!
  autocmd BufEnter ==Translate==\ Excite nnoremap <buffer> <silent> q :<C-u>close<CR>
augroup END
" }}}

" ref-dicts-en / 辞書を引けるようにする(vim-refが必要) {{{2
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

" eblookを使ってローカル辞書検索 {{{2
" <LEADER> y でカーソル位置の文字を検索できる
" <LEADER> CTRL + y で検索ウィンドウを表示できる
" See eblook.sh
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
" }}}
"<=== 英文関連の設定ここまで }}}

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

if has('gui_running')
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
    \       'filetype' : 'ref-webdict',
    \       'autocmds' : [ 'FileType' ]
    \     },
    \     'set' : {
    \       'move' : 'bottom',
    \       'width' : '100%',
    \       'height' : 20
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

" dbextの設定 {{{
" 詳細は、http://qiita.com/0829/items/ce92a752bf832a06bcf2
" let g:dbext_map_prefix = '&s'
" }}}

" Keymap Settings {{{
imap <C-z> <C-y>
let mapleader = "\<Space>"     " リーダーを|からスペースに変える
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" ウィンドウサイズ {{{2
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
" }}}

" (),[],{},<>,””,’’,“入力+()の中にカーソル戻す {{{2
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap <> <><Left>
imap "" ""<Left>
imap '' ''<Left>
" }}}

" yankroundの設定 {{{2
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
" }}}

" vim-expand-region / 選択しやすくする vの連打で範囲が変えられる {{{2
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" }}}

" タブ移動の設定 {{{2
nnoremap <S-Tab> gt
nnoremap <Tab><Tab> gT
nnoremap  [Tag]   <Nop>
nmap      t [Tag]
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
map <silent> [Tag]c :tablast <bar> tabnew<CR>
map <silent> [Tag]x :tabclose<CR>
map <silent> [Tag]n :tabnext<CR>
map <silent> [Tag]p :tabprevious<CR>
" }}}

" 画面スクロール {{{2
nnoremap <Space><Space>   <PageDown>
nnoremap ;;   <PageUp>
" }}}

" autoindent有効時にコード貼り付けでインデントがぐっちゃぐちゃになるのを防ぐ {{{2
set pastetoggle=<F10>
nnoremap <F10> :set paste!<CR>:set paste?<CR>
" }}}

" }}}

" Shortcut {{{
:command! StripTags :%s/<.\{-}>//cg
:command! StripTagsAll :%s/<.\{-}>//g
" }}}

" 最後の処理 {{{
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
