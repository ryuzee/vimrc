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
let s:actual_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" NeoBundleの設定
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
  " 自分のスクリプトも追加する
  execute "set runtimepath+=" . s:actual_dir
  "echo &runtimepath
endif

" NeoBundle
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

if neobundle#load_cache()
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#load_toml(s:actual_dir . '/neobundle.toml')
  call neobundle#load_toml(s:actual_dir . '/neobundle_colorscheme.toml')
  call neobundle#load_toml(s:actual_dir . '/neobundle_unite_neocomplete.toml')
  call neobundle#load_toml(s:actual_dir . '/neobundle_ui.toml')
  call neobundle#load_toml(s:actual_dir . '/neobundle_ui_base.toml')
  call neobundle#load_toml(s:actual_dir . '/neobundle_text.toml')
  call neobundle#load_toml(s:actual_dir . '/neobundle_search.toml')
  call neobundle#load_toml(s:actual_dir . '/neobundle_misc.toml')
  if has('python')
    call neobundle#load_toml(s:actual_dir . '/neobundle_python.toml')
  end
  call neobundle#load_toml(s:actual_dir . '/neobundlelazy.toml', {'lazy' : 1} )
  NeoBundleSaveCache
endif

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" Load scripts
runtime! init/*.vim
runtime! plugins/*.vim
runtime! languages/*.vim

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
