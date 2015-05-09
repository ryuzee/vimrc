" ryuzee's vimrc

" 一般的な設定 {{{
set nocompatible
filetype off
set encoding=utf-8
scriptencoding utf-8
set tags=~/.tags
set vb t_vb=                   " ビープ音いらない
set shortmess+=I               " 起動時のメッセージいらない
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
set wildmenu                   " コマンド補完を強化
set wildmode=list:full         " リスト表示，最長マッチ
set fileformats=unix,dos,mac   " 改行コードの自動認識
set list                       " タブなどの制御文字を表示
set tabstop=4
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
"}}}

" クリップボードの設定 {{{
if has('gui')
  set clipboard=unnamed,unnamedplus
endif
"}}}

" Vundle設定 {{{
" BundleInstallでうまくいかない場合はコマンドラインで
" vim +BundleInstall +qall
if has("win32") || has("win64")
  au FileType vundle setlocal noshellslash
  set rtp+=~/vimfiles/bundle/vundle/
  call vundle#rc('~/vimfiles/bundle')
else
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
end
Bundle 'gmarik/vundle'
"}}}

" Vundleで読み込むプラグインの設定 {{{
Bundle 'thinca/vim-quickrun'
" PHPUnit formatter http://www.karakaram.com/vim/phpunit-location-list/
Bundle 'karakaram/vim-quickrun-phpunit'
if v:version >= 703
  " http://d.hatena.ne.jp/yuhei_kagaya/20111216/1324023977
  Bundle 'violetyk/cake.vim'
endif

Bundle 'thinca/vim-ref'
Bundle 'git://repo.or.cz/vcscommand'
Bundle 'tyru/open-browser.vim'
" required by unite-vim_hacks
Bundle 'mattn/webapi-vim'
Bundle 'thinca/vim-openbuf'
Bundle "markcornick/vim-vagrant"
"}}}

" Look and Feel {{{

" 背景色の設定 {{{
" evening / lucius / mrkn256 / zenburn / Diablo3 / molokai
Bundle 'thinca/vim-guicolorscheme'
Bundle 'vim-scripts/Diablo3.git'
Bundle 'vim-scripts/Lucius'
Bundle 'vim-scripts/mrkn256.vim'
Bundle 'jnurmine/Zenburn'
Bundle 'tomasr/molokai'
Bundle 'inkpot'
Bundle 'nanotech/jellybeans.vim'
Bundle 'sickill/vim-monokai'
:colorscheme molokai

if !has('gui_running')
  set t_Co=256
endif
"}}}

" インデントをわかりやすく表示する {{{
if v:version >= 703
  Bundle 'nathanaelkane/vim-indent-guides'
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_auto_colors = 1
  let g:indent_guides_color_change_percent = 30
  let g:indent_guides_guide_size = 1
endif
"}}}

" フォーカスがあたっていない場合は透明にする
"{{{
augroup hack234
  autocmd!
    if has('mac')
    "  autocmd FocusGained * set transparency=10
    "  autocmd FocusLost * set transparency=30
    endif
augroup END
"}}}

" Windowの形状設定
"{{{
if has('gui')
  set showtabline=2  " タブを常に表示
  set imdisable  " IMを無効化
  set guioptions-=T   " ツールバー非表示
endif
if has('gui_macvim')
  set transparency=0  " 透明度を指定
endif
"}}}

" Settings for AlirLines {{{
Bundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='tomorrow'
let g:airline_left_sep = '>'
let g:airline_right_sep = '<'
let g:airline#extensions#tabline#left_sep = '>'
let g:airline#extensions#tabline#left_alt_sep = '>'
" let g:airline#exclude_filenames = ['NERD_Tree_1','default.rb']

" カーソル位置と現在行を示す {{{
:set cursorline
:hi CursorLine term=underline cterm=underline
"}}}

" コメント行をグレー表示する(コンソール）{{{
hi Comment ctermfg=7
"}}}

" 挿入モードかどうかで色を変える {{{
augroup InsertHook
autocmd!
" autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
" autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END
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
  Bundle 'Shougo/unite.vim'
  Bundle 'ujihisa/unite-colorscheme'
  Bundle 'ujihisa/unite-font'
  Bundle 'Shougo/unite-outline'
  Bundle 'ujihisa/unite-locate'
  Bundle 'kmnk/vim-unite-svn'
  Bundle 'choplin/unite-vim_hacks'
  Bundle 'tsukkee/unite-help'
  Bundle 'tsukkee/unite-tag'
  Bundle 'oppara/vim-unite-cake'
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
endif
"}}}

