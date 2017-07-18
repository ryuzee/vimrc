" html関連の設定
augroup htmltype
  autocmd!
  autocmd FileType html set tabstop=2 shiftwidth=2 expandtab fileencoding=utf-8
  autocmd BufNewFile,BufRead *.html set filetype=html
augroup END

