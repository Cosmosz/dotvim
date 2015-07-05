execute pathogen#infect()
filetype plugin indent on
set nocompatible
set ruler
syntax enable
set encoding=utf-8
set number
setlocal colorcolumn=81
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start

set cursorline

set incsearch
set ignorecase
set smartcase
set background=dark
colorscheme gruvbox
set laststatus=2

let g:vim_markdown_folding_disabled=1
"let g:vroom_use_vimshell=1

" jsbeautify
let g:config_Beautifier = {
            \ 'js' : {
                \ 'indent_size' : 2,
                \ 'indent_style' : 'space',
                \ },
            \ 'css' : {
                \ 'indent_size' : 2,
                \ 'indent_style' : 'space',
                \ },
            \ 'html' : {
                \ 'indent_size' : 2,
                \ 'indent_style' : 'space',
                \ }
            \ }
autocmd FileType javascript noremap <silent> <Leader>js :call JsBeautify()<cr>
autocmd FileType html noremap <silent> <Leader>js :call HtmlBeautify()<cr>
autocmd FileType css,less noremap <silent> <Leader>js :call CSSBeautify()<cr>




if has("gui_running")
  if has("autocmd")
    " Automatically resize splits when resizing MacVim window
    autocmd VimResized * wincmd =
  endif
endif
nmap <leader>n :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 31
" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers=['rubocop']
let g:syntastic_python_checkers=['pep8']
let g:syntastic_javascript_checkers=['jscs']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" fugitive mappings
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gd :Gdiff<CR>

" NERDCommenter mappings
if has("gui_macvim") && has("gui_running")
  map <D-/> <plug>NERDCommenterToggle<CR>
  imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i
else
  map <leader>/ <plug>NERDCommenterToggle<CR>
endif

"Indetation
if has("gui_macvim") && has("gui_running")
  vmap <D-]> >gv
  vmap <D-[> <gv

  nmap <D-]> >>
  nmap <D-[> <<

  omap <D-]> >>
  omap <D-[> <<

  imap <D-]> <Esc>>>i
  imap <D-[> <Esc><<i
else
  vmap <A-]> >gv
  vmap <A-[> <gv

  nmap <A-]> >>
  nmap <A-[> <<

  omap <A-]> >>
  omap <A-[> <<

  imap <A-]> <Esc>>>i
  imap <A-[> <Esc><<i
endif
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }
" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/node_modules/*
" Ignore bundler and sass cache
set wildignore+=*/vendor/assets/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

set backupdir=~/.vim/_backup//    " where to put backup files.
set directory=~/.vim/_temp//      " where to put swap files.
