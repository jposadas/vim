let g:go_gopls_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
" go_fmt_autosave causes vim-go to reload the buffer on save and break coc.nvim:
" https://gitter.im/neoclide/coc.nvim?at=5ed02830a91f120a6cceeb6c
" https://github.com/neoclide/coc.nvim/issues/53
let g:go_fmt_autosave = 0 
" let g:go_def_mode = 'gopls' " using coc.nvim instead

" nnoremap <S-F6> :GoRename<CR>
" nnoremap <F7> :GoReferrers<CR>
" nnoremap <A-F7> :GoReferrers<CR>
" nnoremap <F02> :GoDeclsDir<CR>

" let g:go_highlight_functions = 1
" let g:go_highlight_function_parameters = 1
" let g:go_highlight_format_strings = 1

let g:go_fold_enable = []
let g:go_highlight_string_spellcheck = 0
let g:go_highlight_format_strings = 0
let g:go_highlight_diagnostic_errors = 0
let g:go_highlight_diagnostic_warnings = 0

