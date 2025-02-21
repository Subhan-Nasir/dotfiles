call plug#begin('~/.vim/plugged')

    Plug 'joshdick/onedark.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'vim-scripts/LargeFile'
    Plug 'leafgarland/typescript-vim'
    Plug 'Quramy/vim-js-pretty-template'
    Plug 'pangloss/vim-javascript'
    "Plug 'vim-scripts/AutoComplPop'
    Plug 'itchyny/lightline.vim'
    Plug 'Yggdroot/indentLine' 
    Plug 'miyakogi/conoline.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    "Plug 'prabirshrestha/asyncomplete.vim'
    "Plug 'prabirshrestha/asyncomplete-lsp.vim'
    "Plug 'jiangmiao/auto-pairs'

call plug#end()

"------------------------------------------------------------------------

" For plugins to load correctly
filetype plugin indent on

" copied (almost) directly from the vim-lsp docs:
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled (set the lsp shortcuts) when an lsp server
    " is registered for a buffer.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


"inoremap <expr> <Down> pumvisible() ? "<C-n>" : "<Down>"
"inoremap <expr> <Up> pumvisible()   ? "<C-p>" : "<Up>"
"inoremap <expr> <Tab> pumvisible()  ? "<C-y>" : "<Tab>"
"inoremap <expr> <Esc> pumvisible()  ? "<C-e>" : "<Esc>"


"------------------------------------------------------------------------


if (has("termguicolors"))
    set termguicolors
endif

set background=dark
let g:onedark_termcolors=16



if (has("autocmd"))
    augroup colorextend
        autocmd!
        " Make `Function`s bold in GUI mode
        autocmd ColorScheme * call onedark#extend_highlight("Function", { "gui": "bold" })
        " Override the `Identifier` background color in GUI mode
        autocmd ColorScheme * call onedark#extend_highlight("jsonKeyword", { "fg": { "gui": "#aadafa" } })
        autocmd ColorScheme * call onedark#extend_highlight("jsonBoolean", { "fg": { "gui": "#679ad1" } })
        autocmd ColorScheme * call onedark#extend_highlight("jsonString", { "fg": { "gui": "#98c379" } })
        autocmd ColorScheme * call onedark#extend_highlight("Comment", { "fg": { "gui": "#666e7d" } })
        "#36737a
        autocmd ColorScheme * call onedark#extend_highlight("Visual", { "bg": { "gui": "#105666" } })

        "autocmd ColorScheme * call onedark#extend_highlight("Normal", { "bg": { "gui": "#282a36" } })

    augroup END
endif



if (has("autocmd") && !has("gui_running"))
    augroup colorset
        autocmd!
        let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
        autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
    augroup END
endif


let g:lightline = {
    \"colorscheme" : "nord"
\}


colorscheme onedark


let g:cononline_auto_enable = 1
let g:conoline_use_colorscheme_default_normal=1
let g:conoline_use_colorscheme_default_insert=1

set nostartofline


" Indent line plugin
let g:indentLine_char = '│'
"let g:indentLine_leadingSpaceChar='·'
"let g:indentLine_leadingSpaceEnabled='1'
let g:vim_json_conceal=0
let g:markdown_syntax_conceal=0
let g:indentLine_concealcursor='inc'
let g:indentLine_conceallevel=1



" AutoPair
": let g:AutoPairsFlyMode = 1


" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off


" Turn on syntax highlighting
syntax on


" TODO: Pick a leader key
" let mapleader = ","
let mapleader = "\<Space>"


" Security
set modelines=0

" Show line numbers
set number relativenumber


" Show file stats
set ruler

" Blink cursor on error instead of beeping 
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround
set autoindent

"keep visual mode after indent
vnoremap > >gv
vnoremap < <gv

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk
" Allow hidden buffers
set hidden
" Rendering
set ttyfast
" Status bar
set laststatus=2


" Last line
set showmode
set showcmd

set wildmenu





" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search
" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>
" Textmate holdouts
" Formatting
map <leader>q gqip
" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL


set splitbelow splitright


" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif



"vim-js-pretty-template for angular templates"
"autocmd FileType typescript JsPreTmpl html
"autocmd FileType typescript syn clear foldBraces

" Autocomplete
"set complete+=kspell
"set completeopt=menuone
"set shortmess=c
"inoremap <expr> <Down> pumvisible() ? "<C-n>" : "<Down>"
"inoremap <expr> <Up> pumvisible()   ? "<C-p>" : "<Up>"
"inoremap <expr> <Tab> pumvisible()  ? "<C-y>" : "<Tab>"
"inoremap <expr> <Esc> pumvisible()  ? "<C-e>" : "<Esc>"



"Clears search highlighting 
nnoremap <silent> \ :let @/="" <return>
"test change 3
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a

