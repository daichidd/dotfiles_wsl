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
"set smartindent
set expandtab

set laststatus=2

set title
set wildmode=list:full
set wildmenu

set virtualedit=onemore

set visualbell

set clipboard=unnamed,autoselect

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

"split for cmder
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sw <C-w>w

nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L

set backspace=indent,eol,start

set showmatch " %%
source $VIMRUNTIME/macros/matchit.vim

"-------------------------
" dein
"-------------------------

if &compatible
    set nocomplete
endif

let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com:Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif


call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')

call dein#add('Haron-Prime/Antares')
call dein#add('itchyny/lightline.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('scrooloose/nerdtree')
call dein#add('scrooloose/syntastic.eit')
call dein#add('Shougo/neocomplcache')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('mattn/emmet-vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('ctrlpvim/ctrlp.vim')

call dein#add('fatih/vim-go')
call dein#add('vim-jp/vim-go-extra')

call dein#end()

"--------------------------
" colorscheme
"--------------------------
colorscheme elflord
syntax on

"--------------------------
" tab setting
"--------------------------

set showtabline=2

"--------------------------
" paste setting
"--------------------------

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
" neo snippet
"--------------------------

imap <C-k>  <Plug>(neosnippet_expand_or_jump)
smap <C-k>  <Plug>(neosnippet_expand_or_jump)
xmap <C-k>  <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
    endif

    "set snippet file dir
    let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/,~/.vim/snippets'

"--------------------------
" Unitewithbufferdiite
"--------------------------

let g:unite_enable_start_insert=0
noremap <C-U><C-B> :Unite buffer<CR>
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
noremap <C-U><C-R> :Unite file_mru<CR>
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
noremap <C-U><C-U> :Unite buffer file_mru<CR>
noremap <C-U><C-A> :Unite UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"--------------------------
" Indent Guides setlocating
"--------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=110
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=140

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

filetype off
filetype plugin indent off
set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on 
autocmd FileType go autocmd BufWritePre Fmt
set rtp+=$GOPATH/src/github.com/nsf/gocode/vim
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
set completeopt=menu,preview

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

