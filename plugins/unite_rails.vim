" Rails用
function! UniteRailsSetting()
  nnoremap <C-s><C-s><C-s>  :<C-U>Unite rails/view<CR>
  nnoremap <C-s><C-s>       :<C-U>Unite rails/model<CR>
  nnoremap <C-s>            :<C-U>Unite rails/controller<CR>
  nnoremap <C-s>c           :<C-U>Unite rails/config<CR>
  nnoremap <C-s>s           :<C-U>Unite rails/spec<CR>
  nnoremap <C-s>m           :<C-U>Unite rails/db -input=migrate<CR>
  nnoremap <C-s>l           :<C-U>Unite rails/lib<CR>
  nnoremap <C-s>ra          :<C-U>Unite rails/rake<CR>
  nnoremap <C-s>h           :<C-U>Unite rails/heroku<CR>
endfunction
augroup MyAutoCmd
  autocmd!
  autocmd User Rails call UniteRailsSetting()
augroup END