" neocomplcacheを有効にする {{{
if v:version >= 703
  Bundle 'Shougo/neocomplcache'
  Bundle 'ryuzee/neocomplcache_php_selenium_snippet'
  Bundle 'Shougo/neosnippet'
  Bundle 'Shougo/neosnippet-snippets'
  Bundle 'ryuzee/neosnippet_chef_recipe_snippet'
  Bundle 'glidenote/serverspec-snippets'
  " PHPの標準関数用スニペット
  Bundle 'tekkoc/PHPSnippetsCreator'

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

  let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet/autoload/neosnippet/snippets,~/.vim/bundle/neosnippet_chef_recipe_snippet/autoload/neosnippet/snippets,~/.vim/bundle/PHPSnippetsCreator/dist'

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

" (),[],{},<>,””,’’,“入力+()の中にカーソル戻す {{{
imap {} {}<LEFT>
imap [] []<LEFT>
imap () ()<LEFT>
imap <> <><Left>
imap "" ""<Left>
imap '' ''<Left>
"}}}

" Shift + Tab でタブ移動、Tab + Tab で左移動する {{{
if v:version >= 703
  nnoremap <S-Tab> gt
  nnoremap <Tab><Tab> gT
  for i in range(1, 9)
    execute 'nnoremap <Tab>' . i . ' ' . i . 'gt'
  endfor
endif
"}}}

" manage git {{{
Bundle 'tpope/vim-fugitive'
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
" }}}

"}}}

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

" vim-refの設定 {{{
" 利用可能なソースは以下の通り
" - clojure  (|ref-clojure.txt|)
" - erlang   (|ref-erlang.txt|)
" - man      (|ref-man.txt|)
" - perldoc  (|ref-perldoc.txt|)
" - phpmanual(|ref-phpmanual.txt|)
" - pydoc    (|ref-pydoc.txt|)
" - refe     (|ref-refe.txt|)
"
" shifh + k でキーワード検索可能

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

" カーソル位置の単語をPHPマニュアルから検索する。カーソルがある状態で:phpで実行 {{{
nnoremap <silent> :php :<C-u>call ref#jump('normal', 'phpmanual')<CR>
vnoremap <silent> :php :<C-u>call ref#jump('visual', 'phpmanual')<CR>
"}}}

"}}}

" 言語別 : php {{{
" makeコマンドを入力すると、PHPの構文エラーがないかどうかもチェック可能 {{{
" PSR2に従いタブからスペースに展開するように変更
:autocmd FileType php set tabstop=4 shiftwidth=4 expandtab makeprg=php\ -l\ % errorformat=%m\ in\ %f\ on\ line\ %l
"}}}

" 文字列の中のSQLをハイライトする {{{
:autocmd FileType php let php_sql_query=1
"}}}

" 文字列の中のHTMLをハイライトする {{{
:autocmd FileType php let php_htmlInStrings=1
"}}}

" ショートタグのハイライトを無効にする {{{
:autocmd FileType php let php_noShortTags=1
"}}}

" 辞書から関数を選択できるようにする {{{
" キーワード上でctrl + x ctrl + kを入力
:autocmd FileType php set dictionary=~/.vim/dictionary/PHP.dict
"}}}

" cakephpのスニペットを有効にする {{{
:autocmd FileType ctp set ft=php.cakephp
"}}}

" cake.vimの設定 {{{
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

" クラスと関数の折り畳みを許可する {{{
" zo 折り畳みを開く
" zc 折り畳みを閉じる
" zR 全部開く
" zM 全部閉じる
" zj 次の折り畳みに移動
" zk 前の折り畳みに移動
let php_folding=3
set foldmethod=marker
"}}}

" PHPのコードを整形する http://docs.komagata.org/4988 {{{
Bundle 'stephpy/vim-php-cs-fixer'
let g:php_cs_fixer_path = "/usr/local/bin/php-cs-fixer"
nnoremap <silent> :pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent> :pcf :call PhpCsFixerFixFile()<CR>
"}}}

