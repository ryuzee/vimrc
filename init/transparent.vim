" フォーカスがあたっていない場合は透明にする
" 数字が大きいほど透明度が高い
augroup transparency
  autocmd!
    if has('mac')
      autocmd FocusGained * set transparency=0
      autocmd FocusLost * set transparency=20
    endif
augroup END
