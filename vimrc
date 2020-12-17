set nocompatible              " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" <============================================>
" Specify the plugins you want to install here.
" <============================================>

" Filesystem
Plugin 'scrooloose/nerdtree'
" Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'

" Simply fold
" Plugin 'tmhedberg/SimpylFold'

"python sytax checker
" Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
" Plugin 'nvie/vim-flake8'

"auto-completion stuff
" Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'

" supertab completion
Plugin 'ervandew/supertab'

"Colors!!!
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'jnurmine/Zenburn'
" Monokai light color scheme
Plugin 'patstockwell/vim-monokai-tasty'

" Plugin 'stephpy/vim-yaml'

" Switch between color schemes
" Plugin 'xolox/vim-colorscheme-switcher'
" Plugin 'xolox/vim-misc'

" Track the engine.
" Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets'

" Autoclose brackets
Plugin 'Raimondi/delimitMate'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

"split navigations
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" Copy to system clipboard
"vnoremap <Leader>Y "+Y
vnoremap <C-c> "+y
" set clipboard^=unnamed

" Self explenatory
" set splitright

" Self explenatory
set splitbelow

" Intendation for yaml files
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" macros
let @t = "vertical:term"

" templates
 if has("autocmd")
   augroup templates
     autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
     autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
   augroup END
 endif

" Nerdtree shourtcat
map <c-n> :NERDTreeToggle <CR>

" Enable folding
" set foldmethod=indent
" set foldlevel=99

" Four spaces when you hit tab for py files
"au BufNewFile,BufRead *.py
"    \ set tabstop=4
""    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix
"
"" Two spaces when you hit tab for js html and css
"au BufNewFile,BufRead *.js, *.html, *.css
"    \ set tabstop=2
"    \ set softtabstop=2
"    \ set shiftwidth=2
"
"" Use the below highlight group when displaying bad whitespace is desired.
"highlight BadWhitespace ctermbg=red guibg=red
"
"" Make trailing whitespace be flagged as bad.
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Set the default file encoding to UTF-8:
set encoding=utf-8

" autocomplete
"let g:ycm_python_binary_path = 'python3'
"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  with open(activate_this, "rb") as source_file:
    code = compile(source_file.read(), activate_this, "exec")
  exec(code, dict(__file__=activate_this))
EOF

" Compile python code with F9
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
"
" Compile python code with F5
autocmd FileType python map <buffer> <F5> :w<CR>:term python3 "%"<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:term python3 "%"<CR>
"
"" For full syntax highlighting:
"let python_highlight_all=1
"syntax on
"
"" color scheme
colorscheme vim-monokai-tasty
"" colorscheme monokai


"turn on numbering
set nu

" Highlight all search pattern matches
set hlsearch

"self explanitory
set relativenumber

" In many terminal emulators the mouse works just fine, thus enable it.
" if has('mouse')
"   set mouse=a
" endif

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<c-j>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"let g:UltiSnipsUsePythonVersion = 3
"let g:UltiSnipsEditSplit="vertical"
"set rtp+=~/.vim/ultisnips_rep
"let g:UltiSnipsSnippetDirectories=["UltiSnips"]
"let g:UltiSnipsSnippetsDir="~/.vim/ultisnips_rep/UltiSnips"

" Disable vim separate clipboard
" set clipboard=unnamed


