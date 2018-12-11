"===> Terraform関連の設定 {{{1
augroup terraformtype
  autocmd!
  autocmd FileType terraform set tabstop=2 shiftwidth=2 expandtab softtabstop=2 autoindent smartindent fileencoding=utf-8
  autocmd BufNewFile,BufRead *.tf,*.tfvars,*.tfvars.template    set filetype=terraform
augroup END

"<=== Terraform関連の設定ここまで}}}

