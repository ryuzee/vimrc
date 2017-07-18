" JavaScript関連の設定
augroup jstype
  autocmd!
  autocmd FileType javascript set tabstop=2 shiftwidth=2 expandtab fileencoding=utf-8
  autocmd BufNewFile,BufRead *.js set filetype=javascript
augroup END

