" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" --------------------
"  plugin install
" --------------------
call plug#begin('~/.vim/plugged')

" 中文文档
Plug 'yianwillis/vimcdoc'

" colorscheme
" Plug 'joshdick/onedark.vim'
" Plug 'sheerun/vim-polyglot'
Plug 'lifepillar/vim-gruvbox8'
" Plug 'rakr/vim-one'

" linestatus
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'SongTianxian9/vim-airline-themes'

" file navigation: <Leader>-n
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" workspace
Plug 'thaerkh/vim-workspace'
" window zoom  <C-w>m
Plug 'dhruvasagar/vim-zoom'

" 还不知道干嘛的 %
Plug 'andymass/vim-matchup'

" comment: gc, <Leader>-c-c
Plug 'tpope/vim-commentary'

" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" auto complete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" diagnose
Plug 'dense-analysis/ale'
Plug 'rhysd/vim-lsp-ale'

Plug 'SirVer/ultisnips'
Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'
" brew tap universal-ctags/universal-ctags
" brew install --HEAD universal-ctags/universal-ctags/universal-ctags
" tag view
Plug 'liuchengxu/vista.vim'
Plug 'preservim/tagbar'

" minimap
" Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}
" Find
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" gen tagfile
Plug 'ludovicchabant/vim-gutentags'

" floaterm
Plug 'voldikss/vim-floaterm'
Plug 'windwp/vim-floaterm-repl'

" auto pair
Plug 'jiangmiao/auto-pairs'

call plug#end()

" --------------------
"  general
" --------------------

" basic
set nocompatible
syntax on
filetype plugin indent on

" colorscheme
if has('gui_running')
    set background=dark
    " set background=light
    " colorscheme onedark
    colorscheme gruvbox8
    " colorscheme dracula
else
    set t_Co=256
    " set background=dark
    " set background=light
    colorscheme gruvbox8
    " colorscheme dracula
endif
" set background=dark        " for the light version
" let g:one_allow_italics = 1 " I love italic for comments
" colorscheme gruvbox8

let &t_ut=''

" <leader>
let mapleader = " "

" --------------------
"  user interface
" --------------------

" line number
set nu " number lines
set rnu " relative line numbering

" search
set incsearch " incremental search (as string is being typed)
set hls " highlight search
set ignorecase
set smartcase
noremap n nzz
noremap N Nzz

" No annoying sound on errors
" set noerrorbells
" set novisualbell
" set t_vb=
set belloff=all
set tm=500

" tab
set expandtab
set shiftwidth=4
" set softtabstop=4
set tabstop=4

" indent
set ai "Auto indent
set si "Smart indent

" line
set lbr " line break
set wrap "Wrap lines
" height current line
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END
" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" window
set splitbelow
set splitright
" guiwindow
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
hi VertSplit guibg=bg guifg=bg
set guifont=JetBrainsMonoNerdFontCompleteM-Medium:h14

" Turn backup off
set nobackup
set nowb
set noswapfile

" misc
" set list
" set listchars=tab:>-,trail:-,nbsp:%,eol:<,extends:»,precedes:« " Unprintable chars mapping

set completeopt+=menuone

" set listchars=tab:>>,nbsp:~ " set list to see tabs and non-breakable spaces
set showmatch
set scrolloff=10 " show lines above and below cursor (when possible)
set cmdheight=1
set lazyredraw
set autochdir
set hidden " allow auto-hiding of edited buffers
set laststatus=2
set encoding=UTF-8

" auto wrap
" 如果您在插入模式下输入时的目标是在窗口边缘自动软换行文本（仅在视觉上）
" set textwidth=0
" set wrapmargin=0
" set wrap
" set linebreak # (optional - breaks by word rather than character)
" 如果您在输入插入模式时的目标是在 80 列处自动硬换行文本（通过在实际文本文件中插入新行）
set textwidth=80
set wrapmargin=0
set formatoptions+=t
set linebreak " (optional - breaks by word rather than character)
" 如果您的目标是在插入模式下键入时自动软换行 80 列文本（仅在视觉上）
" set textwidth=0
" set wrapmargin=0
" set wrap
" set linebreak # (optional - breaks by word rather than character)
" set columns=80 # <<< THIS IS THE IMPORTANT PART

