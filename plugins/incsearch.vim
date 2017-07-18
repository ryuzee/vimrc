" incsearch.vim / インクリメンタル検索の機能改善
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
map zz/ <Plug>(incsearch-easymotion-/)
map zz? <Plug>(incsearch-easymotion-?)
map zzg/ <Plug>(incsearch-easymotion-stay)

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction
" <Space> + / でいい感じに曖昧に検索してeasy-motionで移動できるようになる!
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

