"""""""""
" vimwiki
"""""""""
let path = '~/Documents/wiki'
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': path, 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Makes vimwiki markdown links as [text](text.md) instead of [text](text)
let g:vimwiki_markdown_link_ext = 1

let g:taskwiki_markup_syntax = 'markdown'
let g:markdown_folding = 1
