set encoding=utf8

call plug#begin('~/.vim/plugged')

"
" Install plugins here
"
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'heavenshell/vim-prettier'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

Plug 'steelsojka/deoplete-flow'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'yegappan/greplace'
Plug 'wakatime/vim-wakatime'
Plug 'airblade/vim-gitgutter'
Plug 'tmhedberg/matchit'
Plug 'miyakogi/conoline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'takac/vim-hardtime'
Plug 'terryma/vim-multiple-cursors'
"Plug 'vim-scripts/indentpython.vim'
" Plug 'Valloric/YouCompleteMe'
Plug 'nvie/vim-flake8'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" NERDTree settings
map <C-K><C-B> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '\.cache', '__pycache__', '.git', 'env', 'env2', 'env3', 'venv', 'node_modules']

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
if has('nvim')
    nmap <BS> <C-W>h
endif

" CtrlP settings
map <C-T> :CtrlPBufTagAll<Return>
let g:ctrlp_extensions = ['tag', 'buffertag']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(env|git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc|swp)$',
  \ }
" Use ag to speed up CtrlP
" Use .agignore (with .gitignore syntax) to ignore files
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""' 

set mouse=a

" Run prettier automatically
autocmd BufWritePost *.js,*.jsx call prettier#run(1)

" Use system clipboard for
set clipboard=unnamedplus

" Emmet stuff
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" Fix linting in flow files
let g:ale_linters = { 
\'javascript': ['flow', 'eslint'],
\}


let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1

"set cursorline
"hi CursorLine cterm=NONE ctermbg=black ctermfg=NONE

let g:ctrlp_show_hidden = 1

:set number relativenumber

" Line numbers
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END


"- Git-Gutter -"
" stolen from here https://gitlab.com/Sacules/dotfiles/blob/master/nvim/.config/nvim/init.vim
" Better glyphs
let g:gitgutter_sign_added='➕'
let g:gitgutter_sign_modified='✍️'
let g:gitgutter_sign_removed='🚮'
let g:gitgutter_sign_removed_first_line='🚮'
let g:gitgutter_sign_modified_removed='✍️'
let g:gitgutter_override_sign_column_highlight = 0

" Removing background for a e s t h e t i c s
hi! GitGutterAdd ctermbg=NONE
hi! GitGutterChange ctermbg=NONE
hi! GitGutterDelete ctermbg=NONE
hi! GitGutterChangeDelete ctermbg=NONE

" Remove background
hi LineNr ctermbg=NONE
hi SignColumn ctermbg=NONE
hi VertSplit ctermbg=NONE
hi CursorLineNr ctermbg=NONE ctermfg=7


"--- Searching ---"
" Search as characters are entered
set incsearch

" Highlight matches
set hlsearch

" Better searching
set ignorecase
set smartcase

let g:NERDTreeWinSize = 28
let g:NERDTreeMinimalUI = 1


set scrolloff=8 " The screen will only scroll when the cursor is 8 characters from the top/bottom.
set ffs=unix,dos,mac " Prioritize unix as the standard file type.
set wildmenu " Enable the 'autocomplete' menu when in command mode (':').

set showmatch " Will highlight matching brackets.
set mat=2 " How long the highlight will last.
set ttyfast " Will send characters over a terminal connection faster. We do have fast connections after all.
set ruler " Always show current cursor position, which might be needed for the character column location.
set hidden " Abandon buffer when closed, which is usually what we want to do in this case.
set lazyredraw " Good performance boost when executing macros, redraw the screen only on certain commands.
set backspace=2 " Used for making backspace work like in most other editors (e.g. removing a single indent).

set undodir=~/.vim/undodir " Where do we store all this awesomeness?!?!
set undofile " Persistent undos are completely freaking awesome!!!
set noswapfile " Don't create swap files, nowadays we should have enough memory to store a text file.
set nowritebackup " If Vim crashes often then turn backups on again, look at docs for more information.
set autoread " Reload file when it has been changed externally.


" Custom built status-bar
set fillchars+=vert:│,
set fillchars+=stl:─,stlnc:─
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE
hi VertSplit cterm=NONE
hi StatusLine ctermbg=NONE cterm=NONE guibg=red
hi StatusLineNC ctermbg=NONE cterm=NONE guibg=green

set statusline=────
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%#VertSplit#
set statusline+=\ ─\ %p%%\ 

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '✗'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
hi ALEErrorSign ctermfg=Red
highlight ALEWarning cterm=bold ctermbg=Black ctermfg=Red
highlight ALEError cterm=bold ctermbg=Black ctermfg=Red

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

let mapleader = "\<Space>"
map <Leader> <Plug>(easymotion-prefix)

" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 noexpandtab
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

" Flag useless whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" YouCompleteMe autoclose preview
" let g:ycm_autoclose_preview_window_after_completion=1

" YouCompleteMe go to definition
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


hi default CocUnderline    cterm=underline 
hi default CocErrorSign    ctermfg=LightRed     
hi default CocWarningSign  ctermfg=LightRed   
hi default CocInfoSign     ctermfg=LightRed  
hi default CocHintSign     ctermfg=LightRed    
hi default CocSelectedText ctermfg=Red     
hi default CocCodeLens     ctermfg=Gray    
hi default link CocErrorFloat       CocErrorSign
hi default link CocWarningFloat     CocWarningSign
hi default link CocInfoFloat        CocInfoSign
hi default link CocHintFloat        CocHintSign
hi default link CocErrorHighlight   CocUnderline
hi default link CocWarningHighlight CocUnderline
hi default link CocInfoHighlight    CocUnderline
hi default link CocHintHighlight    CocUnderline
hi default link CocListMode ModeMsg
hi default link CocListPath Comment
hi CocFloating ctermbg=DarkGray
hi default link CocHighlightText  CursorColumn

hi default link CocHoverRange     Search
hi default link CocCursorRange    Search
hi default link CocHighlightRead  CocHighlightText
hi default link CocHighlightWrite CocHighlightText