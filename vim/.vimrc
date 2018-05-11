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
Plugin 'skroll/vim-taghighlight'

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
set t_Co=256

"let g:ycm_global_ycm_extra_conf='/home/aydenlin/.vim/bundle/youcompleteme/.ycm_extra_conf.py'
let g:ycm_enable_diagnostic_signs=0
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_show_diagnostics_ui=0


if ! exists('g:TagHighlightSettings')
    let g:TagHighlightSettings = {}
endif
let g:TagHighlightSettings['ForcedPythonVariant'] = 'if_pyth'
let g:TagHighlightSettings['CtagsExecutable'] = 'ctags'


" mapping
nmap <S-t> :NERDTreeToggle<CR>
nmap <S-s> :TagbarToggle<CR>
nmap <S-h> :exe "silent !ctags --fields=+l -R ." \| UpdateTypesFileOnly  \|redraw!<CR> 
nmap <C-x> :q<CR>
nmap <C-r> :w<CR>