" --------------------
"  map
" --------------------

let mapleader = " "


nnoremap Q gq

" insert mode move
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-a> <Home>
inoremap <C-e> <End>

" windows navigate
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

" tab switch tabfile
nnoremap <silent> <tab> :tabn<CR>
nnoremap <silent> <leader>x :q!<CR>
nnoremap <silent> <leader>n :bnext<CR>

" Plugin
nnoremap <silent> <leader>j :FZF ~<CR>
nnoremap <silent> <c-n> :NERDTreeToggle<CR>
nnoremap <silent> <leader>c :TagbarToggle<CR>


" --------------------
" Plugin configuration
" --------------------

" NERDTree
" ----------
" nnoremap <silent> <c-n> :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" AIRLINE
" ----------
let g:airline_theme = 'kalisi'
" call airline#parts#define_minwidth('YuFei 👫 XiaoQ', 50)
let g:airline_section_c = airline#section#create_left([ 'XiaoQ 👫 TianX', ' ', 'file', ])
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline_statusline_ontop=1

" LSP
" ----------
" if executable('pyls')
"     " pip install python-language-server
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->['pyls']},
"         \ 'allowlist': ['python'],
"         \ })
" endif

function! s:on_lsp_buffer_enabled() abort
    " setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nnoremap <buffer> <silent> gd :LspDefinition<CR>
    nnoremap <buffer> <silent> gs :LspDocumentSymbolSearch<CR>
    nnoremap <buffer> <silent> gS :LspWorkspaceSymbolSearch<CR>
    nnoremap <buffer> <silent> gr :LspReferences<CR>
    nnoremap <buffer> <silent> gi :LspImplementation<CR>
    nnoremap <buffer> <silent> gt :LspTypeDefinition<CR>
    nnoremap <buffer> <silent> rn :LspRename<CR>
    nnoremap <buffer> [g :LspPreviousDiagnostic<CR>
    nnoremap <buffer> ]g :LspNextDiagnostic<CR>
    nnoremap <buffer> K :LspHover<CR>
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.c,*.cpp call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" let g:lsp_diagnostics_enabled = 0         " disable diagnostics support


" ASYNCOMPLETE.vim
imap <c-space> <Plug>(asyncomplete_force_refresh)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


" vista.vim
" ------------
nnoremap <silent> <leader>v :Vista!!<CR>
"
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" GUTENTAG
" ------------
set statusline+=%{gutentags#statusline()}
let g:gutentags_project_root = ['Makefile', '.git', '.root']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif


" ALE
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
"airline
let g:airline#extensions#ale#enabled = 1
" nnoremap <silent> <leader>k <Plug>(ale_previous_wrap)
" nnoremap <silent> <leader>j <Plug>(ale_next_wrap)
" nnoremap <silent> [g <Plug>(ale_previous_wrap)
" nnoremap <silent> ]g <Plug>(ale_next_wrap)
nnoremap <silent> <leader>f :ALENextWrap<CR>
nnoremap <silent> <leader>a :ALEPreviousWrap<CR>

" vim-workspace
" ---------------
" let g:workspace_autocreate = 1
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
nnoremap <leader>s :ToggleWorkspace<CR>

" floaterm
let g:floaterm_repl_runner= expand("~/.vim/repl.sh")
nnoremap <leader>uu :FloatermRepl<CR>
vnoremap <leader>uu :FloatermRepl<CR>

" auto pair
let g:AutoPairsFlyMode = 1
let g:AutoPairsMapCh = 0


" minimap
" -----------
" let g:minimap_width = 10
" let g:minimap_auto_start = 1
" let g:minimap_auto_start_win_enter = 1
