set nocompatible
let mapleader = " "
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Tim Pope
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-eunuch'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'
Plugin 'glts/vim-textobj-comment'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/Tabmerge'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'rking/ag.vim'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-user'
Plugin 'whiteinge/diffconflicts'
Plugin 'rafi/awesome-vim-colorschemes'

call vundle#end()
filetype plugin indent on

autocmd FileType coffee set commentstring=#\ %s

let g:syntastic_ruby_checkers = ['mri', 'rubylint', 'rubocop']
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = 'S⚠'
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = 'S✗'
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:ctrlp_map = '<c-p>'
let g:EasyMotion_smartcase = 1
let g:rspec_command = "Dispatch bundle exec rspec {spec}"

" Write current buffer if changed before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 1

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

nmap <Leader>SY :SyntasticCheck<CR> :SyntasticToggleMode<CR>
nmap mt :Tabmerge right<CR>
nmap mT :Tabmerge left<CR>
nmap <Leader>st :w<cr>:call RunCurrentSpecFile()<CR>
nmap <Leader>sn :w<cr>:call RunNearestSpec()<CR>
nmap <Leader>sl :w<cr> :call RunLastSpec()<CR>
nmap <Leader>sa :w<cr>:call RunAllSpecs()<CR>
nmap <Leader>rr :!ruby -Ilib %<CR>
nmap <Leader>mn :!jasmine-node %<CR>
nmap <Leader>% :%s/\<<C-r><C-w>\>//g<Left><Left>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gr :Gread<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>ge :Gedit<CR>
nmap <C-J> o<Esc>
nmap <C-K> O<Esc>
nmap <C-x> :Vex<CR>
nmap <Leader>pr orequire 'pry'; binding.pry<ESC>:w<CR>
nmap <C-s> :w<CR>
vmap <C-s> <Esc><c-s>gv
imap <C-s> <Esc><c-s>
nmap <F7> mzgg=G`z<CR>
nmap Q gq
cmap w!! w !sudo tee % > /dev/null
nnoremap <silent><leader><C-J> <C-w><C-]><C-w>T
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

set pastetoggle=<F2>
set timeoutlen=500   " Don't wait so long for the next keypress
set visualbell
set ignorecase
set relativenumber
set number
set nobackup
set nowritebackup
set noswapfile
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set autowriteall
set t_Co=256
set clipboard=unnamed
set nrformats=
set gdefault
set wildmenu
set wildmode=full
set nofixendofline

set background=dark
colorscheme twilight256
syntax enable

autocmd BufWritePre *.js, *.cls, *.xml %s/\s\+$//e

augroup AutoWrite
    autocmd! BufLeave * :update
augroup END

au BufReadPost *.cls  set syntax=java
au BufReadPost *.js  set syntax=javascript
au BufReadPost *.cmp  set syntax=html
au BufReadPost *.evt  set syntax=html
au BufReadPost *.wsdl set syntax=xml
au BufReadPost *.component set syntax=html

" statusline setup
set statusline =%#identifier#

set statusline+=[%t]    "tail of the filename
set statusline+=%*

" display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

" display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      " help file flag
set statusline+=%y      " filetype

" read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

" modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*

set statusline+=%{fugitive#statusline()}

" display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%{StatuslineTrailingSpaceWarning()}

set statusline+=%{StatuslineLongLineWarning()}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      " left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c,     " cursor column
set statusline+=%l/%L   " cursor line/total lines
set statusline+=\ %P    " percent through file
set laststatus=2

" recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

" return '[\s]' if trailing white space is detected
" return '' otherwise
function! StatuslineTrailingSpaceWarning()
  if !exists("b:statusline_trailing_space_warning")

    if !&modifiable
      let b:statusline_trailing_space_warning = ''
      return b:statusline_trailing_space_warning
    endif

    if search('\s\+$', 'nw') != 0
      let b:statusline_trailing_space_warning = '[\s]'
    else
      let b:statusline_trailing_space_warning = ''
    endif
  endif
  return b:statusline_trailing_space_warning
endfunction

" return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
  let name = synIDattr(synID(line('.'),col('.'),1),'name')
  if name == ''
    return ''
  else
    return '[' . name . ']'
  endif
endfunction

" recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

" return '[&et]' if &et is set wrong
" return '[mixed-indenting]' if spaces and tabs are used to indent
" return an empty string if everything is fine
function! StatuslineTabWarning()
  if !exists("b:statusline_tab_warning")
    let b:statusline_tab_warning = ''

    if !&modifiable
      return b:statusline_tab_warning
    endif

    let tabs = search('^\t', 'nw') != 0

    " find spaces that arent used as alignment in the first indent column
    let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

    if tabs && spaces
      let b:statusline_tab_warning =  '[mixed-indenting]'
    elseif (spaces && !&et) || (tabs && &et)
      let b:statusline_tab_warning = '[&et]'
    endif
  endif
  return b:statusline_tab_warning
endfunction

" recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

" return a warning for "long lines" where "long" is either &textwidth or 80 (if
" no &textwidth is set)
"
" return '' if no long lines
" return '[#x,my,$z] if long lines are found, were x is the number of long
" lines, y is the median length of the long lines and z is the length of the
" longest line
function! StatuslineLongLineWarning()
  if !exists("b:statusline_long_line_warning")

    if !&modifiable
      let b:statusline_long_line_warning = ''
      return b:statusline_long_line_warning
    endif

    let long_line_lens = s:LongLines()

    if len(long_line_lens) > 0
      let b:statusline_long_line_warning = "[" .
            \ '' . len(long_line_lens) . "long" . "]"
      " \ 'm' . s:Median(long_line_lens) .
      " \ '$' . max(long_line_lens) .
    else
      let b:statusline_long_line_warning = ""
    endif
  endif
  return b:statusline_long_line_warning
endfunction

" return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
  let threshold = (&tw ? &tw : 80)
  let spaces = repeat(" ", &ts)
  let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
  return filter(line_lens, 'v:val > threshold')
endfunction

" find the median of the given array of numbers
function! s:Median(nums)
  let nums = sort(a:nums)
  let l = len(nums)

  if l % 2 == 1
    let i = (l-1) / 2
    return nums[i]
  else
    return (nums[l/2] + nums[(l/2)-1]) / 2
  endif
endfunction
" end statusline setup

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.

    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif
  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

function! TrimEndLines()
  let save_cursor = getpos(".")
  :silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
endfunction

au BufWritePre *.* call TrimEndLines()

function! s:rmdir()
  let b = &ft ==? 'dirvish' ? getline('.') : fnamemodify(bufname(''),':p').getline('.')
  if input('delete '.b.' ? (y/n)') ==# 'y'
    if !delete(b,'rf')
      let a = getpos('.')
      if &ft ==? 'dirvish'
        e
        call setpos('.',a)
      elseif &ft ==? 'netrw'
        if search('^\.\/$','Wb')
          exe "norm \<cr>"
          call setpos('.',a)
        endif
      endif
    endif
  endif
endfunction
command! Rmnetrw call <SID>rmdir()

autocmd bufwritepost .tmux.conf execute ':!tmux source-file %'
autocmd bufwritepost .tmux.local.conf execute ':!tmux source-file %'
