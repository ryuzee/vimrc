let g:quickrun_config = {}
let g:quickrun_config['*'] = {'split': ''}
" 面倒なのでrrでquickrun実行
silent! nmap <unique> <C-r> <Plug>(quickrun)
