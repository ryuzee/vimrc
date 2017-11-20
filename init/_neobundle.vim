" call neobundle#begin(expand('~/.vim/bundle'))
" let g:neobundle_default_git_protocol='https'

" if neobundle#load_cache()
  " NeoBundleFetch 'Shougo/neobundle.vim'

  " " TOMLファイルを指定
  " call neobundle#load_toml('neobundle.toml')
  " "if has('gui_macvim')
  " "  call neobundle#load_toml('neobundle_mac.toml')
  " "end
  " "if has('python')
  " "  call neobundle#load_toml('neobundle_python.toml')
  " "end
  " " NeoBundleLazyで指定した場合と同じ
  " call neobundle#load_toml('neobundlelazy.toml', {'lazy' : 1} )

  " " TOMLパーサが遅いため、一度読み込んだ設定をキャッシュに保存
  " NeoBundleSaveCache
" endif

" call neobundle#end()

" filetype plugin indent on
" NeoBundleCheck

