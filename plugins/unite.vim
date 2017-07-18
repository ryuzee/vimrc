"===> unite.vimの設定 {{{
" 入力モードで開始する
let g:unite_enable_start_insert=1
" 縦分割で開く(オフにする)
let g:unite_enable_split_vertically = 0
" Windowの幅
let g:unite_winwidth = 40
" Window
let g:unite_winheight = 10
nnoremap [unite] <Nop>
nmap     ,u [unite]
nnoremap [unite]a   :<C-u>UniteWithBufferDir -no-quit -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap [unite]b   :<C-u>Unite buffer<CR>
nnoremap [unite]c   :<C-u>Unite colorscheme<CR>
nnoremap [unite]f   :<C-u>UniteWithBufferDir -no-quit -buffer-name=files file<CR>
nnoremap [unite]fl  :<C-u>UniteWithBufferDir -vertical -winwidth=30 -no-quit -buffer-name=files file<CR>
nnoremap [unite]m   :<C-u>Unite -no-quit file_mru<CR>
nnoremap [unite]uml :<C-u>Unite -no-quit -vertical -winwidth=30 file_mru<CR>
nnoremap [unite]o   :<C-u>Unite outline<CR>
nnoremap [unite]ol  :<C-u>Unite -vertical -no-quit -winwidth=30 outline<CR>
nnoremap [unite]r   :<C-u>Unite -no-quit -buffer-name=register register<CR>
nnoremap [unite]u   :<C-u>Unite -no-quit buffer file_mru<CR>
nnoremap [unite]y   :<C-u>Unite yankround<CR>
nnoremap [unite]cc  :<C-u>Unite cake_controller<CR>
nnoremap [unite]cm  :<C-u>Unite cake_model<CR>
nnoremap [unite]cv  :<C-u>Unite cake_view<CR>
nnoremap [unite]ch  :<C-u>Unite cake_helper<CR>

augroup unite_settings
  autocmd!
  " ウィンドウを分割して開く
  autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  autocmd FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  " ウィンドウを縦に分割して開く
  autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  autocmd FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  " unite.vim上でのキーマッピング
  autocmd FileType unite call s:unite_my_settings()
augroup END

function! s:unite_my_settings()
  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " ESCキーを2回押すと終了する
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction
let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <Space>search :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
" reset not it is <C-l> normally
nnoremap <Space>reset <Plug>(unite_restart)
" call unite#custom_default_action('file', 'tabopen')
