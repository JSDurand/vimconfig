set nocompatible
filetype off                  " required

" Vundle plugin area {{{

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"set rtp+=/Users/durand/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ajh17/VimCompletesMe'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'itchyny/lightline.vim'
Plugin 'lervag/vimtex'
Plugin 'Shougo/vimproc.vim', {'do' : 'make'}
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
" Plugin 'dhruvasagar/vim-table-mode'
Plugin 'jez/vim-superman'
Plugin 'vim-utils/vim-man'
Plugin 'python-mode/python-mode'
Plugin 'Raimondi/delimitMate'
Plugin 'Yggdroot/indentLine'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'kana/vim-narrow'
Plugin 'vimwiki/vimwiki'
call vundle#end()            " required
" }}}

" auxiliary settings {{{
set background=dark
let g:solarized_termcolors = 256
syntax on
filetype plugin indent on

set number
set relativenumber
"set nowrap
set formatoptions=l
set showmode
set tw=0 wrapmargin=0
set fo+=t
set fo-=l
set wrap
set smartcase
set smarttab
set smartindent
set breakindent
set softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
set mouse=a
set history=1000
"set clipboard=unnamedplus,autoselect
"set clipboard=unnamed

set autoread
set hlsearch
set backupdir=/Users/durand/Vim-SWP-files/
" }}}

" Rust Vim settings {{{
nnoremap <leader>r :RustRun<cr>
" }}}

" vimgrep setting {{{
function! s:Rg_grep(para)
  cexpr system("rg --vimgrep -i " . a:para)
endfunction
com! -nargs=1 Rg call s:Rg_grep(<f-args>)
" }}}

" Syntastic settings {{{
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_rust_checkers = ['cargo']
nnoremap <c-w>s :SyntasticCheck<cr>
nnoremap <c-w>e :Errors<cr>
nnoremap <c-w>o :lop<cr>
nnoremap <c-w>c :lcl<cr>
"}}}

" Vim-snipmate settings {{{
" imap <C-J> <Plug>snipMateNextOrTrigger
" smap <C-J> <Plug>snipMateNextOrTrigger

" imap <c-k> <Plug>snipMateBack
" smap <c-k> <Plug>snipMateBack
" }}}

" vim-javascript settings {{{
let g:javascript_conceal_function                  = "ƒ"
let g:javascript_conceal_null                      = "ø"
let g:javascript_conceal_this                      = "@"
let g:javascript_conceal_return                    = "⇚"
let g:javascript_conceal_undefined                 = "¿"
let g:javascript_conceal_NaN                       = "ℕ"
let g:javascript_conceal_prototype                 = "¶"
let g:javascript_conceal_static                    = "•"
let g:javascript_conceal_super                     = "Ω"
let g:javascript_conceal_arrow_function            = "⇒"
let g:javascript_conceal_noarg_arrow_function      = "-"
let g:javascript_conceal_underscore_arrow_function = "_"
" }}}

" NERD_commenter settings {{{
let g:NERDSpaceDelims = 1
nmap <leader>ca <plug>NERDCommenterAppend
" }}}

" Vimwiki settings{{{
nmap gls :VimwikiChangeSymbolTo \*<CR>
let g:vimwiki_folding='list'
let g:vimwiki_list = [{'auto_tags': 1}]
"" }}}

" airline and YCM {{{
" let g:airline_extensions=['tabline']
" let g:airline_powerline_fonts = 1
let g:ttimeoutlen = 10
" let g:airline_theme='powerlineish'
"let g:airline#extensions#tabline#enabled = 1
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python3'
let g:ycm_server_use_vim_stdout = 0
"if !exists('g:airline_symbols')
    "let g:airline_symbols = {}
"endif

"let g:airline_symbols.space = "\ua0"
" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = ''

" " airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
" }}}

" Light line settings {{{
set laststatus=2
set noshowmode
set showtabline=0
if has('gui_running')
  set guioptions-=e
endif
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'pijulbranch': 'PBranch',
      \   'fileformat' : 'LightlineFileformat',
      \   'filetype'   : 'LightlineFiletype',
      \   'filename'   : 'LightlineFilename',
      \ },
      \ }
" let g:lightline#bufferline#show_number  = 1
" let g:lightline#bufferline#shorten_path = 0
" let g:lightline#bufferline#unnamed      = '[No Name]'
" let g:lightline.tabline = {'left': [['buffers']], 'right': [['close']]}
" let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
" let g:lightline.component_type = {'buffers': 'tabsel'}

let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle

function! PBranch()
let branch=system('pijul branches')
if branch =~ '* '
  return substitute(branch, '* ', '', '')
endif
return
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

colorscheme vividchalk
" }}}

" My zone of mappings {{{
let mapleader = ","
let maplocalleader = "©"

let g:pymode = 1
let g:pymode_options = 1
let g:pymode_indent = 1
let g:pymode_folding = 1
let g:pymode_rope_completion = 1
let g:tex_conceal = ""

autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
" autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

nnoremap ze zR
nnoremap zd zM
nnoremap ù `
" nnoremap <tab> :tabn<cr>
" nnoremap <s-tab> :tabp<cr>
nnoremap <tab> :bn!<cr>
nnoremap <s-tab> :bp!<cr>
nnoremap <c-tab> :bw<cr>
nnoremap <m-bs> :winc<space>w<cr>
nnoremap <s-bs> :winc<space>W<cr>
nnoremap <c-bs> :winc<space>q<cr>
nnoremap <c-n>  :cn<cr>
nnoremap <c-p>  :cp<cr>
nnoremap <leader>f  :find<space>**/*
nnoremap <leader>ta  :ta<space>*

nnoremap <F4> :w<space>!wc<space>-m<cr>
nnoremap <F8> :TagbarToggle<cr>
nnoremap <F10> :w<cr>

nnoremap à 0
vnoremap à 0

"nnoremap <leader>d dd

vnoremap < <gv
vnoremap > >gv

" nnoremap <leader>h gg
nnoremap <leader>g G

" vnoremap <leader>h gg
vnoremap <leader>g G

nnoremap <leader>b :ls!<cr>
nnoremap <leader>wb :call CloseExceptOne()<cr>
nnoremap <leader>sn ]s
nnoremap <leader>sp [s

function! CloseExceptOne ()
  let curr = bufnr('%')
  let last = bufnr('$')

  if curr > 1
    silent! execute "1,".(curr-1)."bw" 
  endif
  if curr < last
    silent! execute (curr+1).",".last."bw"
  endif
endfunction

"nnoremap <leader>tp :tabp<cr>
"nnoremap <leader>tn :tabn<cr>

onoremap in" :<c-u>normal! f"vi"<cr>
onoremap in' :<c-u>normal! f'vi'<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in< :<c-u>normal! f<vi<<cr>

" Unfortunately this shadows the command to add new word to dictionary
nnoremap zg  Gzz
nnoremap zs  zg
nnoremap <leader>h :noh<cr>

nnoremap <leader>co :w<space>!pbcopy<cr>
vnoremap <leader>co :w<space>!pbcopy<cr>

nnoremap <leader>pa :r<space>!pbpaste<cr>
vnoremap <leader>pa :r<space>!pbpaste<cr>

nnoremap <leader>or %bd<space><bar><space>e<space>#<cr>

set nobackup
set nowritebackup
set noswapfile
set wildignorecase
set ignorecase
set path+=**
set shell=/usr/local/bin/zsh
set shortmess+=c
"set notimeout
set ttimeout
set ttimeoutlen=10
set gfn=Monaco\ for\ Powerline:h24
" }}}

" edit vimrc and navigating quickly {{{
let $VIMRC="/Users/durand/.vimrc"
nnoremap <leader>ev :split  $MYVIMRC<cr>
nnoremap <leader>sv :source $MYGVIMRC<cr>
nnoremap <leader>eg :split  $MYGVIMRC<cr>
vnoremap <leader>ev :split  $MYVIMRC<cr>
vnoremap <leader>sv :source $MYGVIMRC<cr>
vnoremap <leader>eg :split  $MYGVIMRC<cr>
nnoremap ) }
nnoremap ( {
vnoremap ) }
vnoremap ( {
" }}}

" tex and haskell settings {{{
"augroup tex_and_haskell
"  autocmd!
  "autocmd FileType haskell  nnoremap <leader>c  :s /^/--<space>/g<cr>
  "autocmd FileType haskell  vnoremap <leader>c  :s /^/--<space>/g<cr>
  "autocmd FileType lhaskell nnoremap <leader>b  :s /^/><space>/g<cr>
  "autocmd FileType lhaskell vnoremap <leader>b  :s /^/><space>/g<cr>
  "autocmd FileType lhaskell nnoremap <leader>bu :s /^><space>//<cr>
  "autocmd FileType lhaskell vnoremap <leader>bu :s /^><space>//g<cr>
  "autocmd FileType haskell  nnoremap <leader>cu :s /^--<space>//<cr>
  "autocmd Filetype haskell  vnoremap <leader>cu :s /^--<space>//<cr>
  "autocmd Filetype haskell  vnoremap <leader>a  :Tabularize<space>/::<cr>
  "autocmd Filetype lhaskell vnoremap <leader>a  :Tabularize<space>/::<cr>
  "autocmd FileType tex      nnoremap <leader>c  :s/^/%<space>/g<cr>
  "autocmd FileType tex      nnoremap <leader>ll :VimtexCompile<cr>
  "autocmd FileType tex      imap             )  <Plug>(vimtex-delim-close)
"augroup END

let g:haskellmode_completion_ghc = 1
augroup haskell_plugin
  autocmd!
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup END
" }}}

" tex settings {{{
filetype plugin on
" set grepprg=grep\ -nH\ $*
filetype indent on
"let s:viewer="/Applications/Skim.app/Contents/SharedSupport/displayline"
let g:tex_flavor='tex'
set sw=2
set iskeyword+=:
let g:tex_fold_enabled=1
let g:tex_nospell=1
let g:tex_no_error=1
"let g:Tex_CompileRule_pdf = 'pdflatex'   
let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_callback = 'ViewerCallback'

function! ViewerCallback(status) dict
  if a:status
    VimtexView
  endif
endfunction

let g:vimtex_view_general_options = '-r @line @pdf @tex'
"let g:vimtex_view_general_options_latexmk = '-r 1'
let g:vimtex_latexmk_callback_hooks = ['UpdateSkim'] 
"let g:vimtex_fold_enabled = 0 "So large files can open more easily
let g:vimtex_imaps_leader = ","
function! UpdateSkim(status)
  if !a:status | return | endif

  let l:out = b:vimtex.out()
  let l:tex = expand('%:p')
  let l:cmd = [g:vimtex_view_general_viewer, '-r']
  if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
  endif
  if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out, l:tex])
  elseif has('job')
    call job_start(l:cmd + [line('.'), l:out, l:tex])
  else
    call system(join(l:cmd + [line('.'),
          \ shellescape(l:out), shellescape(l:tex)], ' '))
  endif
endfunction
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
      \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
      \ 're!\\hyperref\[[^]]*',
      \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\(include(only)?|input){[^}]*',
      \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
      \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
      \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
      \ ]
" }}}

" I don't really understand {{{ 
set completeopt=menuone,menu,longest

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox,rusty-tags.vi
set wildmode=full
" set wildmode=longest,list,full
set wildmenu
set completeopt+=longest

set t_Co=256

set cmdheight=1

map <Leader>s :SyntasticToggleMode<CR>
" }}}

" Narrow {{{
nnoremap <leader>nn :silent Widen<cr>HVL:Narrow<cr><c-o>
nnoremap <leader>nw :silent Widen<cr>
" }}}

" ghc mod settings {{{
nnoremap <silent> tw :GhcModTypeInsert<CR>
nnoremap <silent> tc :GhcModCheck<CR>
nnoremap <silent> tl :GhcModLint<CR>
nnoremap <silent> ts :GhcModSplitFunCase<CR>
nnoremap <silent> tq :GhcModType<CR>
nnoremap <silent> te :GhcModTypeClear<CR>
" }}}

" old statusline settings {{{
"define 3 custom highlight groups
"hi User1 ctermbg=green ctermfg=red   guibg=green guifg=red
"hi User2 ctermbg=red   ctermfg=blue  guibg=red   guifg=blue
"hi User3 ctermbg=blue  ctermfg=green guibg=blue  guifg=green
 
"set statusline=
"set statusline+=%1*  "switch to User1 highlight
"set statusline+=%f   "partial filename
"set statusline+=%2*  "switch to User2 highlight
"set statusline+=%y   "filetype
"set statusline+=%3*  "switch to User3 highlight
"set statusline+=%10((%l,%c)%)\   "line number and column
""set statusline+=%P   "percentage of file
"set statusline+=%*   "switch back to statusline highlight
"set statusline+=%P

"set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"

set laststatus=2
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
" }}}

" super tab and gui {{{
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
    imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
 if has("unix")
   inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
 endif
endif
" }}}

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Haskell file settings ---------------------- {{{
augroup filetype_haskell
  autocmd!
  autocmd FileType haskell setlocal foldmethod=marker
augroup END
" }}}

" map <Leader>n :NERDTreeToggle<CR>

let g:haskell_tabular = 1

" tabularize {{{
vmap a= :Tabularize /=<CR>
vmap a: :Tabularize /:<CR>
vmap a; :Tabularize /=\\|::<CR>
vmap a- :Tabularize /-><CR>
" }}}

" nnoremap <silent> <c-l> :CtrlP<CR>
" noremap <leader>b<space> :CtrlPBuffer<cr>
" let g:ctrlp_custom_ignore = '\v[\/]target$'
" let g:ctrlp_working_path_mode = 'c'
" let g:ctrlp_user_command = ['rg -l']

if executable('rg')
  set grepprg=rg\ --vimgrep
endif

if has('gui_running')
  set guifont=Monaco\ for\ Powerline:h11
endif

" syntax of brain fuck {{{
highlight BrainFuckLess    ctermfg=blue
highlight BrainFuckGreater ctermfg=red
highlight BrainFuckPlus    ctermfg=green
highlight BrainFuckMinus   ctermfg=yellow
highlight BrainFuckOutput  ctermfg=cyan
highlight BrainFuckInput   ctermfg=brown
highlight BrainFuckLoopL   ctermfg=magenta
highlight BrainFuckLoopR   ctermfg=darkred
" }}}

"execute pathogen#infect()
