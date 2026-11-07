syntax on 
set nu
filetype plugin indent on
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start
set hlsearch incsearch ignorecase smartcase
set ruler 
set cursorline
autocmd BufWritePre * call mkdir(expand('<afile>:p:h'), 'p')
autocmd BufReadPost * if line ("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
