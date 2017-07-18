" vim-automatic / ウィンドウをごにょごにょ楽に操作する
nnoremap <silent> <plug>(quit) :<c -u>q<cr>
" 新しいウィンドウは <ESC><ESC> で閉じれるようにする
function! s:my_temporary_window_init(config, context)
  silent! nunmap <ESC><ESC>
  nmap <buffer> <C-[> :<C-u>q<CR>
  nmap <buffer> <ESC> :<C-u>q<CR>
endfunction

if has('gui_running')
  let g:automatic_default_match_config = {
    \   'is_open_other_window' : 1,
    \ }
  let g:automatic_default_set_config = {
    \   'height' : '20%',
    \   'move' : 'bottom',
    \   'apply' : function('s:my_temporary_window_init')
    \ }
  let g:automatic_config = [
    \   { 'match' : { 'buftype' : 'help' } },
    \   { 'match' : { 'filetype' : 'eblook' } },
    \   { 'match' : { 'filetype' : 'gitcommit' } },
    \   { 'match' : { 'bufname' : 'gissues/*' } },
    \   { 'match' : { 'bufname' : 'swoopBuf' } },
    \   { 'match' : { 'bufname' : '^.vimshell' } },
    \   { 'match' : {
    \        'bufname' : '^.unite'
    \      },
    \     'set' : {
    \       'move' : 'top',
    \       'width' : 8
    \     }
    \   },
    \   {
    \     'match' : {
    \       'filetype' : 'ref-webdict',
    \       'autocmds' : [ 'FileType' ]
    \     },
    \     'set' : {
    \       'move' : 'bottom',
    \       'width' : '100%',
    \       'height' : 20
    \     }
    \   },
    \   {
    \     'match' : {
    \       'bufname' : 'Tagbar',
    \       'autocmds' : [ 'FileType' ]
    \     },
    \     'set' : {
    \       'move' : 'right',
    \       'height' : '100%',
    \       'width' : 60
    \     }
    \   },
    \   {
    \     'match' : {
    \       'bufname' : '\[quickrun output\]',
    \     },
    \     'set' : {
    \       'height' : 8,
    \     }
    \   },
    \   {
    \     'match' : {
    \       'autocmds' : [ 'CmdwinEnter' ]
    \     },
    \     'set' : {
    \       'is_close_focus_out' : 1,
    \       'unsettings' : [ 'move', 'resize' ]
    \     },
    \   }
    \ ]
endif
