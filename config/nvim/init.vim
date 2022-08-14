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
" ### Leader Setting
" #####################################
let mapleader = "\<SPACE>"
nnoremap <Leader>a ggVG
nnoremap <Leader>h ^
nnoremap <Leader>l $
nnoremap <Leader>m %
nnoremap <Leader>R :%s/<C-r><C-w>//g<LEFT><LEFT>

" #####################################
" ### dein.vim
" #####################################
set runtimepath+=$XDG_DATA_HOME/dein/repos/github.com/Shougo/dein.vim

if dein#load_state($XDG_DATA_HOME . '/dein')
    call dein#begin($XDG_DATA_HOME . '/dein')

    call dein#load_toml($XDG_CONFIG_HOME . '/nvim/dein.toml', {'lazy': 0})
    call dein#load_toml($XDG_CONFIG_HOME . '/nvim/lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif
