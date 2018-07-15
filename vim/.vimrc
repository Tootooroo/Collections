set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'valloric/youcompleteme'
Plugin 'TagHighlight'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'chiel92/vim-autoformat'
Plugin 'raimondi/delimitmate'
Plugin 'honza/vim-snippets'
Plugin 'sirver/ultisnips'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this
" line
syntax enable
set background=dark
colorscheme solarized

set number
set mouse=a
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set completeopt-=preview

"let g:ycm_global_ycm_extra_conf='/home/aydenlin/.vim/bundle/youcompleteme/.ycm_extra_conf.py'
let g:ycm_enable_diagnostic_signs=0
let g:ycm_add_preview_to_completeopt=0
"let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_show_diagnostics_ui=0

" TagHightlight
if ! exists('g:TagHighlightSettings')
    let g:TagHighlightSettings = {}
endif
let g:TagHighlightSettings['ForcedPythonVariant'] = 'python'
let g:TagHighlightSettings['CtagsExecutable'] = 'ctags'

" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled = 1
let g:airline_theme = 'solarized'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" NERDTree
let g:NERDTreeMinimalUI=1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 0

" Autoformat
nmap <C-t> :Autoformat<CR> 

" snippet
let g:UltiSnipsExpandTrigger="<C-j>"

" mapping
nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
nmap <C-l> :exe "silent !ctags --fields=+l -R ." \| UpdateTypesFileOnly  \| redraw!<CR> 
nmap <C-x> :q<CR>
nmap <C-r> :w<CR>


