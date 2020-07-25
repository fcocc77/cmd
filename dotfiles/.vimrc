" Numeros Laterales
set number
set relativenumber

" Desabilita swap files y backups
set noswapfile
set nobackup

"set cursorline

" Folding
set foldmethod=syntax
set nofoldenable " Al abrir un archivo, inicia con el fold desabilitado
set foldlevel=0

" Identacion
set tabstop=4 " Espacios que se generan al presioar tab

" Para instalar los plugins ejecutar :PlugInstall
call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'

call plug#end()

" Tema de estilos
colorscheme nord