"}}}

" 言語別 : python {{{
:autocmd FileType py set tabstop=4 shiftwidth=4 expandtab
:autocmd FileType javascript set tabstop=4 shiftwidth=4 expandtab fileencoding=utf-8
"}}}

" 言語別 : ruby {{{
" ruby
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
" Bundler
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

" chef_dict {{{
" 辞書ファイル追加
" git clone https://github.com/OpsRockin/opscode_chef.vim_dict.git ~/.vim/dictionary/opscode_chef.dict
if has("win32") || has("win64")
  autocmd FileType ruby set dictionary+=~/vimfiles/dictionary/opscode_chef.vim_dict/*.dict
else
  autocmd FileType ruby set dictionary+=~/.vim/dictionary/opscode_chef.vim_dict/*.dict
end
"}}}

" Rubocopを使ってソースコードのフォーマットチェック {{{
Bundle 'ngmy/vim-rubocop'
"}}}

"}}}

" 言語別 : markdown {{{
Bundle 'tpope/vim-markdown'
Bundle 'kannokanno/previm'
autocmd BufNewFile,BufRead *.md,*.rdoc set fileencoding=utf-8
autocmd BufRead,BufNewFile *.md set filetype=markdown
"}}}

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
"}}}

" □とか○の文字があってもカーソル位置がずれないようにする {{{
if exists('&ambiwidth')
  set ambiwidth=double
endif
"}}}

" URLの上でと押すとブラウザを開く {{{
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap br <Plug>(openbrowser-smart-search)
vmap br <Plug>(openbrowser-smart-search)
"}}}

" Nerd_Commenter の基本設定 {{{
let g:NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1
nmap <Leader>/ <Plug>NERDCommenterToggle
vmap <Leader>/ <Plug>NERDCommenterToggle
nmap <leader>/9 <Plug>NERDCommenterToEOL  " カーソル位置以降
vmap <Leader>/s <Plug>NERDCommenterSexy
"}}}

" VimShell {{{
if v:version >= 703
  Bundle 'Shougo/vimproc'
  Bundle 'Shougo/vimshell'
  let g:vimshell_prompt = '$ '
endif
"}}}

" ctrlp <c-x> {{{
" このコマンドを使うと、同一ディレクトリ内のファイルを簡単に
" リストアップして編集できる
" http://mattn.kaoriya.net/software/vim/20111228013428.htm
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-x>'
"}}}

" Alignでテキスト整形 {{{
" http://nanasi.jp/articles/vim/align/align_vim_ctrl.html
Bundle 'vim-scripts/Align'
" easy-alignに置き換え？
" http://alpaca.tc/blog/vim/plugins-best-of-vim-1.html
Bundle 'junegunn/vim-easy-align'
"}}}

" SQLを整形 {{{
Bundle 'vim-scripts/SQLUtilities'
"}}}

" sudoつけて特権で編集可能にする {{{
" http://nanasi.jp/articles/vim/sudo_vim.html
Bundle 'sudo.vim'
"}}}

" フォントの大小切り替え {{{
" - で縮小、+で拡大、:Fontzoom size指定
Bundle 'thinca/vim-fontzoom'
"}}}

" コメントアウトを簡単に実現 {{{
Bundle 'scrooloose/nerdcommenter'
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle
"}}}

" カーソル移動を楽にする {{{
" http://blog.remora.cx/2012/08/vim-easymotion.html
" ; + bwhjklなどで簡単選択
Bundle 'Lokaltog/vim-easymotion'
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

" Yankの履歴をいい感じに取り出す{{{
" 一旦ペーストしたあとCtrl+p または Ctrl + n で入れ替える
Bundle 'vim-scripts/YankRing.vim'
"}}}

" メソッドや変数宣言の一覧を表示 {{{
" vim-script
" タグを作りたいところで、ctags -R したあとに:TlistすればOK
Bundle 'taglist.vim'
"}}}

" 文字列をいい感じに囲ったり、囲んでるものを外す {{{
" See http://vimblog.hatenablog.com/entry/vim_plugin_surround_vim
" 例) 文字列上でdtsとかやるとタグを全部外せる
Bundle 'tpope/vim-surround'
"}}}

" zencodingを使って楽にhtmlを書く {{{
" https://github.com/mattn/emmet-vim/blob/master/doc/emmet.txt
" 例) table>tr*3>td*2<Ctrl+y>, みたいにすると展開される
Bundle 'mattn/emmet-vim'
"}}}

" 再起動を簡単にできるようにする {{{
" :Restart あたりでOK
Bundle 'tyru/restart.vim'
let g:restart_sessionoptions = 'blank,curdir,folds,help,localoptions,tabpages'
"}}}

" タブ移動の設定 {{{
" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
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
"}}}

" vimの戦闘力を明らかにする {{{
" :Scouterコマンド
Bundle 'thinca/vim-scouter'
"}}}

" 直近開いたファイルとかを起動時に開く {{{
Bundle "mhinz/vim-startify"
"}}}

" さまざまなファイルのフォーマットチェック系 {{{
" :SyntasticCheck で実行
Bundle 'scrooloose/syntastic'
"}}}

" ファイルの一覧を表示 {{{
Bundle 'scrooloose/nerdtree'
nnoremap <silent><C-e> :NERDTreeToggle<CR>
"}}}

" BootstrapのHTMLを簡単に書けるようにするスニペット {{{
Bundle 'chrisgillis/vim-bootstrap3-snippets'
"}}}

" JSONファイルをハイライトしていい感じに表示してくれる {{{
Bundle 'elzr/vim-json'
"}}}

" タグをいい感じに扱う {{{
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'
set tags=./.tags;,~/.vim/tags
" :TagbarToggle コマンドでタグを別窓で表示する
Bundle 'majutsushi/tagbar'
let g:tagbar_width = 40
" Map for toggle
noremap <silent> :tt :TagbarToggle<CR>
" }}}

" Trailing whitespace {{{
Bundle 'bronson/vim-trailing-whitespace'
let g:extra_whitespace_ignored_filetypes = ['unite']
" }}}

" ログを色付け {{{
Bundle 'vim-scripts/AnsiEsc.vim'
" }}}

" {{{ Dim inactive window
Bundle 'blueyed/vim-diminactive'
" }}}

" Japanese input {{{
Bundle 'fuenor/im_control.vim'
" 「日本語入力固定モード」切替キー
inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
" PythonによるIBus制御指定
let IM_CtrlIBusPython = 1
" バッファ毎に日本語入力固定モードの状態を制御。
let g:IM_CtrlBufLocalMode = 1
"}}}

" 翻訳 {{{

" :ExciteTranslateとやれば翻訳される
Bundle 'mattn/excitetranslate-vim'
" trと入れれば翻訳できるように設定
nnoremap <silent> tr :<C-u>ExciteTranslate<CR>
autocmd BufEnter ==Translate==\ Excite nnoremap <buffer> <silent> q :<C-u>close<CR>

Bundle 'mattn/googletranslate-vim'

"}}}

" 英文を書くときに色々補完する {{{
Bundle 'ujihisa/neco-look'
" 補完を有効にしたい場合はset filetype=textなどにするとよい。
let g:neocomplcache_text_mode_filetypes = {
\  'tex': 1,
\  'text': 1,
\  'gitcommit': 1,
\  'plaintex': 1,
\}

" Google Suggestも使う
Bundle 'mopp/googlesuggest-source.vim'
Bundle 'mattn/googlesuggest-complete-vim'
Bundle 'sousu/neco-googlesuggest'
let g:googlesuggest_language = 'en'

" 辞書を引けるようにする(vim-refが必要)
Bundle 'mfumi/ref-dicts-en'
" 辞書定義
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

" Macの辞書を引く
" http://itchyny.hatenablog.com/entry/20130916/1379305665
" :Dictionaryで呼び出し
Bundle 'itchyny/dictionary.vim'

" eblookを使ってローカル辞書検索
" CTRL+K y で検索できる
Bundle 'deton/eblook.vim'
" Download EB library from ftp://ftp.sra.co.jp/pub/misc/eb/eb-4.4.3.tar.bz2
" See http://openlab.jp/edict/eblook/
" Download eblook from http://openlab.jp/edict/eblook/dist/eblook-1.6.1.tar.gz
" 辞書ファイルは以下から入手
" http://www.vector.co.jp/soft/data/writing/se369320.html

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
let eblook_contentwin_height = -1
"}}}

Bundle 'osyo-manga/vim-gift'
