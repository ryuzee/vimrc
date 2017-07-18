" CSVファイル関連の設定
augroup filetypedetect
  autocmd!
  autocmd BufRead,BufNewFile *.csv,*.tsv set filetype=csv
augroup END
