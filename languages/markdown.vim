" Markdown関連の設定
augroup markdowntype
  autocmd!
  autocmd BufNewFile,BufRead *.md,*.markdown,*.rdoc set fileencoding=utf-8
  autocmd BufRead,BufNewFile *.md,*.markdown set filetype=markdown
  nnoremap pv :PrevimOpen<CR>
augroup END
