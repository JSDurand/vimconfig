" Further vimtex configurations {{{
call vimtex#imaps#add_map({
  \ 'lhs' : 'fk',
  \ 'rhs' : '\mathfrak{',
  \ 'wrapper' : 'vimtex#imaps#wrap_trivial'
  \})

call vimtex#imaps#add_map({
  \ 'lhs' : 'bb',
  \ 'rhs' : '\mathbb{',
  \ 'wrapper' : 'vimtex#imaps#wrap_trivial'
  \})

call vimtex#imaps#add_map({
  \ 'lhs' : 'cl',
  \ 'rhs' : '\mathcal{',
  \ 'wrapper' : 'vimtex#imaps#wrap_trivial'
  \})

call vimtex#imaps#add_map({
  \ 'lhs' : 'hm',
  \ 'rhs' : '\Hom{',
  \ 'wrapper' : 'vimtex#imaps#wrap_trivial'
  \})

call vimtex#imaps#add_map({
  \ 'lhs' : 'sr',
  \ 'rhs' : '\mathsr{',
  \ 'wrapper' : 'vimtex#imaps#wrap_trivial'
  \})
" }}}

" Normal mappings {{{
nnoremap <buffer> <leader>ll :VimtexCompile<cr>
nnoremap <buffer> <leader>c  :s/^/%<space>/g<cr>
nnoremap <buffer> <leader>lv :VimtexView<cr>
nnoremap <buffer> <leader>en diWi\begin{<esc>pa}<cr>\end{<esc>pa}<esc>O
"nnoremap <buffer> <leader>de  :call <SID>DeleteEnv()<cr>
"nnoremap <buffer> <leader>dae :call <SID>DeleteAllEnv()<cr>
"nnoremap <buffer> <leader>ce  :call <SID>ChangeEnv()<cr>
"nnoremap <buffer> <c-e>       :call <SID>DetermineSnippet()<cr>
"nnoremap <buffer> <c-j>       :call <SID>MyJumpInFile("<+++>")<cr>
" }}}

" Insert mappings {{{
"inoremap <buffer> <c-e> <c-r>=<SID>DetermineSnippet()<cr>
" }}}

" Variables {{{
let s:my_snippet_dir = "/Users/durand/.vim/snippets/MySnippets/"
" }}}

" Functions {{{
function! s:ChangeEnv ()
  let a:text_of_env = input("Change environment to: ")
  let a:start_text = "\\begin{" . a:text_of_env . "}"
  let a:end_text = "\\end{" . a:text_of_env . "}"
  execute "normal mm?\\\\begin{\<cr>%:put =a:end_text\<cr>kdd\<c-o>ddk:put =a:start_text\<cr>`m"
endfunction

function! s:DeleteEnv ()
  execute "normal ma?\\\\begin{\<cr>md%dd`ddd`a"
endfunction

function! s:DeleteAllEnv ()
  execute "normal ?\\\\begin{\<cr>v%d"
endfunction

function! s:DetermineSnippet ()
  execute "normal! bmm"
  let a:word_under_cursor = expand("<cword>")
  if a:word_under_cursor ==# "sec"
    execute "normal! diw"
    call <SID>InsertSectionSnippet()
  elseif a:word_under_cursor ==# "sub"
    execute "normal! diw"
    call <SID>InsertSubSectionSnippet()
  elseif a:word_under_cursor ==# "fra"
    execute "normal! mmdiw"
    execute "normal i\\frac{<+++>{first field}}{<+++>{second field}}<+++>{last} \<esc>`m"
    call <SID>MyJumpInFile("<+++>")
  else
    let a:all_snippets_list = filter(map(split(globpath(s:my_snippet_dir,"*"),'\n'),'fnamemodify(v:val,":p:t:r")'),'len(v:val)')
    if index(a:all_snippets_list, a:word_under_cursor) >= 0
      execute "normal! :read " . s:my_snippet_dir . a:word_under_cursor . ".mysnip\<cr>"
      execute "normal! `mdiw"
      call <SID>MyJumpInFile("<+++>")
    else
      echom "No snippet found!"
    endif
  endif
  return ""
endfunction

function! s:MyJumpInFile(marker)
  if search(a:marker) > 0
    "echom "A report."
    execute "normal da<vt}h\<esc>\"adi}da}h\"apgv"
  else
    echom "At the last field already!"
  endif
endfunction

function! s:InsertSectionSnippet ()
  let a:section_name = input("Enter section name: ")
  let a:section_label_name = substitute(tolower(a:section_name), " ", "_", "g")
  execute "normal! i\\section{" . a:section_name . "}\<cr>\\label{sec:" . a:section_label_name . "}\<esc>o"
  return ""
endfunction

function! s:InsertSubSectionSnippet ()
  let a:subsection_name = input("Enter subsection name: ")
  let a:subsection_label_name = substitute(tolower(a:subsection_name), " ", "_", "g")
  execute "normal! i\\subsection{" . a:subsection_name . "}\<cr>\\label{sub:" . a:subsection_label_name . "}\<esc>o"
  return ""
endfunction
" }}}



