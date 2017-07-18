" QuickRunによる設定

augroup QuickRunPHPUnit
  autocmd!
  autocmd BufWinEnter,BufNewFile *Test.php set filetype=phpunit.php
augroup END

let g:quickrun_config['phpunit'] = {}
let g:quickrun_config['phpunit']['outputter'] = 'phpunit'
let g:quickrun_config['phpunit']['command'] = 'phpunit'
let g:quickrun_config['phpunit']['exec'] = '%c %o %s'
