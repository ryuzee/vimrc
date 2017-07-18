" 文字数
if !exists('g:char_counter_count')
  let g:char_counter_count = 0
endif

augroup char_counter
  autocmd!
  autocmd BufCreate,BufEnter * call s:char_counter_initialize()
  autocmd BufNew,BufEnter,BufWrite,InsertLeave * call s:char_counter_update()
augroup END

function! s:char_counter_initialize()
  if !exists('g:char_counter_count')
    let g:char_counter_count = 0
  endif
endfunction

function! s:char_counter_update()
  let g:char_counter_count = s:char_counter()
endfunction

function! s:char_counter()
  let result = 0
  for linenum in range(0, line('$'))
    let line = getline(linenum)
    let result += strlen(substitute(line, '.', 'x', 'g'))
  endfor
  return result
endfunction
