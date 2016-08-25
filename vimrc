set nocompatible
filetype off                  " required

" Vundle plugin area {{{

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/Users/durand/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
"Bundle 'altercation/vim-colors-solarized'
"Plugin 'https://github.com/powerline/powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'lervag/vimtex'
Plugin 'Shougo/vimproc.vim', {'do' : 'make'}
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
call vundle#end()            " required
" }}}

" auxiliary settings {{{
set background=dark
let g:solarized_termcolors = 256
colorscheme vividchalk
syntax on
filetype plugin indent on

set number
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
set clipboard=unnamed

set autoread
set hlsearch
set backupdir=/Users/durand/Vim-SWP-files/
" }}}

" Ultisnips settings {{{

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips/"
" }}}

" Vim-notes settings{{{
let g:notes_directories = ['/Users/durand/Desktop/Centre/Mes notes/Les Notes']
" }}}

" airline and YCM {{{
let g:airline_extensions=['tabline']
let g:airline_powerline_fonts = 1
let g:ttimeoutlen = 10
let g:airline_theme='powerlineish'
"let g:airline#extensions#tabline#enabled = 1
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
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

" My zone of mappings {{{
let mapleader = ","
let maplocalleader = "©"

nnoremap ze zR
nnoremap ù `

nnoremap à 0
vnoremap à 0

nnoremap <leader>d dd

vnoremap < <gv
vnoremap > >gv

nnoremap <leader>h gg
nnoremap <leader>g G

vnoremap <leader>h gg
vnoremap <leader>g G

onoremap in" :<c-u>normal! f"vi"<cr>
onoremap in' :<c-u>normal! f'vi'<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap in( :<c-u>normal! f(vi(<cr>

set nobackup
set nowritebackup
set noswapfile
set shell=/bin/bash
set shortmess+=c
" }}}

" edit vimrc and navigating quickly {{{
let $VIMRC="/Users/durand/.vim/vimrc"
nnoremap <leader>ev :split  $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
vnoremap <leader>ev :split  $MYVIMRC<cr>
vnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap ) }
nnoremap ( {
"nnoremap } )
"nnoremap { (
vnoremap ) }
vnoremap ( {
" }}}

" tex and haskell settings {{{
augroup tex_and_haskell
  autocmd!
  autocmd FileType haskell  nnoremap <leader>c  :s /^/--<space>/g<cr>
  autocmd FileType haskell  vnoremap <leader>c  :s /^/--<space>/g<cr>
  autocmd FileType lhaskell nnoremap <leader>b  :s /^/><space>/g<cr>
  autocmd FileType lhaskell vnoremap <leader>b  :s /^/><space>/g<cr>
  autocmd FileType lhaskell nnoremap <leader>bu :s /^><space>//<cr>
  autocmd FileType lhaskell vnoremap <leader>bu :s /^><space>//g<cr>
  autocmd FileType haskell  nnoremap <leader>cu :s /^--<space>//<cr>
  autocmd Filetype haskell  vnoremap <leader>cu :s /^--<space>//<cr>
  autocmd Filetype haskell  vnoremap <leader>a  :Tabularize<space>/::<cr>
  autocmd Filetype lhaskell vnoremap <leader>a  :Tabularize<space>/::<cr>
  autocmd FileType tex      nnoremap <leader>c  :s/^/%<space>/g<cr>
  autocmd FileType tex      nnoremap <leader>ll :VimtexCompile<cr>
  "autocmd FileType tex      imap             )  <Plug>(vimtex-delim-close)
augroup END

let g:haskellmode_completion_ghc = 1
augroup haskell_plugin
  autocmd!
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup END
" }}}

" tex settings {{{
filetype plugin on
set grepprg=grep\ -nH\ $*
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

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest

set t_Co=256

set cmdheight=1

map <Leader>s :SyntasticToggleMode<CR>
" }}}

" ghc mod settings {{{
noremap <silent> tw :GhcModTypeInsert<CR>
noremap <silent> tc :GhcModCheck<CR>
noremap <silent> tl :GhcModLint<CR>
noremap <silent> ts :GhcModSplitFunCase<CR>
noremap <silent> tq :GhcModType<CR>
noremap <silent> te :GhcModTypeClear<CR>
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

map <Leader>n :NERDTreeToggle<CR>

let g:haskell_tabular = 1

" tabularize {{{
vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
" }}}

noremap <silent> <Leader>t :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'

execute pathogen#infect()
