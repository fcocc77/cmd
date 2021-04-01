syntax match goCustomParen     "(" contains=cParen
syntax match goCustomFuncDef   "func\s\+\w\+\s*(" contains=goDeclaration,goCustomParen
" Exclude import as function name, for multi-line imports
syntax match goCustomFunc      "import\s\+(\|\(\w\+\s*\)(" contains=goCustomParen,goImport
syntax match goCustomScope     "\."
syntax match goCustomAttribute "\.\w\+" contains=goCustomScope
syntax match goCustomMethod    "\.\w\+\s*(" contains=goCustomScope,goCustomParen

syn match goOperator ":[+=*%^&|<>-]"

" #be5046
" #4b5263
" #5c6370
" #c678dd
" #d19a66
" #e5c07b
" #56b6c2

hi goOperator guifg=#c678dd
highlight goCustomFuncDef guifg=#61afef
highlight goCustomAttribute guifg=#d19a66
highlight goCustomFunc guifg=#61afef
highlight goCustomMethod guifg=#61afef

