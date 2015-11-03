"Profile VIM startup [http://www.vim.org/scripts/script.php?script_id=2915]
" let g:startup_profile_csv = "/home/yves/vim_startup_profile_log.csv"
" runtime macros/startup_profile.vim

" This must be first, because it changes other options as a side effect.
set nocompatible " Use Vim settings, rather then Vi settings (much better!).
filetype off

" Vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim_new/bundle/Vundle.vim
" set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'grazhopper/inkpot'
Plugin 'scrooloose/nerdtree'
Plugin 'mhinz/vim-signify'
Plugin 'bling/vim-airline'
"Plugin 'justinmk/vim-sneak'
"Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
" TOCHECK: https://github.com/terryma/vim-multiple-cursors
Plugin 'easymotion/vim-easymotion'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" General settings
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set hidden
set history=1000
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set number      " show numbers
set scrolloff=3     " Minimal number of lines to keep above/below cursor
set secure          " disable unsafe commands in local .vimrc files

set incsearch       " do incremental searching
set hlsearch        " highlight search matches
set ignorecase
set smartcase       " Do case sensitive search if capital characters are present


set cursorline   " Indicate location of cursor with line

set ttyfast

set showmode

set grepprg=grep\ -nH\ $*
set autoindent      " always set autoindenting on

set shiftwidth=4 tabstop=4 softtabstop=4

set lazyredraw      " to check in combinatie met utl
"set splitbelow      " Do not set this, minibufexpl ends up at the bottom ;)

"set titlestring=%f title    " Display filename in terminal window

set autowrite

set timeoutlen=500

set showmatch       " Briefly highlight the matching bracket when closing

set gdefault

set listchars=tab:▸\ ,eol:¬,trail:⋅ "Show tabs, eol and spaces when 'list' option is set
"set listchars=tab:>-,eol:$,trail:.,extends:#

"setlocal spell spelllang=en_us,nl
"setlocal spell!

" Autocomplete in statusbar
set wildmode=longest,list
set wildmenu
set wildignore+=*.pdf,*.class,*.o,*.pyc

" Mouse settings
" set mouse=a

" Create :ex-mode commands to edit/source .vimrc
com! -nargs=0 Erc :e ~/.vimrc
com! -nargs=0 Src :so ~/.vimrc


