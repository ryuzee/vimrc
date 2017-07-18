" vim関連の設定
augroup vimtype
  autocmd!
  autocmd BufNewFile,BufRead *vimrc,*.vim            set filetype=vim
  autocmd FileType vim set tabstop=2 shiftwidth=2 expandtab
augroup END
