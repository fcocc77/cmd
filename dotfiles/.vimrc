" Para instalar los plugins ejecutar :PlugInstall
call plug#begin('~/.vim/plugged')
" Temas
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'sonph/onehalf'
Plug 'gosukiwi/vim-atom-dark'

""Plug 'ryanoasis/vim-devicons'
""Plug 'ryanoasis/nerd-fonts'
""Plug 'tiagofumo/vim-nerdtree-syntax-highlight'


" Syntaxis
Plug 'vim-python/python-syntax'
Plug 'raimon49/requirements.txt.vim' " Syntaxis para los requerimientos para python pip
Plug 'suy/vim-qmake' " Syntaxis para archivos .pro
Plug 'irrationalistic/vim-tasks' " Syntaxis para to-do Tasks
Plug 'maxmellon/vim-jsx-pretty' " Jsx Syntaxis
Plug 'bfrg/vim-cpp-modern' " Sintaxis para c++
Plug 'pangloss/vim-javascript'
""

" Auto Completado
Plug 'neoclide/coc.nvim' "Auto Completado
""

" Complementos
Plug 'rhysd/vim-clang-format' " Formato para c++, javascript
Plug 'junegunn/fzf'
Plug 'yggdroot/indentline'
Plug 'preservim/nerdtree' " Arbol de archivos
Plug 'vim-scripts/ctrlp.vim' " Buscador de archivos
Plug 'vim-airline/vim-airline' " Barra de estado
Plug 'pseewald/anyfold' " Folding para todos los lenguajes
Plug 'airblade/vim-gitgutter' " Barra lateral que muestra los cambios de Git
call plug#end()



" Sintaxis JSX
let g:vim_jsx_pretty_colorful_config = 1 " default 0
""


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


" Coc - para que el autocompletado se pueda cambiar con Tab
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
""



" Para que funcione el borrado con la tecla 'backspace'
set backspace=indent,eol,start
""


" leader mapeado con 'coma', sirve para el 'todo-task'
let mapleader = ","
""

" IndentLine Configuracion
let g:indentLine_color_gui = '#3b414d'
let g:indentLine_char = '▏'
""


" Habilita el highlight de python
let g:python_highlight_all = 1
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
hi Folded term=underline

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
let g:NERDTreeWinSize = 35
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
set fillchars+=vert:\▏
autocmd Syntax * syn match cOperator "[+=*%^&|<>-]" " Cambia el color de los operadores



""let g:airline#extensions#tabline#enabled = 1
hi CursorLineNr guifg=#fd9845
hi Folded          guifg=#656f80 guibg=#2c333f
hi TabLineFill  guibg=#1f2127
hi TabLine      guifg=#444a57 guibg=#1f2127 gui=none 
hi TabLineSel   guifg=#e5c07b guibg=#282c34 gui=bold
""


" Permite que con el escape se terminen los textos resaltados
set hlsearch " Resalta los textos encontrados
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
""