""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""""""""""""""""""""""
" [http://www.linux.com/archive/feature/120126]:
"set statusline=%F%m%r%h%w\ [TYPE=%Y]\ %{fugitive#statusline()}\ \ \ \ \ \ \ \ [POS=%2l,%2v][%p%%]\ \ \ \ \ \ \ [LEN=%L]

"\\ Wannes:
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" [http://vim.wikia.com/wiki/Writing_a_valid_statusline]:
"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%d/%m/%Y-%H:%M\")}%=\ col:%c%V\ ascii:%b\ pos:%o\ lin:%l\,%L\ %P
"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %=\ %l,%c%V\ \ \ [%L\ -\ %p%%]

" [https://wincent.com/wiki/Set_the_Vim_statusline]
"  +-> default:    set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

" My version
"set statusline=%<%n:%f%h%3*%m%0*%r%h%w\ %y\ %{fugitive#statusline()}%=\ \ %-30.(line:\ %l\ of\ %L,\ col:\ %c%V\%)\ %3p%%\ (%{&ff})

set laststatus=2    " always show statusline

""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting and color schemes
""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax enable
endif

if has("gui_running")
"    colorscheme navajo

    let g:inkpot_black_background=1
    colorscheme inkpot
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 8
else
" 256 colors color scheme!!
" colorscheme inkpot
" set background=dark
" set background=light
    set t_Co=256

"   let g:molokai_original=1
"   colorscheme molokai

    let g:inkpot_black_background=1
    colorscheme inkpot

    let g:zenburn_high_Contrast=1
"   colorscheme zenburn
endif


""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""
"  filetype plugin indent on "TOCHECK
"  filetype plugin on "TOCHECK

autocmd FileType text setlocal textwidth=75
autocmd FileType mail setlocal fo+=aw

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

autocmd BufEnter           *        syntax sync fromstart " ensure every file does syntax highlighting (full)

""""""""""""""""""""""""""""""""""""""""""""""""""
" File types
""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile *.pyf set filetype=fortran

augroup filetypedetect
    au! BufRead,BufNewFile *.mac      setfiletype maxima
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-n> :NERDTree<CR>

" """"""""""""""""""""""""""""""""""""""""""""""""""
" " a.vim [http://www.vim.org/scripts/script.php?script_id=31]
" """"""""""""""""""""""""""""""""""""""""""""""""""
" " nmap <Leader>a :A<CR>
" " nmap <F6> :A<CR>
" "
" " Switch using <M-o> (only works in gvim)
" map <M-o> :A<CR>
" " Make <M-o> also work in console vim
" map o :A<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" FSwitch (alternative to a.vim)
""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch using <M-o> (only works in gvim)
"nmap <silent> <M-o> :FSHere<cr>
" Make <M-o> also work in console vim
" map o :FSHere<CR>


" """"""""""""""""""""""""""""""""""""""""""""""""""
" " Command-T
" """"""""""""""""""""""""""""""""""""""""""""""""""
" let g:CommandTMaxHeight=10

" """"""""""""""""""""""""""""""""""""""""""""""""""
" "TAGLIST
" """"""""""""""""""""""""""""""""""""""""""""""""""
" "let Tlist_Show_Menu = 1
" "nnoremap <silent> <F8> :TlistToggle<CR>
" "nnoremap <silent> <F8> :TlistOpen<CR>
" "map ,d :TlistOpen<CR>
" let Tlist_GainFocus_On_ToggleOpen = 1
" map <Leader>b :TlistToggle<CR>
" "map <Leader>b :TlistOpen<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags
""""""""""""""""""""""""""""""""""""""""""""""""""
set tags+=./tags,tags,~/.vim/tags/cpp

" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"map <C-x><C-x><C-T> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/.vim/commontags /usr/include /usr/local/include ~/.vim/tags/cpp_src<CR><CR>
"map <C-x><C-x><C-T> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/.vim/commontags /usr/include/boost/python /usr/include/boost/python.hpp<CR><CR>
"set tags+=~/.vim/commontags



""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion
""""""""""""""""""""""""""""""""""""""""""""""""""
""" " OmniCppComplete
let g:OmniCpp_SelectFirstItem = 2
let OmniCpp_NamespaceSearch = 1 " do not search in included files
""" let OmniCpp_GlobalScopeSearch = 1
""" let OmniCpp_ShowAccess = 1
""" let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
""" let OmniCpp_MayCompleteDot = 1 " autocomplete after .
""" let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
""" let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
""" let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

inoremap <c-n> <C-R>=pumvisible() ? "\<lt>Down>" : "\<lt>c-n>\<lt>Down>"<CR>
inoremap <c-p> <C-R>=pumvisible() ? "\<lt>Up>" : "\<lt>c-p>\<lt>Down>"<CR>
inoremap <c-j> <C-R>=pumvisible() ? "\<lt>Down>" : "\<lt>c-j>"<CR>
inoremap <c-k> <C-R>=pumvisible() ? "\<lt>Up>" : "\<lt>c-k>"<CR>
"" http://vim.wikia.com/wiki/ _Vim_completion_popup_menu_work_just_like_in_an_IDE
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

set completeopt=menuone,menu,longest
"set completeopt+=preview " preview window for completion (e.g., function signature)

" """"""""""""""""""""""""""""""""""""""""""""""""""
" " Minibuf
" """"""""""""""""""""""""""""""""""""""""""""""""""
" let g:miniBufExplTabWrap = 1          " make tabs show complete (not broken on two lines)
let g:miniBufExplMapWindowNavVim = 1    " enable window movement with
                                        "<C-vimkeys> (=[hjkl]). This is a lot
                                        "faster than '<C-W> vimkey'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Matchit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let b:match_ignorecase = 1


""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""
" Supertab
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabRetainCompletionDuration = "insert"
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestEnhanced = 1
let g:SuperTabCrMapping = 0         " Do not chosen completion when pressing <CR>
let g:SuperTabLongestHighlight = 1  " highlight first option
let g:SuperTabLeadingSpaceCompletion = 0 " do not complete leading whitespace
"let g:SuperTabContextDefaultCompletionType = "<Down>"

""""""""""""""""""""""""""""""""""""""""""""""""""
" Omni-completion using <C-space>
""""""""""""""""""""""""""""""""""""""""""""""""""
" [ http://stackoverflow.com/questions/510503/ctrlspace-for-omni-and-keyword-completion-in-vim ]
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
        \ "\<lt>C-n>\<lt>Down>" :
    \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
    \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
    \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Align
""""""""""""""""""""""""""""""""""""""""""""""""""
""" map <Leader>al :AlignLeft<CR> \\
""" map <Leader>ar :AlignRight<CR> \\
""" map <Leader>ac :AlignCenter<CR> \\
""" map <Leader>aj :AlignJustify<CR> \\

""""""""""""""""""""""""""""""""""""""""""""""""""
" SnipMate
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snips_author = 'Yves Frederix'
let g:snips_mail = 'Yves.Frederix@gmail.com'
" To change the trigger key -> after/plugin/snipMate.vim


""""""""""""""""""""""""""""""""""""""""""""""""""
" UTL
""""""""""""""""""""""""""""""""""""""""""""""""""
" noremap <silent> gu :Utl<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter
""""""""""""""""""""""""""""""""""""""""""""""""""
" map <c-/> <plug>NERDCommenterToggle " werkt niet??

" """"""""""""""""""""""""""""""""""""""""""""""""""
" " ProtoGetter
" """"""""""""""""""""""""""""""""""""""""""""""""""
" let g:protodefprotogetter = '/home/yves/.vim/bundle/vim-protodef-git/pullproto.pl'
" let g:disable_protodef_mapper = '1'
" let g:disable_protodef_sorting = '1'

""""""""""""""""""""""""""""""""""""""""""""""""""
" Delimitmate
""""""""""""""""""""""""""""""""""""""""""""""""""
let delimitMate_autoclose = 1
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

" """"""""""""""""""""""""""""""""""""""""""""""""""
" " Neocomplcache
" """"""""""""""""""""""""""""""""""""""""""""""""""
" let g:neocomplcache_enable_smart_case = 1

""""""""""""""""""""""""""""""""""""""""""""""""""
" Cool tips
""""""""""""""""""""""""""""""""""""""""""""""""""
" Make . behave more logically [http://vim.wikia.com/wiki/VimTip1142]
nmap . .`[
vnoremap <silent> . :normal .<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto highlight certain words
""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
"
"" autocmd CursorMoved * silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))))
"
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000 " default value
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\<'.expand('<cword>').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy-motion
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map ,j <Plug>(easymotion-j)
map ,k <Plug>(easymotion-k)

""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc keyboard mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
" Prevent Q keypress to enter Ex mode. Use Q, e.g., for formatting
"unmap Q

" Move between buffers
nmap <PageUp> :bn <CR>
nmap <PageDown> :bp <CR>

" Spell check
nmap <F8> :setlocal spell!<CR>

" Change menu colors + add keys for insert-mode completion
"highlight   Pmenu               term=NONE cterm=NONE ctermfg=0 ctermbg=7 gui=NONE guifg=Black guibg=White
"highlight   PmenuSel            term=NONE cterm=NONE ctermfg=7 ctermbg=5 gui=NONE guifg=White guibg=Magenta
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>

" " Make sure <meta-...> work in both gvim and console, no matter if meta8 is
" " set [http://vim.wikia.com/wiki/Mapping_fast_keycodes_in_terminal_Vim]
" set <m-l>=l
" set <m-h>=h
" set <m-->=-
" set <m-=>==
" --> NOPE interacts with <esc> and then h/l :s

" Move left/right in insert mode
" - Map meta-l in gvim and console vim
inoremap <m-l> <right>
" - Map meta-h in gvim and console vim
inoremap <m-h> <left>

" Toggle line numbers
map <F12> <Esc>:set number!<CR>

" Toggle paste mode
map <F11> :set invpaste<CR>

" Open file under cursor, create if necessary
nnoremap gF :edit <cfile><CR>

" Titlise Visually Selected Text
vmap ,t :s/\<\(.\)\(\k*\)\>/\u\1\L\2/g<CR>

" Quick reset of colors if not in 256 colors enabled terminal
map <F10> :set t_Co=8<CR>:colorscheme default<CR>

" Highlight lines that are too long (using current value of textwidth)
nnoremap <silent> <Leader>l
      \ :if exists('w:long_line_match') <Bar>
      \   silent! call matchdelete(w:long_line_match) <Bar>
      \   unlet w:long_line_match <Bar>
      \ elseif &textwidth > 0 <Bar>
      \   let w:long_line_match = matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1) <Bar>
      \ else <Bar>
      \   let w:long_line_match = matchadd('ErrorMsg', '\%>80v.\+', -1) <Bar>
      \ endif<CR>

" Maps for highlighting of cursorline
"nnoremap <Leader>c :set cursorline! <CR>   " toggle cursorline highlighting
" Only show cursorline in current buffer
"autocmd WinEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline
" Remove cursorline when entering insert mode
"autocmd InsertEnter * setlocal nocursorline
"autocmd InsertLeave * setlocal cursorline

" Toggle list option (to show tabs, eol and spaces)
nmap <Leader>s :set list!<CR>

" Mapping to hide menubar/toolbar visibility in gvim
set guioptions-=T
set guioptions-=m
map <silent> <C-F2> :if &guioptions =~# 'T' <Bar>
                         \set guioptions-=T <Bar>
                         \set guioptions-=m <bar>
                    \else <Bar>
                         \set guioptions+=T <Bar>
                         \set guioptions+=m <Bar>
                    \endif<CR>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

function! HighlightRepeats() range
  let lineCounts = {}
  let lineNum = a:firstline
  while lineNum <= a:lastline
    let lineText = getline(lineNum)
    let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
    let lineNum = lineNum + 1
  endwhile
  exe 'syn clear Repeat'
  for lineText in keys(lineCounts)
    if lineCounts[lineText] >= 2
      exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
    endif
  endfor
endfunction

command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()

" Cleanup trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" vim: expandtab
