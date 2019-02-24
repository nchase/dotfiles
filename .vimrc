" disable vi-compatibility mode (allows real vim configuration):
set nocompatible

" inject pathogen plugins (from ~/.vim/bundle):
call pathogen#infect()

function! ConfigureUI()
  "enable syntax highlighting:
  syntax enable
  " load plugins and indents for filetypes:
  filetype plugin indent on

  "use solarized and which flavor (light/dark to use):
  colorscheme solarized
  set background=dark
  highlight clear SignColumn

  " always show ruler:
  set ruler
  " always show line numbers
  set number

  " make vim look for UI updates more frequently:
  set updatetime=100

  " airline stuff:
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
  let g:airline_theme='solarized'
  set laststatus=2
  " in the rare case that we're in a gui vim (e.g. MacVim),
  " set an appropriate font. this allows powerline/airline
  " to render special characters:
  if has("gui_running")
    set guifont=Inconsolata-g\ for\ Powerline
  endif

  "allow mouse support for stuff like resizing panes (neovim):
  set mouse=a


  " default to filetype-specific plugins and indentations:
  filetype plugin indent on
  " ignore case on search:
  set ignorecase
  " auto-indent files:
  set autoindent
  " show non-printing characters
  set list
  " configure tabs and trailing spaces:
  set listchars=tab:→\ ,trail:•

  " tabs take up the same space as 2 spaces:
  set tabstop=2

  " treat 2 spaces as a tab:
  set shiftwidth=2
  " use spaces, not tabs:
  set expandtab
  " display when a contextualizing symbol has a match
  set showmatch
  " wildcard matching:
  set wildmode=longest,list,full
  set wildmenu
  " hide abandoned buffers (e.g. unsaved changes in buffers)
  " without forcing the user to save:
  set hidden

  " allow backspacing over indents, linebreaks,
  " and start position of insert mode:
  set backspace=indent,eol,start
endfunction
call ConfigureUI()

function! ConfigureKeys()
  " manually change to working directory with <leader>cd:
  map <leader>cd :cd %:p:h<CR>:pwd<CR>

  " handle `:W` as `:w` and `:E` as `:e`
  " (i.e. set up fatfinger aliases):
  cnoreabbrev W w
  cnoreabbrev E e
  cnoreabbrev Q q
  cnoreabbrev Qa qa
  cnoreabbrev explore Explore
  cnoreabbrev Redraw redraw

  " use system clipboard:
  set clipboard^=unnamed,unnamedplus

  " when joining selected text (<C-j>), collapse spaces:
  set nojoinspaces
endfunction
call ConfigureKeys()


function! ConfigureUndoRedo()
  set noswapfile
  set hidden
  set undofile
  set undodir=~/.vim/undodir
endfunction
call ConfigureUndoRedo()

function! ConfigureFileTypes()
  autocmd BufNewFile,BufRead *.pp set filetype=ruby
  autocmd BufNewFile,BufRead *.cshtml set filetype=html
endfunction
call ConfigureFileTypes()

function! ConfigureSearch()
  " highlight search results immediately as matches appear
  set incsearch
  " highlight all search matches, not just the current match:
  set hlsearch
  " turn off search highlighting after user submits carriage return:
  nnoremap <CR> :noh<CR><CR>
endfunction
call ConfigureSearch()

function! ConfigureIgnoreDirectories()
  " never display, e.g., any node_modules directory:
  set wildignore+=*/**/node_modules
  set wildignore+=*.class
  set wildignore+=*/target/*
  set wildignore+=*.ico,*.jpg,*.gif,*.png
endfunction
call ConfigureIgnoreDirectories()


function! ConfigureTmux()
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
endfunction
call ConfigureTmux()


function! ConfigureFZF()
  " fuzzy finder:
  set rtp+=/usr/local/opt/fzf

  " open fzf with ctrl+p
  map <C-p> :FZF<CR>
  " open fzf buffers with ctrl+alt+p:
  map <C-M-p> :Buffers<CR>
endfunction
call ConfigureFZF()


function! ConfigureAle()
  let g:ale_sign_error = '❗️'
  let g:ale_sign_warning = '⚠️'
  let g:ale_sign_column_always = 1
  " configure JS to fix files with prettier and eslint:
  let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
  let g:ale_fixers['json'] = ['fixjson']
  " never agressively lint, always wait for a save:
  let g:ale_lint_on_text_changed = 'never'
  " fix files when they're saved:
  let g:ale_fix_on_save = 1
  " allow autocompletion:
  let g:ale_completion_enabled = 1
  " populate loclist with errors in addition to inline display:
  let g:ale_open_list = 1
  " show 5 lines in that loclist:
  let g:ale_list_window_size = 5
  " wait 500ms for autocomplete:
  let g:ale_completion_delay = 500

  " <C-] goes to definition:
  nnoremap <buffer> <C-]> :ALEGoToDefinition<CR>
endfunction
call ConfigureAle()

function! ConfigureExtensibility()
  " enable per-directory .vimrc files
  set exrc
  if filereadable(glob('./.vimrc.local'))
    source ./.vimrc.local
  endif
endfunction
call ConfigureExtensibility()


function! PostConfigGenerateHelpTags()
  " add plugins to runtime path; necessary to generate helptags for plugins:
  packloadall
  " silently load helptags (ignore messages and errors. we just want the
  " helptags gen'd:
  silent! helptags ALL
endfunction
call PostConfigGenerateHelpTags()
