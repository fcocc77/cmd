" Para instalar los plugins ejecutar :PlugInstall
call plug#begin('~/.vim/plugged')
" Temas
Plug 'arcticicestudio/nord-vim'
Plug 'tomasr/molokai'
Plug 'srcery-colors/srcery-vim'
Plug 'ryuta69/elly.vim'
Plug 'morhetz/gruvbox'
""

Plug 'preservim/nerdtree' " Arbol de archivos
Plug 'vim-scripts/ctrlp.vim' " Buscador de archivos
Plug 'vim-airline/vim-airline' " Barra de estado
Plug 'pseewald/anyfold' " Folding para todos los lenguajes
Plug 'airblade/vim-gitgutter' " Barra lateral que muestra los cambios de Git
call plug#end()

" Numeros Laterales
set number
set relativenumber
""


" Desabilita swap files y backups
set noswapfile
set nobackup
""


" Folding
filetype plugin indent on
syntax on                
autocmd Filetype * AnyFoldActivate               
set foldlevel=0 
""


" Identacion
set tabstop=4 " Espacios que se generan al presioar tab
""


" NerdTree Configuracion
autocmd vimenter * NERDTree
let NERDTreeShowLineNumbers=1 " Habilita los numeros
autocmd FileType nerdtree setlocal relativenumber " Numeros relativos
let g:NERDTreeWinSize=30
silent! map <F2> :NERDTreeFind<CR>
map <silent> <C-b> :NERDTreeToggle<CR>  
""


" Configuracion Ctrl-P
let g:ctrlp_custom_ignore = 'node_modules'
""


" Habilita el tema actual
colorscheme gruvbox
set background=dark
""


" Permite que con el escape se terminen los textos resaltados
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" para que se vea bien los temas
  set t_Co=256

