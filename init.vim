
call plug#begin('~/.vim/plugged')

function! DoRemote(arg)
 UpdateRemotePlugins
endfunction

Plug 'vim-scripts/indentpython.vim'

Plug 'Shougo/denite.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
"Plug 'neomake/neomake'
autocmd VimResized * wincmd =

call plug#end()


set number
set clipboard+=unnamedplus

"let g:neomake_python_enabled_makers = ['flake8', 'pep8', 'vulture']
"autocmd! BufWritePost,BufEnter * Neomake
"let g:neomake_warning_sign = {
"  \ 'text': 'W',
"  \ 'texthl': 'WarningMsg',
"  \ }

"let g:neomake_error_sign = {
"  \ 'text': 'E',
"  \ 'texthl': 'ErrorMsg',
"  \ }

"let g:neomake_python_flake8_maker = { 'args': ['--ignore=E115,E266,E501,E101'], }
"let g:neomake_python_pep8_maker = { 'args': ['--max-line-length=100', '--ignore=E115,E266,W191'], }

"call denite#custom#var('file_rec', 'command',
 "     \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])



" Change mappings.

call denite#custom#map(
      \ 'insert',
      \ 'K',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'insert',
      \ 'L',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)



" Change sorters.

call denite#custom#source(
      \ 'file_rec', 'sorters', ['sorter_sublime'])



" Change default prompt

call denite#custom#option('default', 'prompt', '➤ ')



" Change ignore_globs

call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/*', '*.pyc',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/', '*.png'])



nnoremap <space>f :Denite file_rec -quick-match -auto-preview -winheight=10 <cr>

nnoremap <space>v :Denite file_rec -default-action=vsplit<cr>

nnoremap <space>s :Denite file_rec -default-action=split<cr>

nnoremap <space>e :Denite file_rec -winheight=10 <cr>

nnoremap <space>m :Denite file_mru -winheight=10 -vertical-preview -auto-preview <cr>

nnoremap <space>l :Denite line -auto-preview<cr>

nnoremap <space>b :Unite -quick-match buffer<cr>

nnoremap gd <c-]>


