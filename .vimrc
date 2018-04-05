set encoding=utf-8
scriptencoding utf-8

set fileencoding=utf-8
set fileencodings=iso-2022-jp,utf-8,euc-jp,sjis
set fenc=utf-8
set fileformats=unix,dos,mac
set ambiwidth=double

set nobackup
set noswapfile
set hidden
set showcmd

set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

set laststatus=2

set wildmode=list:longest
set wildmenu

set virtualedit=onemore

set visualbell

syntax enable
filetype on

augroup fileTypeIndent
	autocmd!
	autocmd BufNewFile,BufRead *.cs setlocal tabstop=4 softtabstop=4
	autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4
	autocmd BufNewFile,BufRead *.php setlocal tabstop=4 softtabstop=4
	autocmd BufNewFile,BufRead *.go setlocal tabstop=4 softtabstop=4
	autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2
	autocmd BufNewFile,BufRead *.jsx setlocal tabstop=2 softtabstop=2
	autocmd BufNewFile,BufRead *.vue setlocal tabstop=2 softtabstop=2
augroup END

set incsearch " search
set ignorecase
set smartcase
set hlsearch

nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>  " change highlight esc x2

set whichwrap=b,s,h,l,<,>,[,],~ " cursor
set number
set cursorline
hi CursorLine ctermfg=NONE ctermbg=black
#set cursorcolumn


"-------------------------
" shortcut
"-------------------------
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
nnoremap <silent><C-e> :NERDTreeToggle<CR>

set backspace=indent,eol,start

set showmatch " %%
source $VIMRUNTIME/macros/matchit.vim

"-------------------------
" neobundle
"-------------------------

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/

	if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
		echo "install NeoBundle"
		:call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
	endif
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'
" plugins here
"--------------------------

NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'ctrlpvim/ctrlp.vim'

"--------------------------
call neobundle#end()

filetype plugin indent on

NeoBundleCheck

function! Filepath()
	if winwidth(0) > 90
		return expand("%:s")
	else
		return expand("%:t")
	endif
endfunction


"--------------------------
" paste setting
"--------------------------
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"

    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
	return a;ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"--------------------------
" neocomplete setting
"--------------------------
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PmenuSbar ctermbg=4

set completeopt=menuone
set completeopt=menuone

let g:rsenseUseOmniFunc = 1
let g:auto_ctags = 1
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion  =  1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_max_list = 20
let g:neocomplcache_min_syntax_length = 3

autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

"--------------------------
" Indent Guides setting
"--------------------------
let g:indent_guides_enable_on_vim_startup = 1


"--------------------------
" setting for go lang
"--------------------------

set rtp+=$GOROOT/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set visualbell t_vb=
