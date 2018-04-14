" Reviewファイル関連の設定
augroup Review
  autocmd!
  autocmd BufWinEnter,BufNewFile *.re set filetype=review
  autocmd FileType review set tabstop=8 shiftwidth=8 noexpandtab fileencoding=utf-8
augroup END
