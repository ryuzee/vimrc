" Nerd_Commenterでコメントアウトを簡単にする
let g:NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1
nmap //// <Plug>NERDCommenterToggle
vmap //// <Plug>NERDCommenterToggle
nmap ///9 <Plug>NERDCommenterToEOL  " カーソル位置以降
vmap ///s <Plug>NERDCommenterSexy
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle
