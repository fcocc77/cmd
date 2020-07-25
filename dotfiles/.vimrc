" Numeros Laterales
set number
set relativenumber

" Desabilita swap files y backups
set noswapfile
set nobackup

" Identacion
set tabstop=4           " Espacios que se generan al presioar tab

" Para instalar los plugins ejecutar :PlugInstall
call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'

call plug#end()

" Tema de estilos
colorscheme nord
