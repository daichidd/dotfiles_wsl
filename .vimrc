set encoding=utf-8
scriptencoding utf-8

set fileencoding=utf-8
set fileencodings=iso-2022-jp,utf-8,euc-jp,sjis
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

set title
set wildmode=list:full
set wildmenu

set virtualedit=onemore

set visualbell

filetype on

augroup fileTypeIndent
	autocmd!
	autocmd BufNewFile,BufRead *.cs setlocal tabstop=4 softtabstop=4
	autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4
	autocmd BufNewFile,BufRead *.php setlocal tabstop=4 softtabstop=4
	autocmd BufNewFile,BufRead *.go setlocal tabstop=4 softtabstop=4
	autocmd BufNewFile,BufRead *.cr setlocal tabstop=4 softtabstop=4
	autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2
	autocmd BufNewFile,BufRead *.jsx setlocal tabstop=2 softtabstop=2
	autocmd BufNewFile,BufRead *.vue setlocal tabstop=2 softtabstop=2
	autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2
	autocmd BufNewFile,BufRead *.twig setlocal tabstop=2 softtabstop=2
	autocmd BufNewFile,BufRead *.tmpl setlocal tabstop=2 softtabstop=2
augroup END

set incsearch
set ignorecase
set smartcase
set hlsearch

nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>  " change highlight esc x2

set whichwrap=b,s,h,l,<,>,[,],~ " cursor
set number
set cursorline
hi CursorLine ctermfg=NONE ctermbg=black
"set cursorcolumn


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
" dein
"-------------------------

if &compatible
	set nocomplete
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')

call dein#add('w0ng/vim-hybrid')
call dein#add('itchyny/lightline.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('scrooloose/nerdtree')
call dein#add('Shougo/neocomplcache')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('mattn/emmet-vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('faith/vim-go')

call dein#end()

colorscheme hybrid
syntax on

"--------------------------
" colorscheme
"--------------------------
colorscheme elflord

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

noremap PP "0p
noremap x "_x

"--------------------------
" neocomplcache setting
"--------------------------

let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_dictionary_filetype_lists = {
	\ 'default' : ''
	\ }

inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()   
	return neocomplcache#smart_close_popup() . "\<CR>" 
endfunction 

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>" 
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>" 
inoremap <expr><C-y>  neocomplcache#close_popup() 
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"--------------------------
" Indent Guides setting
"--------------------------
let g:indent_guides_enable_on_vim_startup = 1

"--------------------------
" close tab
"--------------------------

augroup MyXML
	autocmd!
	autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
	autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

inoremap {<Enter> {}<Left><CR><ESC><s-o>
inoremap [<Enter> []<Left><CR><ESC><s-o>
inoremap (<Enter> ()<Left><CR><ESC><s-o>

"--------------------------
" setting for go lang
"--------------------------

set rtp+=$GOROOT/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview
