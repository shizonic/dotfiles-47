﻿set title

set showmatch
set ignorecase
set incsearch
set hlsearch
set bs=2
set nobackup
set noswapfile

set clipboard=unnamedplus

" make tab work as 4 spaces in a file
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set autoindent
"set shiftround

let mapleader=" "
let maplocalleader=","

call plug#begin('~/.local/share/nvim/plugged')

" application specific
Plug 'lervag/vimtex'
Plug 'jceb/vim-orgmode'
Plug 'itchyny/calendar.vim'
Plug 'daeyun/vim-matlab'
Plug 'sophacles/vim-processing'
Plug 'davidhalter/jedi-vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" syntax
"Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'Guzzii/python-syntax'

" airline
Plug 'vim-airline/vim-airline'
Plug 'khatiba/vim-airline-themes'

" file finder
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'

" git
Plug 'tpope/vim-fugitive'

" visual
Plug 'thaerkh/vim-indentguides'
Plug 'owickstrom/vim-colors-paramount'
Plug 'chriskempson/base16-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'lucasprag/simpleblack'
Plug 'atweiden/vim-colors-miro8'
Plug 'joshdick/onedark.vim'

"sudo
Plug 'lambdalisue/suda.vim'

call plug#end()

filetype plugin indent on

" visual settings
syntax on
set relativenumber
set number
set colorcolumn=80
" not needed with airline
set ruler

set termguicolors
colorscheme onedark
hi Normal guibg=NONE
highlight Comment cterm=italic gui=italic

let g:rehash256 = 1
set t_Co=256

" better syntax for python
let python_highlight_all = 1
let g:polyglot_disabled = ['python']

" vimtex + custom syntax changes to folds and .tex files
let g:vimtex_view_method = 'zathura'
set foldmethod=expr
set foldexpr=vimtex#fold#level(v:lnum)
set foldtext=vimtex#fold#text()
" hi Folded guibg=#151515
" hi texSection guifg=#e1a3ee
" hi texZoneListings guifg=#6fc2ef
" hi texBeginEndName guifg=#6fc2ef
" hi texSectionZone guifg=#6fc2ef
" hi texSubSectionZone guifg=#acc267
autocmd FileType tex setlocal spell spelllang=en_gb

" calendar
let g:calendar_google_calendar = 1
let g:calendar_date_full_month_name = 1
let g:calendar_event_start_time_minwidth = 0

" vim-airline
let g:airline_theme = 'minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#syntastic#enabled = 1

" indent
let g:indentguides_spacechar = '|'
let g:indentguides_tabchar = '┆'

"" jedi-vim
let g:jedi#popup_on_dot = 0
autocmd FileType python setlocal completeopt-=preview

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1
let g:syntastic_python_checkers=['python', 'flake8']

let g:deoplete#enable_at_startup = 1

" orgmode
nmap <S-l> <Plug>OrgTodoForward
nmap <S-h> <Plug>OrgTodoBackward
nmap <S-k> <Plug>OrgMoveSubtreeUpward
nmap <S-j> <Plug>OrgMoveSubtreeDownward
let g:org_aggressive_conceal = 1
let g:org_indent = 1
let g:org_heading_shade_leading_stars = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMapOpenSplit='s'
let NERDTreeMapOpenVSplit='v'


" Tabs
nnoremap <silent> <C-t> :tabnew<CR>
nnoremap <Tab>   gt
"nnoremap <S-Tab> gT

" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Close buffer
noremap <C-c> <C-w>c

" hit esc to clear search
nnoremap <silent> <esc> :noh<cr><esc>
" leader R to replace word under *
nnoremap <Leader>r :%s///g<Left><Left>

let g:suda_smart_edit = 1
