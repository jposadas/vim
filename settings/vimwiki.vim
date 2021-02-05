"""""""""
" vimwiki
"""""""""
let path = '~/Library/Mobile Documents/com~apple~CloudDocs/wiki'
let g:vimwiki_list = [{'path': path, 'syntax': 'markdown', 'ext': '.md'}]

au FileType vimwiki setlocal shiftwidth=6 tabstop=6 noexpandtab

