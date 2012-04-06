"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Shawn Tice, with lots of help from the internet. 
" Modified by Tim Asp to his liking
" 
"

" Set this to the base of your Code directory
set path=/Personal/Code/smart/**      
                          " wherever you want to find 
set guioptions=aMm       " No toolbar in the gui; must be first in .vimrc.

behave xterm

colorscheme corporation

set nocompatible         " No compatibility with vi.
filetype on              " Recognize syntax by file extension.
filetype indent on       " Check for indent file.
filetype plugin on       " Allow plugins to be loaded by file type.
syntax on                " Syntax highlighting.

if exists('+colorcolumn')
 set cc=80
endif

set autowrite             " Write before executing the 'make' command.
set smartindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
"
 set expandtab             " Expand tabs with spaces.
 set softtabstop=3         " See spaces as tabs.
 set tabstop=3             " <Tab> move three characters.
 set shiftwidth=3          " >> and << shift 3 spaces.

 set background=light      " Background light, so foreground not bold.
 set backspace=2           " Allow <BS> to go past last insert.
 set nofoldenable          " Disable folds; toggle with zi.
 set gdefault              " Assume :s uses /g.
 set ignorecase            " Ignore case in search patterns.
 set incsearch             " Immediately highlight search matches.

 set modeline              " Check for a modeline.
 set noerrorbells          " No beeps on errors.
 set nohls                 " Don't highlight all regex matches.
 set nowrap                " Don't soft wrap.
 set number                " Display line numbers.
 set ruler                 " Display row, column and % of document.
 set scrolloff=10          " Keep min of 10 lines above/below cursor.
 set showcmd               " Show partial commands in the status line.
 set showmatch             " Show matching () {} etc..
 set showmode              " Show current mode.
 set smartcase             " Searches are case-sensitive if caps used.
 set textwidth=79          " Hard wrap at 79 characters.
 set virtualedit=block     " Allow the cursor to go where there's no char.
 set wildmode=longest,list " Tab completion works like bash.
 set vb t_vb=".              

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Set some configuration variables.
"
 let loaded_matchparen=1   " Don't do automatic bracket highlighting.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Formatting settings

" Formatting options.
" t: Auto-wrap text using textwidth. (default)
" c: Auto-wrap comments; insert comment leader. (default)
" q: Allow formatting of comments with "gq". (default)
" r: Insert comment leader after hitting <Enter>.
" o: Insert comment leader after hitting 'o' or 'O' in command mode.  n:
" Auto-format lists, wrapping to text *after* the list bullet char.  l:
" Don't auto-wrap if a line is already longer than textwidth.
 set formatoptions+=ronl

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-line cartography

" Use sudo to save the current file.
 :command WW w !sudo tee % >/dev/null

" Stupid shift mistakes.
 :command W w
 :command Q q

" Gangster splits/finds
 :command! -nargs=+ Vfind :vsp | :find <args>
 :command! -nargs=+ Sfind :sp | :find <args>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command mode cartography

" Make Q reformat text.
 noremap Q gq

" Toggle paste mode.
 noremap <Leader>p :set paste!<CR>

" Open the file under the cursor in a new tab.
 noremap <Leader>ot <C-W>gf

" Toggle highlighting of the last search.
 noremap <Leader>h :set hlsearch! hlsearch?<CR>

" Open a scratch buffer.
 noremap <Leader>s :Scratch<CR>

" Execute an :lcd to the directory of the file being edited.
 function LcdToCurrent()
    let dir = expand("%:h")
    execute "lcd " . dir
 endfunction
 noremap <Leader>cd :call LcdToCurrent()<CR>

let g:EasyMotion_leader_key = '<Leader>' 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlighting

" Programming
 highl Comment gui=italic guifg=#d0a4ef ctermfg=lightMagenta
 highl Identifier guifg=#30619f ctermfg=darkCyan
 highl Function guifg=#30619f ctermfg=darkCyan
 highl Statement guifg=#ab7e45 ctermfg=brown
 highl String guifg=#d87b77 ctermfg=red
 highl Constant guifg=#ff9595 ctermfg=lightRed

" Spelling
 highl SpellBad ctermbg=White ctermfg=Red
 highl SpellCap ctermbg=White ctermfg=DarkBlue
 highl SpellRare ctermbg=White ctermfg=Brown
 highl SpellLocal ctermbg=White ctermfg=DarkCyan


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Restore the cursor when we can.
"
"
function! RestoreCursor()
  if line("'\"") <= line("$")
     normal! g`"
     normal! zz
  endif
endfunction
autocmd BufWinEnter * call RestoreCursor()

