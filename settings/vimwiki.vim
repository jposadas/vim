"""""""""
" vimwiki
"""""""""
let path = '~/Library/Mobile Documents/com~apple~CloudDocs/wiki'
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': path, 'syntax': 'markdown', 'ext': '.md'}]

function ToggleCalendar()
    execute ":Calendar"
    if exists("g:calendar_open")
        if g:calendar_open == 1
            execute "q"
            unlet g:calendar_open
        else
            g:calendar_open == 1
        end
    else
        let g:calendar_open = 1
    end
endfunction
