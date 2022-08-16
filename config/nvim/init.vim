" #####################################
" ### Common Setting
" #####################################
" show row number
set number
hi LineNr ctermbg=0 ctermfg=0
hi CursorLineNr ctermbg=4 ctermfg=0
set cursorline
hi clear CursorLine
set noswapfile

" tab default
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent
set smarttab

" change tab setting in case by filetypes
filetype plugin indent on

" filetype
filetype on
set fileencoding=utf-8
set ambiwidth=double

" Delete Highlight y Esc twice
nmap <ESC><ESC> ;nohlsearch<CR><ESC>
imap <silent>jj <ESC>

" Complete brackets
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap <<Enter> <><Left><CR><ESC><S-o>

" Visualize Tab, Space, Emptyline
set list
set listchars=tab:>.,trail:･,extends:>,precedes:<,nbsp:%
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

" edit
set smartindent
set showmatch                                   "閉じカッコが入力時対応するカッコを強調
set backspace=indent,eol,start                  "バックスペースで各種消せるよう
set virtualedit=block

" Search set ignorecase                         "検索時大文字小文字を区別しない
set smartcase                                   "大文字を含めた検索はその通りに検索する
set incsearch                                   "インクリメンタルサーチを行う
set nohlsearch                                  "検索結果をハイライト表示しない
set wrapscan                                    "循環検索オン
set infercase                                   "補完の際大文字小文字を区別しない nnoremap <silent> <ESC> <ESC>:noh<CR>

" Other
set wildmenu                                    "ナビゲーションバーを有効に
set tw=0                                        "自動改行オフ
set whichwrap=b,s,h,l,<,>,[,]                   "カーソル行を行頭、行末で止まらないように
set cursorline                                  "カーソル行をハイライト
set clipboard=unnamed,unnamedplus               "クリップボードをWindowsと連携する
set hidden                                      "変更中のでも保存せずで他のファイルを表示
set number                                      "行番号を表示する
set switchbuf=useopen                           "新しく開く代りイに既に開いているバッファを
set vb t_vb=                                    "ビープ音を消す
set novisualbell
set nostartofline                               "移動コマンドを使った時行頭に移動しない
set matchpairs& matchpairs+=<:>                 "<>を対応括弧ペアに
set matchtime=3                                 "対応括弧表示を3秒に
set wrap                                        "ウィンドウより長い行は折り畳む
set textwidth=0                                 "テキストの最大幅を無効に
set shiftround                                  "インデントをshiftwidthの倍数に
set history=10000                               "コマンド、検索の履歴を１万個まで
set mouse=a                                     "マウスモード有効

" #####################################
" ### dein.vim
" #####################################
set runtimepath+=$XDG_DATA_HOME/dein/repos/github.com/Shougo/dein.vim

if dein#load_state($XDG_DATA_HOME . '/dein')
    call dein#begin($XDG_DATA_HOME . '/dein')

    call dein#load_toml($XDG_CONFIG_HOME . '/nvim/dein.toml')

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif

" #####################################
" ### Tab Split settings
" #####################################
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap ; :

" #####################################
" ### Leader settings
" #####################################
let mapleader = "\<SPACE>"
nnoremap <Leader>a ggVG
nnoremap <Leader>h ^
nnoremap <Leader>l $
nnoremap <Leader>m %
nnoremap <Leader>R :%s/<C-r><C-w>//g<LEFT><LEFT>

" #####################################
" ### coc settings
" #####################################
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"


" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Close floating windows with Esc
nnoremap <Esc> :call coc#float#close_all() <CR>
