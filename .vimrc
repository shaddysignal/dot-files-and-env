" All hail pathogen
execute pathogen#infect()
execute pathogen#helptags()

syntax on
filetype plugin indent on
set nocompatible
set nu
set shiftwidth=3
set tabstop=3
set smarttab
set expandtab
set autoindent
set incsearch
set hlsearch
set list

" Kind of home and end keys (Ctrl-a and Ctrl-e respectivly), only in insert
" modes
imap <C-a> <C-o>^
imap <C-e> <C-o>$

set background=dark
colorscheme solarized
let g:solarized_termcolors=256

let g:airline_powerline_fonts=1

" allow unsaved background buffers
set hidden
set history=10000
" search by case sensitive query(only if it have uppercase character)
set ignorecase smartcase
" For buffer of vim  print to console window
" http://www.shallowsky.com/linux/noaltscreen.html(?)
" set t_ti= t_te=
" More context while scroll off end of the buffer
set scrolloff=3
" Backup in certian spot
set backup
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp
" Completion like in bash
set wildmenu
let mapleader=","
set timeout timeoutlen=1000 ttimeoutlen=1000

autocmd FileType javascript set ai sw=2 sts=2 et

autocmd FileType ruby,haml,sass,coffee,cucumber,yaml set ai sw=2 sts=2 et

" For rubycomplete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FIleType ruby,eruby let g:rubycomplete_buffer_loading=1
autocmd FIleType ruby,eruby let g:rubycomplete_rails=1
autocmd FIleType ruby,eruby let g:rubycomplete_classes_in_global=1
" Better autocomlete menu
hi Pmenu ctermbg=238 gui=bold

" Status line with ruby version for ruby files
" autocmd FileType ruby,eruby set statusline=%t%{rvm#statusline()}%m

" What is this? Variables from rainbow_parentheses plugin
" What they mean? I don't know
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkgray',    'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Variables for ctrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)|node_modules$'

" From http://damienradtke.com/vim-view-rustdoc
let s:pathsep = ':' | let s:sep = '/'
for p in split(&rtp, ',')
	let $PATH .= s:pathsep . p . s:sep . 'tools'
endfor

" From https://github.com/kchmck/vim-coffee-script
" autocmd BufWritePost *.coffee silent make
