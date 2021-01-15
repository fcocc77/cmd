
call plug#begin('~/.vim/plugged')
" Temas
Plug 'joshdick/onedark.vim'

Plug 'ryanoasis/vim-devicons'
Plug 'ryanoasis/nerd-fonts'


" Syntaxis
Plug 'vim-python/python-syntax'
Plug 'raimon49/requirements.txt.vim' " Syntaxis para los requerimientos para python pip
Plug 'suy/vim-qmake' " Syntaxis para archivos .pro
Plug 'irrationalistic/vim-tasks' " Syntaxis para to-do Tasks
Plug 'maxmellon/vim-jsx-pretty' " Jsx Syntaxis
Plug 'bfrg/vim-cpp-modern' " Sintaxis para c++
Plug 'zainin/vim-mikrotik' " MikroTik Syntaxis
Plug 'pangloss/vim-javascript'
Plug 'neovimhaskell/haskell-vim'
Plug 'cakebaker/scss-syntax.vim'
""

" Auto Completado
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Auto Completado
""

" AirLine
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
""

Plug 'thaerkh/vim-workspace' " Espacios de Trabajo
Plug 'majutsushi/tagbar' " Lista de funciones

" NerdTree
Plug 'preservim/nerdtree' " Arbol de archivos
Plug 'xuyuanp/nerdtree-git-plugin' " Muestra los cambios de git en nerdtree
""

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter' " Barra lateral que muestra los cambios de Git

Plug 'jiangmiao/auto-pairs' " Completa los signos par como comillas parentesis y otros


" Complementos
Plug 'lilydjwg/colorizer' " Resalta los colores
" Plug 'shmargum/vim-sass-colors' "Resalta colores y tambien colores en variables de sass
Plug 'szw/vim-maximizer' " Toogle para maximizar sin perder el split
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter' " Comentarios de codigo
Plug 'rhysd/vim-clang-format' " Formato para c++, javascript
Plug 'yggdroot/indentline'
Plug 'pseewald/anyfold' " Folding para todos los lenguajes
call plug#end()


" leader mapeado con 'coma', sirve para el 'todo-task'
let mapleader = ","
""


" asigna el tipo de sintxis segun la extencion o nombre
autocmd BufEnter .xmobarrc :setlocal filetype=haskell
autocmd BufEnter .xinitrc :setlocal filetype=sh
autocmd BufEnter *.conf :setlocal filetype=xf86conf
autocmd BufEnter *.txt :setlocal filetype=sh
autocmd Bufenter requirements.txt :setlocal filetype=requirements



" Auto guardado de espacio de trabajo
let g:workspace_session_name = 'session.vim'
autocmd VimLeave * tabdo NERDTreeClose " Cierra todos los nerdtree antes de salir, por que da conflicto con la session
autocmd VimLeave * tabdo TagbarClose " Cierra todos los tagbar
nnoremap <Leader>ss :ToggleWorkspace<CR>
"


" FZF
let g:fzf_layout = { 'down': '~40%' } " Abre la venatana en un split en la parte inferior
nmap <C-F> :BLines<CR>
" GFiles ignora los archivos de .gitignore
map <C-P> :GFiles<CR>
""


" al reescalar vim, siempre mantiene los split del mismo tamaño
autocmd VimResized * wincmd =
"


" Toogle para maximizar un ventana el diseño de splits
let g:maximizer_default_mapping_key = '<F4>'
"""


" Sintaxis JSX
let g:vim_jsx_pretty_colorful_config = 1 " default 0
""


" Commenter
let g:NERDSpaceDelims = 1 " Agrega un espacio despues del comentario
au FileType * set fo-=c fo-=r fo-=o " Desabilita el comentario al pasar a la siguiente linea
""



" Tag Bar
let g:tagbar_show_linenumbers = 1
nmap <F8> :TagbarToggle<CR>
"


" Numeros Laterales
set number
set relativenumber
""
set encoding=UTF-8


" Coc - para que el autocompletado se pueda cambiar con Tab
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
	  \ pumvisible() ? "\<C-n>" :
	  \ <SID>check_back_space() ? "\<Tab>" :
	  \ coc#refresh()



nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" coc rename
nmap <leader>rn <Plug>(coc-rename)




" Para que funcione el borrado con la tecla 'backspace'
set backspace=indent,eol,start
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


" Cambia los shortcut de las flechas para poder navegar en modo insercion
" con las letras hjkl
inoremap <c-k> <up>
inoremap <c-j> <down>
inoremap <c-h> <left>
inoremap <c-l> <right>



" Folding
filetype plugin indent on
syntax on
autocmd Filetype * AnyFoldActivate
set foldlevel=99
hi Folded term=underline
""


" La sintaxis de json, oculta las comillas, con esta opcion lo desabilitamos esa opcion
let g:vim_json_conceal=0




" ignorar archivos y carpeta para NerdTree y ctrlp
set wildignore+=node_modules,*/node_modules/*,*.o,*.swp,*.swo,*.pyc,.git,.undodir,*/.undodir/*,session.vim
""


" NerdTree Configuracion
let NERDTreeShowLineNumbers = 1 " Habilita los numeros
let NERDTreeRespectWildIgnore = 1 " Ignora los archivos que estan en 'wildignore'
autocmd FileType nerdtree setlocal relativenumber " Numeros relativos
let g:NERDTreeWinSize = 35
let NERDTreeShowHidden = 1
nmap <F2> :NERDTreeFind<CR>
nmap <F3> :NERDTreeToggle<CR>
""


" AirLine
let g:airline_powerline_fonts = 1 " Para que los rectangulos tengan puntas
let g:airline_theme = 'onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t' "Solo muestra el nombre en los 'tabs'
let g:airline#extensions#tabline#show_buffers = 0 " Desabilita el buffer ( historial )
let g:airline#extensions#tabline#show_splits = 1 " Habilita el buffer de splits que esta a la derecha
let g:airline#extensions#tabline#tab_nr_type = 1 " Index del tab
""



" Estilos
colorscheme onedark
set termguicolors " habilita los 24 bit de colores
set fillchars+=vert:\▏

" au Syntax * syn match cOperator "[+=*%^&|<>-]" " Cambia el color de los operadores

hi CursorLineNr guifg=#fd9845
hi Folded guifg=#656f80 guibg=#2c333f
""


" evita los caracteres feos que aparecen despues de la version 8.22 de vim '>4;2m'
let &t_TI = ""
let &t_TE = ""


" Permite que con el escape se terminen los textos resaltados
set hlsearch " Resalta los textos encontrados
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
""


" indentacion
autocmd BufRead,BufNewFile *.sass set shiftwidth=4 "para que funcione la indentacion en los .sass al leer o al crear un archivo sass
set tabstop=4
set shiftwidth=4
set softtabstop=4
""

