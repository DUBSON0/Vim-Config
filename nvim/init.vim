"_______  _______ _________          _______  _______          _________ _______
"(  ___  )(  ____ \\__   __/|\     /|(  ____ \(  ____ )|\     /|\__   __/(       )
"| (   ) || (    \/   ) (   | )   ( || (    \/| (    )|| )   ( |   ) (   | () () |
"| (___) || (__       | |   | (___) || (__    | (____)|| |   | |   | |   | || || |
"|  ___  ||  __)      | |   |  ___  ||  __)   |     __)( (   ) )   | |   | |(_)| |
"| (   ) || (         | |   | (   ) || (      | (\ (    \ \_/ /    | |   | |   | |
"| )   ( || (____/\   | |   | )   ( || (____/\| ) \ \__  \   /  ___) (___| )   ( |
"|/     \|(_______/   )_(   |/     \|(_______/|/   \__/   \_/   \_______/|/     \|

" ---- Basic Settings ----------------------------------------------------------
set autochdir                              " cd to the working dir of the open file
set autoindent                             " copy indent from current line to new line
set autowrite                              " auto save on some specific commands
set breakindent                            " wrapped lines will continue being indented
set breakindentopt=shift:2,min:40,sbr      " see options.txt
set clipboard+=unnamedplus                  " place yanked text in global clipboard
set concealcursor=""                       " set mode in which cursor line is also concealed
set conceallevel=1                         " vim's conceal
set confirm                                " ?
set encoding=utf-8                         " for vim-devicons
set expandtab shiftwidth=2 smarttab        " ?
set ignorecase incsearch                   " searching and highlighting
set linebreak                              " text wrap won't break words
set mouse=a                                " enable mouse in all modes
set nocompatible                           " no vi compatibility
set number relativenumber                  " line numbers
set ruler                                  " show line and column number of cursor
set scrolloff=0                            " lines above/below cursor when scrollng
set shell=/bin/bash                        " set default shell
set showcmd                                " show key strokes at bottom right
set showbreak=>>                           " chars to put infront of wrapped lines
set splitbelow splitright                  " new splits on bottom and right
set tabstop=4 softtabstop=0                " tab settings
set textwidth=120                          " max text width before wrapping
set timeoutlen=300 ttimeoutlen=300         " timeout for keybind presses
set updatetime=30                          " write to swap if nothing typed (vim-gitgutter)
set wildmenu wildmode=longest:full,full    " great command-line completion, tab to move, enter to validate

" Change cursor shape
let &t_EI = "\<Esc>[2 q"                  " insert mode, block
let &t_SR = "\<Esc>[4 q"                  " replace mode, underscore
let &t_EI = "\<Esc>[2 q"                  " normal mode, block

" add cursorline when not in insert mode
"augroup cursorLine
"autocmd!
"autocmd VimEnter * set cul
"autocmd InsertLeave * set cul
"autocmd InsertEnter * set nocul
"augroup END

syntax enable                             " enable syntax
filetype plugin indent on                 " enable filetype detection with ftplugin.vim and indent.vim
hi clear SpellBad                         " turn off highlighting on misspelled words
hi SpellBad cterm=underline


" ---- Plugins -----------------------------------------------------------------
let g:python3_host_prog = '/usr/bin/python3'
call plug#begin('~/.vim/plugged/')
" Status bar {
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" }
" Visuals/syntax {
Plug 'thaerkh/vim-indentguides'
Plug 'flazz/vim-colorschemes'
Plug 'luochen1990/rainbow'                  " bracket coloring
Plug 'ap/vim-css-color'
Plug 'sheerun/vim-polyglot'                 " Syntax highlighting
Plug 'vim-autoformat/vim-autoformat'
" }
" Quality of Life {
Plug 'ryanoasis/vim-devicons'               " fancy icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'psliwka/vim-smoothie'                 " smooth scrolling done right
" }
" Lsp stuff
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'averms/black-nvim' , {'do': ':UpdateRemotePlugins'}
Plug 'lervag/vimtex'
" Html
Plug 'mattn/emmet-vim'
" UltiSnips for snippets
Plug 'sirver/ultisnips'
" LaTeX snippets for Vim using UltiSnips (downloads only tagged releases)
Plug 'ckunte/latex-snippets-vim', { 'tag': '*' }
call plug#end()

" ---- Plugin Settings ---------------------------------------------------------
" Autoformat
au BufWrite * :Autoformat
let g:formatters_python = ["black"]
"let g:formatdef_my_python = '"black --line-length 80"'
autocmd FileType snippets let b:autoformat_autoindent=0

" Airline {
" stops other insert modes from showing
let g:airline_mode_map = {}
let g:airline_mode_map['ic'] = 'INSERT'
" display all buffers if one tab open
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1  " buffer/tab number
let g:airline#extensions#tabline#buffer_idx_mode = 1
" how file paths are shown (they're not)
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1             " powerline integration
let g:airline_theme='onedark'               " status bar theme
let g:airline#extensions#tagbar#enabled = 1   " show where in file you are
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#coc#enabled = 1
let g:airline_detect_modified = 0             " stop color change of filepath
let g:airline_section_c = airline#section#create(["%{expand('%:p:~:h:h:t')}/%{expand('%:p:h:t')}/%{expand('%:t')}"])
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.modified = ''
" }
" Rainbow brackets {
let g:rainbow_active = 1
" }

" Vimtex
filetype plugin indent on
syntax enable
let g:vimtex_compiler_method= 'latexmk'
let g:vimtex_view_method= 'sioyek'
let maplocalleader = ","

"
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" Ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" ---- Keybindings -------------------------------------------------------------
" Quality of life {
inoremap jk <Esc>
nnoremap j gj
nnoremap k gk
" close all buffers
nnoremap ZX :wqa<CR>
nnoremap S :%s///g<Left><Left><Left>
" Shift-Tab to remove indentation
inoremap <s-tab> <Esc><<i
" }

" Sane buffer navigation {
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <s-l> :vertical resize +5 <Cr>
map <s-h> :vertical resize -5 <Cr>
map <s-k> :resize +5 <Cr>
map <s-j> :resize -5 <Cr>
" }
" Jump to last postion when opening file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" fixes lag of exiting insert/visual mode
if !has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    autocmd InsertEnter * set timeoutlen=0
    autocmd InsertLeave * set timeoutlen=300
  augroup END
endif

:luafile /home/aether/.config/nvim/lspConfig.lua

