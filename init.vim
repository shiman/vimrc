set nocompatible
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'Yggdroot/indentLine'
Plug 'myusuf3/numbers.vim'
Plug 'airblade/vim-gitgutter'
Plug 'kassio/neoterm'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'rhysd/vim-clang-format'

call plug#end()

" Fundamental settings
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,dos,mac
filetype on
filetype plugin on
filetype plugin indent on
syntax on
let mapleader=" "
syntax enable
set background=dark
colorscheme gruvbox
set cursorline
set number
set completeopt-=preview

" FZF
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
map <C-p> :Files<CR>
map <Leader>ph :GFiles<CR>
map <Leader>gs :GFiles?<CR>
map <Leader>/ :Find<Space>
map <Leader>sl :BTags<CR>
map <Leader>bb :Buffers<CR>
map <Leader>? :History<CR>

" Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Buffer Nav
nmap <Leader>1 <Plug>AirlineSelectTab1
nmap <Leader>2 <Plug>AirlineSelectTab2
nmap <Leader>3 <Plug>AirlineSelectTab3
nmap <Leader>4 <Plug>AirlineSelectTab4
nmap <Leader>5 <Plug>AirlineSelectTab5
nmap <Leader>6 <Plug>AirlineSelectTab6
nmap <Leader>7 <Plug>AirlineSelectTab7
nmap <Leader>8 <Plug>AirlineSelectTab8
nmap <Leader>9 <Plug>AirlineSelectTab9
nmap <Leader>[ <Plug>AirlineSelectPrevTab
nmap <Leader>] <Plug>AirlineSelectNextTab
nmap <Leader><Tab> :b#<cr>
nmap <Leader>bd :bd<cr>
noremap <C-k> <c-w>k
noremap <C-j> <c-w>j
noremap <C-h> <c-w>h
noremap <C-l> <c-w>l

" YCM
nnoremap <leader>gg :YcmCompleter GoTo<Cr>

" Some useful settings
set smartindent
set expandtab         "tab to spaces
set tabstop=4         "the width of a tab
set shiftwidth=4      "the width for indent
set foldenable
set foldmethod=indent "folding by indent
set ignorecase        "ignore the case when search texts
set smartcase         "if searching text contains uppercase case will not be ignored

" Shortcuts
" ,, => escape to normal mode
imap ,, <Esc>
" <esc> => go back to normal mode (in terminal mode)
tnoremap <Esc> <C-\><C-n> 
" <F4> => popup the file tree navigation)
nmap <F4> :NERDTreeToggle<CR>
" tb => open the tagbar
nmap <Leader>tb :TagbarToggle<CR>

" Plugin settings
" IdentLine
let g:indentLine_color_term = 239
" airline
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#tabline#buffer_idx_mode = 1
" Neoterm
let g:neoterm_size=15
let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = '<Leader>tt'
" toogle the terminal
nnoremap <silent> <Leader><cr> :Ttoggle<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> <Leader>tc :call neoterm#kill()<cr>
command! -nargs=+ Tg :T git <args>   let g:neoterm_
" Syntastics
let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_options = ' -std=c++11'
" Tagbar
let g:tagbar_width=40
" YouCompleteMe
let g:ycm_confirm_extra_conf=0
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_filetype_blacklist = {
  \ 'tagbar' : 1,
  \ 'qf' : 1,
  \ 'notes' : 1,
  \ 'unite' : 1,
  \ 'vimwiki' : 1,
  \ 'pandoc' : 1,
  \ 'infolog' : 1,
  \ 'mail' : 1
\}

" Emacs style in insertion mode
map! <C-a> <Home>
map! <C-e> <End>
map! <C-f> <Right>
map! <C-b> <Left>
map! <C-n> <Down>
map! <C-p> <Up>

" Ultisnippets
let g:UltiSnipsExpandTrigger="<C-k>"
