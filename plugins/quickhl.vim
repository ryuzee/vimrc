" quickhlの設定 / 文字列をいい感じに簡単にハイライトする
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
nmap <Space>j <Plug>(quickhl-cword-toggle)
nmap <Space>] <Plug>(quickhl-tag-toggle)
map H <Plug>(operator-quickhl-manual-this-motion)
let g:quickhl_manual_enable_at_startup = 1
let g:quickhl_manual_keywords = [
  \ "TODO",
  \ "FIXME",
  \ ]
