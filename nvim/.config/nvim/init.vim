"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'

Plug 'scrooloose/nerdcommenter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'Shougo/neoinclude.vim'
Plug 'w0rp/ale'

Plug 'arakashic/chromatica.nvim'

" Plug 'jiangmiao/auto-pairs'


" Plug 'neomake/neomake'

Plug 'fugalh/desert.vim'
Plug 'joshdick/onedark.vim'
call plug#end()


" airline
let g:airline_powerline_fonts = 1
" deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
" deoplete-clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
" chromatica
let g:chromatica#libclang_path='/usr/lib/libclang.so'
let g:chromatica#enable_at_startup=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=70

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "
let g:mapleader = " "

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
" command W w !sudo tee % > /dev/null

" Quick save and other commands
let g:mp=":!gcc % -o %< <CR>"
map <Space>` :w<CR>
map <Space>w <C-w>
map <Space>d :terminal<CR>
"map <F5> :w<CR>:!gcc<space>%<space>-o<space>%<<CR>
"map <F6> :botright<Space>vspl<CR>:terminal<Space>gdb<Space>./%<<CR>
"map <F9> :botright<Space>vspl<CR>:terminal<Space>./%<<CR>
map <F5> :w<CR>:!gcc<space>%<space>-o<space>%<<CR>:botright<Space>vspl<CR>:terminal<Space>gdb<Space>./%<<CR>
map <F9> :w<CR>:!gcc<space>%<space>-o<space>%<<CR>:botright<Space>vspl<CR>:terminal<Space>./%<<CR>
nnoremap <CR> <NOP>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Enable 24 bit color support in nvim
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif

" colorschemes = onedark, desert
try
     colorscheme onedark
catch
endtry
set background=dark

" Enable syntax highlighting
syntax enable 
syntax on

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" change bg to something better
highlight Normal guibg=#020202

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
" set nobackup
" set nowb
" set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Useful settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" save cursor position on exit
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
