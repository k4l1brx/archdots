"========================================
"___ _   _ ___ _______     _____ __  ___
"|_ _| \ | |_ _|_   _\ \   / /_ _|  \/  |
" | ||  \| || |  | |  \ \ / / | || |\/| |
" | || |\  || |  | |_  \ V /  | || |  | |
"|___|_| \_|___| |_(_)  \_/  |___|_|  |_|
"========================================

set tabstop=4
set shiftwidth=4
set number
set background=dark
set autoindent
set nocompatible
set scrolloff=999
" set clipboard=unnamedplus
filetype plugin indent on
" Syntax highlighting
syntax on
" Stop vim from wrapping lines at a middle of a word

set nowrap
set linebreak

" Netrw configuration 
"

let g:netrw_liststyle=3
let g:netrw_banner = 0
	"Open file in a new tab
let g:netrw_browse_split = 3 
	"20% screen size
let g:netrw_winsize = 15

let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

map <silent> <C-E> :call ToggleNetrw()<CR>

" Plugins with vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
let g:gruvbox_contrast_light="soft"
Plug 'junegunn/goyo.vim'

Plug 'vimwiki/vimwiki'
" Goyo! Goyo
Plug 'NLKNguyen/papercolor-theme'
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=4
set conceallevel=1
let g:tex_conceal='abdmg'
Plug 'sirver/ultisnips'
let g:UltiSnipsSnippetDirectories=["~/.config/nvim/my-snips"]
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
Plug 'takac/vim-hardtime'
let g:hardtime_default_on = 0
let g:list_of_disabled_keys = ["<backspace>", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:hardtime_timeout = 1000

Plug 'justinmk/vim-syntax-extra'
call plug#end()
set encoding=utf-8
filetype plugin on
set imdisable iminsert=0 imsearch=-1
set list
set listchars=tab:▸\ ,eol:¬
set ruler
set relativenumber
" Remap F2 to save
nnoremap <F2> :update<CR>
inoremap <F2> <ESC> :update<CR>
" Paste toggle
set pastetoggle=<F3>

" Lightline
set laststatus=2

" Remove newbie crutches in Command Mode
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

" Remap key

nnoremap <C-l> $
nnoremap <C-h> ^
vnoremap <C-l> $
vnoremap <C-h> ^
inoremap <C-h> <C-o>^
inoremap <C-l> <C-o>$

"auto close {
function! s:CloseBracket()
		let line = getline('.')
		if line =~# '^\s*\(struct\|class\|enum\) '
				return "{\<Enter>};\<Esc>O"
		elseif searchpair('(', '', ')', 'bmn', '', line('.'))
				" Probably inside a function call. Close it off.
				return "{\<Enter>});\<Esc>O"
		else
				return "{\<Enter>}\<Esc>O"
		endif
endfunction
inoremap <expr> {<Enter> <SID>CloseBracket()

"fixspaces 
fu! Fixspaces()
	while search('^\t* \{2}') != 0
		execute ':%s/^\t*\zs \{2}/\t/g'
	endwhile
endfu

set ttimeoutlen=50
set nohlsearch
set t_Co=256
" hi ErrorMsg ctermbg=0
" hi WarningMsg ctermbg=0
" hi Visual ctermbg=15
" highlight Normal ctermbg=NONE
" highlight nonText ctermbg=NONE

colorscheme gruvbox
