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
NeoBundle 'Shougo/neomru.vim'
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
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'jistr/vim-nerdtree-tabs'
if has('gui_macvim')
  NeoBundle 'ryanoasis/vim-devicons'
  NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'
end
NeoBundle 'majutsushi/tagbar'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'thinca/vim-singleton'
" }}}

" ファイル編集 {{{
NeoBundle 'godlygeek/tabular'
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
if has('python')
  NeoBundle 'jaxbot/github-issues.vim'
endif
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
" PHPUnit formatter http://www.karakaram.com/vim/phpunit-location-list/
NeoBundle 'karakaram/vim-quickrun-phpunit'
" http://d.hatena.ne.jp/yuhei_kagaya/20111216/1324023977
NeoBundle 'violetyk/cake.vim'
" }}}

" その他分類不能 {{{
NeoBundle 'kannokanno/previm'
NeoBundle 'sudo.vim'
NeoBundle "mhinz/vim-startify"
NeoBundle 'blueyed/vim-diminactive'
NeoBundle 'xolox/vim-session'
NeoBundle 'xolox/vim-misc'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'itchyny/dictionary.vim'
NeoBundle 'deton/eblook.vim'
" }}}

filetype plugin indent on
call neobundle#end()
NeoBundleCheck
" }}}

