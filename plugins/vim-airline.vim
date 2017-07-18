" vim-airline / ステータスラインをいい感じにする
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 0
let g:airline_left_sep = '⮀'
let g:airline_right_sep = '⮂'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⭠ '
let g:airline#exclude_filenames = ['NERD_Tree_1']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '>'
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮀'
let g:airline#extensions#readonly#symbol = '⭤ '
let s:sep = " %{get(g:, 'airline_right_alt_sep', '')} "
let g:airline_section_x =
        \ "%{strlen(&fileformat)?&fileformat:''}".s:sep.
        \ "%{strlen(&fenc)?&fenc:&enc}".s:sep.
        \ "%{strlen(&filetype)?&filetype:'no ft'}"
let g:airline_section_y = '%3p%%'
let g:airline_section_z = '%{g:char_counter_count} chars '.get(g:, 'airline_linecolumn_prefix', 'L').'%3l:%-2v'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#filetypes = '\vhelp|markdown|rst|org|text|asciidoc|tex|mail|vim'
