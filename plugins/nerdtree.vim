nnoremap <silent><C-c> :NERDTreeCWD<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>

let g:NERDTreeIndicatorMap = {
  \ "Modified"  : "[*] ",
  \ "Staged"    : "[s] ",
  \ "Untracked" : "[-] ",
  \ "Renamed"   : "[r] ",
  \ "Unmerged"  : "[u] ",
  \ "Deleted"   : "[D] ",
  \ "Dirty"     : "[d] ",
  \ "Clean"     : "[c] ",
  \ "Unknown"   : "[?] "
\ }
let g:nerdtree_tabs_open_on_gui_startup = 0
