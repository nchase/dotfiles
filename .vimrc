" this should be at the beginning of any good vimrc file.
" google it or see here: http://www.linuxfromscratch.org/blfs/view/5.1/postlfs/vimrc.html
set nocompatible

set exrc " enable per-directory .vimrc files

call pathogen#infect()

" general settings
syntax enable

set background=dark
colorscheme solarized


" "I never use semicolon in vim for ANYTHING."
" make it behave like the much more useful colon instead:
nnoremap ; :

set number                         " add line numbers

set directory=$HOME/.vim/tmp//,.   " save vim's tempfiles to home directory

filetype plugin indent on          " default to filetype-specific plugins and indentations
set ignorecase                     " ignore case on search
set autoindent                     " add indentation
set listchars=tab:→\ ,trail:•      " set trailing space and tab characters
set list                           " actually show listchars.

  " key mappings
    :nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR> " F5 = remove trailing spaces
    :let g:surround_33 = "<!-- \r -->"  " hotkey to surround text with html comments

    " find-and-replace dangerous special characters:
    ":nnoremap <F4> :%s/‘\<Bar>’\<Bar>”\<Bar>“\<Bar>†\<Bar>‡\<Bar>™\<Bar>©\<Bar>®\<Bar>•\<Bar>¹\<Bar>²\<Bar>³\<Bar>–\<Bar>–\<Bar>—\<Bar>…//gc<CR>
    :nnoremap <F4> :%s/‘\<Bar>’\<Bar>”\<Bar>“\<Bar>†\<Bar>‡\<Bar>™\<Bar>©\<Bar>®\<Bar>•\<Bar>¹\<Bar>²\<Bar>³\<Bar>–\<Bar>–\<Bar>—\<Bar>…//gc<CR>
    " on each line, add the character, followed by an escaped <Bar>

  " variable formatting stuff
    set tabstop=2                      " tab = 2 spaces
    set shiftwidth=2                   " treat 2 spaces as a tab
    set expandtab                      " convert all tabs to spaces
    set showmatch                      " display when a contextualizing symbol has a match
    set wildmode=longest,list,full
    set wildmenu
    set hidden

" Add LESS filetype recognition
au BufNewFile,BufRead *.less set filetype=less
" Add JSON filetype recognition using JS syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript
" puppet uses Ruby syntax highlighting:
au BufNewFile,BufRead *.pp set filetype=ruby

set incsearch
set hlsearch
nnoremap <CR> :noh<CR><CR>

" alter cursor shape for different modes in terminal vim (may not work in
" Terminal.app)
if exists('$TMUX')
  " also make this work for tmux:
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


"set clipboard=unnamed

" manually change to working directory
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" airline stuff:
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" turn-on distraction free writing mode for markdown files
  if has("gui_running")
    au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} call DistractionFreeWriting()
  end

  function! DistractionFreeWriting()
      colorscheme iawriter
      set background=light
      set gfn=Cousine:h14                " font to use
      set lines=40 columns=100           " size of the editable area
      set fuoptions=background:#00f5f6f6 " macvim specific setting for editor's background color
      set guioptions-=r                  " remove right scrollbar
      set laststatus=0                   " don't show status line
      set noruler                        " don't show ruler
      set fullscreen                     " go to fullscreen editing mode
      set linebreak                      " break the lines on words
      set nolist                         " don't show unprintable characters (kills linebreak)
      normal zR                          " unfold all folds
  endfunction

filetype plugin indent on
syntax on
