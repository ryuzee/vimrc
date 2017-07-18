"===> Ruby関連の設定 {{{1
augroup rubytype
  autocmd!
  autocmd FileType ruby set tabstop=2 shiftwidth=2 expandtab softtabstop=2 autoindent smartindent fileencoding=utf-8
  autocmd FileType eruby set tabstop=2 shiftwidth=2 expandtab softtabstop=2 autoindent smartindent fileencoding=utf-8
  autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec    set filetype=ruby
  autocmd BufNewFile,BufRead *.builder,*.rxml,*.rjs  set filetype=ruby
  autocmd BufNewFile,BufRead [rR]akefile,*.rake      set filetype=ruby
  autocmd BufNewFile,BufRead [rR]antfile,*.rant      set filetype=ruby
  autocmd BufNewFile,BufRead .irbrc,irbrc            set filetype=ruby
  autocmd BufNewFile,BufRead .pryrc                  set filetype=ruby
  autocmd BufNewFile,BufRead *.ru                    set filetype=ruby
  autocmd BufNewFile,BufRead Capfile                 set filetype=ruby
  autocmd BufNewFile,BufRead Gemfile                 set filetype=ruby
  autocmd BufNewFile,BufRead Guardfile,.Guardfile    set filetype=ruby
  autocmd BufNewFile,BufRead Cheffile                set filetype=ruby
  autocmd BufNewFile,BufRead Berksfile               set filetype=ruby
  autocmd BufNewFile,BufRead [vV]agrantfile          set filetype=ruby
  autocmd BufNewFile,BufRead .autotest               set filetype=ruby
  autocmd BufNewFile,BufRead [tT]horfile,*.thor      set filetype=ruby
  autocmd BufNewFile,BufRead *.rabl                  set filetype=ruby
  autocmd BufNewFile,BufRead *.jbuilder              set filetype=ruby
  autocmd BufNewFile,BufRead Puppetfile              set filetype=ruby
  autocmd BufNewFile,BufRead [Bb]uildfile            set filetype=ruby
  autocmd BufNewFile,BufRead *.erb,*.rhtml           set filetype=eruby
augroup END

augroup railstype
  autocmd!
  autocmd BufEnter * if (exists("b:rails_root") && expand("%") =~ ".*\.rb$" && expand("%") !~ ".*\.erb$") | set filetype=ruby.rails | endif
  autocmd BufEnter * if (expand("%") =~ "_spec\.rb$") || (expand("%") =~ "^spec.*\.rb$") | set filetype=ruby.rspec | endif
augroup END

" vim-railsの設定 {{{
" 横着移動
nnoremap Rc :Econtroller<CR>
nnoremap Rm :Emodel<CR>
nnoremap Rv :Eview<CR>
" }}}

"<=== Ruby関連の設定ここまで}}}

