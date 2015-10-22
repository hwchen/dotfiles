scriptencoding utf-8
set encoding=utf-8

set nocompatible    " Use Vim instead of Vi settings
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler           " Show cursor position all the time
set showcmd         " Display incomplete commands
set incsearch       " Do incremental searching
set autowrite       " Automatically :write before running commands
set scrolloff=5

" Pathogen

execute pathogen#infect()
syntax on
filetype plugin indent on

" Color Scheme

syntax enable
highlight clear SignColumn
" set highlight clear SignColumn
" set background=dark
" colorscheme solarized
" if $COLORTERM == 'gnome-terminal'
"      set t_Co=256
"  endif
" let g:solarized_termcolors=256

" JShint turn off highlighting

" let g:JSHintHighlightErrorLine=0

" Title bar
set title
set titlestring=%F

" Indent Lines plugin

let g:indentLine_enabled = 0

" Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ["jshint"]

" To get node modules path, because nvm
"if $PATH !~ "\.nvm"
"    let $PATH="/home/hwchen/.nvm/v0.10.38/bin:" . $PATH
"endif


"------------------------------------------------------
"keyboard mappings

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

inoremap jk <esc>

inoremap <c-o> <esc>:tabe 
noremap <c-o> <esc>:tabe 

inoremap <c-h> <esc>:tabp<cr>
noremap <c-h> <esc>:tabp<cr>

inoremap <c-l> <esc>:tabn<cr>
noremap <c-l> <esc>:tabn<cr>

inoremap <c-b> <esc>:w !python<cr>
noremap <c-b> <esc>:w !python<cr>

inoremap <c-s> <esc>:w<cr>
noremap <c-s> <esc>:w<cr>

noremap <leader>t <esc>:IndentLinesToggle<cr>

highlight TabLineFill ctermfg=Black
highlight TabLineSel ctermbg=Black ctermfg=Gray
highlight TabLine ctermbg=Black ctermfg=DarkBlue

"------------------------------------------------------
"Indentation options (PEP8 style)

"set textwidth=89   "lines longer than 79 columns broken
set shiftwidth=4   "operation >> indents 4 columns; << unindents 4
set tabstop=8      "a hard TAB displays as 8 columns
set expandtab      "insert spaces when hitting TABs
set softtabstop=4  "insert/delete 4 spaces when hitting TAB/BACKSPACE
set shiftround     "round indent to mulitple of 'shiftwidth'
set autoindent     "align the new line indent with previous line
set number         "show line numbers

" Display extra whitespace
set list listchars=tab:»·,trail:·

" force markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" two space tabs for js
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
autocmd FileType yaml :setlocal sw=2 ts=2 sts=2

" Change parens highlighting
hi MatchParen cterm=bold ctermbg=black ctermfg=yellow

"JSDoc plugin

"let g:jsdoc_allow_input_prompt = 1
"let g:jsdoc_input_description = 1
