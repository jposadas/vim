let g:fzf_layout = {'down': '~20%'}
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

silent! !git rev-parse --is-inside-work-tree
if v:shell_error == 0
    nnoremap <C-p> :GFiles<CR>
else
    nnoremap <C-p> :Files<CR>
endif

