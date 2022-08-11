runtime! options.vim
runtime! keymap.vim

function! MyKeyMapsDiff()
    nnoremap <silent>J  /^[+-]<CR>
    nnoremap <silent>K  ?^[+-]<CR>
endfunction

function! MyKeyMapsHtml()
    inoremap <buffer></ </<C-x><C-o>
endfunction

augroup MyKeyMaps
    autocmd!
    autocmd FileType diff call MyKeyMapsDiff()
    autocmd FileType html call MyKeyMapsHtml()
augroup END

""" Terminal """
source $XDG_CONFIG_HOME/nvim/terminal.vim

""" Filetype """
augroup MyFileType
    autocmd!
    autocmd BufNewFile,BufRead .envrc               set filetype=sh
    autocmd BufNewFile,BufRead */git/config*        set filetype=gitconfig
    autocmd BufNewFile,BufRead */git/conf.d/*.conf  set filetype=gitconfig
    autocmd BufNewFile,BufRead .clang-format        set filetype=yaml
    autocmd BufNewFile,BufRead Brewfile             set filetype=ruby
augroup END

""" dein.vim """
set runtimepath+=$XDG_DATA_HOME/dein/repos/github.com/Shougo/dein.vim

if dein#load_state($XDG_DATA_HOME . '/dein')
    call dein#begin($XDG_DATA_HOME . '/dein')

    call dein#load_toml($XDG_CONFIG_HOME . '/nvim/dein.toml')
    "call dein#load_toml($XDG_CONFIG_HOME . '/nvim/lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif

""" Highlight """
highlight BufferCurrentSign guifg=#5faefe
highlight BufferVisibleSign guifg=#7be4a4
highlight BufferInactive    guifg=#808080 guibg=#262626
highlight BufferTabpageFill guifg=#444444 guibg=#303030
