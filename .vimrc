""Color
set bg=dark
syntax enable
set equalalways

""Indent
filetype plugin indent on
set cindent
set autoindent
set smartindent 
set list listchars=tab:\¦\ 
highlight SpecialKey ctermbg=None ctermfg=242

"Basic
set number
set cursorline
"set directory=$HOME/.vim/directory
"set undodir=$HOME/.vim/undodir
"set undofile
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set showmatch
set wildmenu
set ttimeoutlen=50
set mouse=a
set clipboard=unnamedplus

"Highlight Search
set hlsearch
set incsearch
nmap <Esc><Esc> :nohlsearch<CR>

"Tabstop and Shift width
"set expandtab " tab -> space
set shiftwidth=2
set tabstop=2
set softtabstop=2

"Paste from Clipboard
if &term =~ "xterm"
	let &t_SI .= "\e[?2004h"
	let &t_EI .= "\e[?2004l"
	let &pastetoggle = "\e[201~"

	function XTermPasteBegin(ret)
		set paste
		return a:ret
	endfunction

	inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

" jj -> <ESC>
inoremap <silent> jj <ESC>

"mojibake
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos


"pyenv
""let g:ruby_host_prog = '/usr/bin/ruby'

"let g:python_host_prog = '/home/users/naofumi/.pyenv/versions/neovim2/bin/python2'
"let g:python3_host_prog = '/home/users/naofumi/.pyenv/versions/neovim3/bin/python3'

"if has('nvim')
"	source ${HOME}/.vim/script/.vimrc_pconfig
"	if has('python3')
"		let g:deoplete#enable_at_startup = 1
"	endif
"
set clipboard=unnamedplus


" vim-lsp
" call plug#begin('~/.vim/plugged')
"...snip...
" Plug 'prabirshrestha/vim-lsp'
"...snip...
" call plug#end




