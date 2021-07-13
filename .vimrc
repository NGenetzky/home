
" ~/.vimrc in [home](https://github.com/ngenetzky/home/)
" Maintainer:   Nathan Genetzky
" Version:      1.0

""" plugin manager
"*******************************************************************************

if filereadable(expand('~/.vim/autoload/plug.vim'))
    " Specify a directory for plugins
    " - For Neovim: ~/.local/share/nvim/plugged
    " - Avoid using standard Vim directory names like 'plugin'
    call plug#begin(expand('~/.local/share/vim-plug/plugged')

    Plug 'tpope/vim-sensible'

    Plug 'vim-airline/vim-airline-themes'
    Plug 'kergoth/vim-bitbake'
    "fugitive.vim: a Git wrapper so awesome, it should be illegal.
    Plug 'tpope/vim-fugitive'

    " comment stuff out
    Plug 'tpope/vim-commentary'
    " speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more
    Plug 'tpope/vim-speeddating'
    " quoting/parenthesizing made simple
    Plug 'tpope/vim-surround'
    " enable repeating supported plugin maps with "."
    Plug 'tpope/vim-repeat'
    " easily search for, substitute, and abbreviate multiple variants of a word
    Plug 'tpope/vim-abolish'
    " Vim Markdown runtime files
    Plug 'tpope/vim-markdown'
    Plug 'tpope/vim-obsession'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-sensible'

    " Vim syntax for TOML
    Plug 'cespare/vim-toml'

    " A small Vim plugin with a set of helpers for Hugo https://gohugo.io
    Plug 'robertbasic/vim-hugo-helper'

    Plug 'pearofducks/ansible-vim'
    Plug 'altercation/vim-colors-solarized'
    if filereadable(expand('~/.config/editor-vim/plugins.vim'))
      source ~/.config/editor-vim/plugins.vim
    endif

    " Initialize plugin system
    call plug#end()
endif

" plugins
"*******************************************************************************

""" plugin_settings
"*******************************************************************************

try 
  colorscheme solarized
  let g:solarized_termtrans = 1

  catch
  try 
    colorscheme peachpuff
    catch
  endtry
endtry

let g:formatter_yapf_style = 'pep8'

if filereadable(expand('~/.config/editor-vim/plugin_settings.vim'))
  source ~/.config/editor-vim/plugin_settings.vim
endif
" plugin_settings
"*******************************************************************************

""" vim_settings {
"*******************************************************************************

" Initial settings from github.com/rstacruz/vim-opinion.

"
" Options
"

set history=50                  "hi:    keep 50 lines of command line history
set ruler                       "ru:    show the cursor position all the time
set showcmd                     "sc:    display incomplete commands
set hidden                      "hid:   don't care about closing modified buffers
set winminheight=0              "wmh:   allow showing windows as just status bars
set mouse=a                     "       Enable the use of a mouse
set nowrap                      "       soft-wrapping is off by default

"
" Folding
"

set foldmethod=syntax           "fdm:   fold by the indentation by default
set foldnestmax=10              "fdn:   deepest fold is 10 levels
set nofoldenable                "nofen: don't fold by default
set foldlevel=1

"
" Search
"

set incsearch                   "is:    automatically begins searching as you type
set ignorecase                  "ic:    ignores case when pattern matching
set smartcase                   "scs:   ignores ignorecase when pattern contains uppercase characters
set hlsearch                    "hls:   highlights search results; ctrl-n or :noh to unhighlight
set gdefault                    "gd:    Substitute all matches in a line by default

"
" Programming
"

syntax on                       "syn:   syntax highlighting
set cindent                     "cin:   enables automatic indenting c-style
set cinoptions=l1,j1            "cino:  affects the way cindent reindents lines
set showmatch                   "sm:    flashes matching brackets or parenthasis
set matchtime=3                 "mat:   How long to flash brackets

"
" Tabs
"

set tabstop=4                   "ts:    number of spaces that a tab renders as
set shiftwidth=4                "sw:    number of spaces to use for autoindent
set softtabstop=4               "sts:   number of spaces that tabs insert
set smarttab                    "sta:   helps with backspacing because of expandtab
set expandtab                   "et:    uses spaces instead of tab characters

"
" Backups
"

set nobackup                    "nobk:  in this age of version control, who needs it
set nowritebackup               "nowb:  don't make a backup before overwriting
set noswapfile                  "noswf: don't litter swap files everywhere
set directory=/tmp              "dir:   directory for temp files

"
" Hud and status info
"

set number                      "nu:    numbers lines
set numberwidth=5               "nuw:   width of number column
set showmode                    "smd:   shows current vi mode in lower left
set cmdheight=1                 "ch:    make a little more room for error messages
set scrolloff=4                 "so:    places a couple lines between the current line and the screen edge
set sidescrolloff=2             "siso:  places a couple lines between the current column and the screen edge
set laststatus=2                "ls:    makes the status bar always visible
set ttyfast                     "tf:    improves redrawing for newer computers
set lazyredraw                  "lz:    will not redraw the screen while running macros (goes faster)

"
" Encryption
"

if has('cryptv')
  if v:version > 704 || v:version == 704 && has('patch399')
    set cryptmethod=blowfish2   "cm:    make encryption the most secure
  elseif v:version >= 703
    set cryptmethod=blowfish    "cm:    make encryption more secure than pkzip
  endif
endif

if has('linebreak')
  try
    set breakindent             "bri:   visually indent wrapped lines
    let &showbreak='↳'
  catch /E518:/
    " Unknown option: breakindent
  endtry
endif

"
" Menu compilation
"

set wildmenu                    "wmnu:  enhanced ed command completion
set wildignore+=*.~             "wig:   ignore compiled objects and backups
set wildignore+=*.o,*.obj,*.pyc
set wildignore+=.sass-cache,tmp
set wildignore+=node_modules
set wildignore+=log,logs
set wildignore+=vendor
set wildmode=longest:full,list:full

"
" Visual
"

set background=dark

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

if filereadable(expand('~/.config/editor-vim/vim_settings.vim'))
  source ~/.config/editor-vimvim_settings.vim
endif
" } vim_settings
"*******************************************************************************

""" modelines
" https://vi.stackexchange.com/a/3820
" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^""'?'>'.(matchend(getline(v\:lnum),'""*')-2)\:'='
