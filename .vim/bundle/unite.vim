let g:unite_source_file_mru_limit = 200
let g:unite_source_file_mru_filename_format = ""

nnoremap [unite] <Nop>
nmap f [unite]

nnoremap <silent> [unite]j :<C-u>Unite -buffer-name=files -start-insert buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]k :<C-u>UniteWithBufferDir -buffer-name=files -start-insert buffer file_mru bookmark file<CR>

function! s:unite_settings()
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

autocmd FileType unite call s:unite_settings()

function! s:ExecuteCommandOnCR(command)
  if &buftype == ''
    execute a:command
  else
    call feedkeys("\r", 'n')
  endif
endfunction

nnoremap <silent> <CR> :<C-u>call <SID>ExecuteCommandOnCR('Unite -buffer-name=files buffer_tab')<CR>