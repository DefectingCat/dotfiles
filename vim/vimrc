" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

let mapleader = " "

" Security
set modelines=0

" Show line numbers
set number
set relativenumber

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
" set visualbell
set cursorline

" Encoding
set encoding=utf-8

" Whitespace
set nowrap           " do not automatically wrap on load
set formatoptions-=t " do not automatically wrap text when typing
" set tabstop=2
" set shiftwidth=2
" set softtabstop=2
" set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk
" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search
" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>
" Textmate holdouts

" Others
" https://vi.stackexchange.com/questions/22547/how-to-prevent-vim-from-making-a-flashy-screen-effect-when-pressing-esc-or
set belloff=esc

" Formatting
map <leader>q gqip
" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
" map <leader>l :set list!<CR> " Toggle tabs and EOL
" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
colorscheme nord

" Mapping
map <leader>e :Ex<CR> " Open local-directory browser
noremap - :Ex<CR> " Open local-directory browser
tnoremap <C-x> <C-\><C-n> " test
"" siwtch window
map <C-j> <C-w>j
tnoremap <C-j> <C-w>j
map <C-k> <C-w>k
tnoremap <C-k> <C-w>k
map <C-h> <C-w>h
tnoremap <C-h> <C-w>h
map <C-l> <C-w>l
tnoremap <C-l> <C-w>l
"" https://stackoverflow.com/questions/5933568/disable-blinking-at-the-first-last-line-of-the-file
noremap <expr> k ((line('.')==1)?'':'k')
noremap <expr> j ((line('.')==line('$'))?'':'j')
"" term
noremap <leader>tt :term ++curwin<CR>
"" buffer
noremap <S-l> :bn<CR>
noremap <S-h> :bp<CR>
noremap <leader>x :bd<CR>
"" save
noremap <C-s> :w<CR>
