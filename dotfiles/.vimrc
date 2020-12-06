" Para instalar los plugins ejecutar :PlugInstall
call plug#begin('~/.vim/plugged')
" Temas
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'raimon49/requirements.txt.vim' " Syntaxis para los requerimientos para python pip

Plug 'ryanoasis/vim-devicons'
Plug 'ryanoasis/nerd-fonts'


""Plug 'neoclide/coc.nvim' " Auto Completado
Plug 'rhysd/vim-clang-format' " Formato para c++, javascript
Plug 'junegunn/fzf'
Plug 'yggdroot/indentline'
Plug 'mxw/vim-jsx'
Plug 'suy/vim-qmake' " Syntaxis para archivos .pro
Plug 'irrationalistic/vim-tasks' " Syntaxis para to-do Tasks
Plug 'octol/vim-cpp-enhanced-highlight' " Sintaxis para c++
Plug 'preservim/nerdtree' " Arbol de archivos
Plug 'vim-scripts/ctrlp.vim' " Buscador de archivos
Plug 'vim-airline/vim-airline' " Barra de estado
Plug 'pseewald/anyfold' " Folding para todos los lenguajes
""Plug 'airblade/vim-gitgutter' " Barra lateral que muestra los cambios de Git
call plug#end()

" Numeros Laterales
set number
set relativenumber
""
set encoding=UTF-8

" Autocompletar parentesis, llaves, corchete, comillas
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
""


" leader mapeado con 'coma', sirve para el 'todo-task'
let mapleader = ","
""

" IndentLine Configuracion
let g:indentLine_color_term = 239
let g:indentLine_char = '⎸'
""


" Linea horizontal que muestra donde esta el cursor
set cursorline
""


" Desabilita swap files y backups
set noswapfile
set nobackup
""


" Folding
filetype plugin indent on
syntax on                
autocmd Filetype * AnyFoldActivate               
set foldlevel=99 
""


" Identacion
set tabstop=4
set shiftwidth=4 " Espacios que se generan al presioar tab 
""


" NerdTree Configuracion
autocmd vimenter * NERDTree
let NERDTreeShowLineNumbers = 1 " Habilita los numeros
let NERDTreeIgnore = ['\.git$', 'node_modules']
autocmd FileType nerdtree setlocal relativenumber " Numeros relativos
let g:NERDTreeWinSize = 30
let NERDTreeShowHidden = 1
silent! map <F2> :NERDTreeFind<CR>
map <silent> <C-b> :NERDTreeToggle<CR>  
""



" Configuracion Ctrl-P
set wildignore+=node_modules,*.o,*.swp,*.pyc
let g:ctrlp_show_hidden = 1
""


" Estilos 
colorscheme onedark 
set termguicolors " habilita los 24 bit de colores

hi CursorLineNr guifg=#fd9845
hi TabLine      guifg=#444a57 guibg=#1f2127 gui=none 
hi TabLineSel   guifg=#e5c07b guibg=#282c34 gui=bold
hi TabLineFill  guibg=#1f2127
""


" Permite que con el escape se terminen los textos resaltados
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
""
