" ref-dicts-en / 辞書を引けるようにする(vim-refが必要) {{{2
let g:ref_source_webdict_sites = {
\   'wiki': {
\     'url': 'http://ja.wikipedia.org/wiki/%s',
\   },
\   'en' : {
\     'url' : 'http://ejje.weblio.jp/content/%s'
\   }
\ }
function! g:ref_source_webdict_sites.en.filter(output)
  return join(split(a:output, "\n")[75 :], "\n")
endfunction

function! g:ref_source_webdict_sites.wiki.filter(output)
  return join(split(a:output, "\n")[17 :], "\n")
endfunction

" デフォルトサイト
let g:ref_source_webdict_sites.default = 'en'
nnoremap <silent> en :<C-u>call ref#jump('normal', 'webdict')<CR>
vnoremap <silent> en :<C-u>call ref#jump('visual', 'webdict')<CR>
" }}}
