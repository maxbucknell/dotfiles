" Basic editing config

" colorscheme maxbucknell
set termguicolors
set updatetime=100

call plug#begin()

" Colours
Plug 'morhetz/gruvbox'

" Fuzzy finding
Plug '/usr/local/opt/fzf'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Linting
Plug 'neomake/neomake'
Plug 'w0rp/ale'

" Comments
Plug 'tpope/vim-commentary'

" File browsing
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" Statusline
Plug 'vim-airline/vim-airline'

" For async completion
Plug 'Shougo/deoplete.nvim'

" TypeScript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

" Rust
Plug 'rust-lang/rust.vim'
Plug 'sebastianmarkow/deoplete-rust'

" CSV
Plug 'chrisbra/csv.vim'
call plug#end()

" Theme configuration
let g:gruvbox_italic = 1
colorscheme gruvbox

" Use ranger instead of netrw
let g:ranger_replace_netrw = 1

" Setting up autocomplete
let g:deoplete#enable_at_startup = 1

" Quick exit insert mode
"
" Escape is at the far corner of my keyboard, and having it so far away
" was discouraging me from exiting insert mode. Qwerty users can remap
" jk to <esc>, which is a far better solution. The keys are next to each
" other, and it makes exiting insert mode a pleasant rolling motion.
" Moreover, when in normal mode, jk is a no-op.
"
" As a dvorak user, jk was too cumbersome, but there were no other
" suitable candidates. hh is inferior in that it is not a no-op in
" normal mode, but it is just as easy to type. The only caveat is when
" an edit ends with h, which is why hhh will expand to place an h in
" the buffer before exiting.
"
" To encourage me to adopt the new style, I disable escape. That one is
" sure to mess up someone not familiar with my setup.
inoremap hh <esc>
inoremap hhh h<esc>
" Terminal mode setting
tnoremap hh <C-\><C-n>
tnoremap hhh h<C-\><C-n>

" Lead with the biggest button on the motherfucking keyboard
let mapleader = "\<space>"

" FUzzy finding
nnoremap <leader>o :FZF<cr>

" Don't wrap lines
"
" I look at a lot of CSV files and logs, which are generally the only
" times I see long lines. If code is too long, I shorten it. As such,
" having lines artificially wrapping only gets in my way.
set nowrap

" Line numbering
"
" This shows the real line number of the current line, and relative
" line numbers on the other lines. Relative line numbers are good to
" know how many lines to yank, delete, or move.
set number
set relativenumber

" Write before commands
"
" This means that if I have unsaved changes, they get saved before
" executing a git commit, or something like that.
set autowrite

" Split management
set splitbelow
set splitright

" Just remove an extra keystroke
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Make searches case sensitive only if an upper case character has been typed
set ignorecase smartcase

" Allow backspacing over everything in insert mode
"
" By default, Vim will stop when it gets to the beginning of a line,
" throw its arms in the air and give up.
set backspace=indent,eol,start

" Display incomplete commands and the lines they apply to.
set showcmd

" Allow hidden buffers
"
" If this is off, buffers are destroyed when they fade out of view. We
" have the memory to spare to keep them around.
set hidden

" Enable highlighting for syntax
syntax on

" Enable file type detection.
"
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent
" indenting.
filetype plugin indent on

" Insert only one space when joining lines that contain
" sentence-terminating punctuation like `.`.
set nojoinspaces

" If a file is changed outside of vim, automatically reload it
set autoread

" Show trailing whitespace, since it's a crime
set list
set listchars=tab:‣\ ,trail:·

" Turn off code folding
"
" I hate code folding. It makes me mad. I just want a buffer with all
" of my text in it, no funny business.
set foldmethod=manual
set nofoldenable
let g:vim_markdown_folding_disabled=1
let g:vimtex_fold_enabled=0

""""""""""""""""""
" Ultisnips, y'all
""""""""""""""""""

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" Tab config options
"
" In general, I prefer spaces to tabs, and 2-space indentation. These
" settings just make that consistent, so I rarely have to think about
" it.
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent

function! RunTypeScript()
    silent !clear
    execute "!tsc % --outFile /dev/stdout | node"
endfunction

function! RunJavaScript()
    silent !clear
    execute "!node %"
endfunction

function! RunPython()
    silent !clear
    execute "!python %"
endfunction

function! RunRust()
    silent !clear
    execute "!cargo run"
endfunction

augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!

  " Language whitespace settings
  autocmd FileType make setl noet sw=8 sts=8 ts=8

  autocmd FileType typescript nnoremap <leader>r :call RunTypeScript()<cr>
  autocmd FileType javascript nnoremap <leader>r :call RunJavaScript()<cr>
  autocmd FileType python nnoremap <leader>r :call RunPython()<cr>
  autocmd FileType rust nnoremap <leader>r :call RunRust()<cr>

  " Hard wrap prose
  "
  " This will automatically insert a new line in insert mode when a
  " line gets too long (above 80 characters). I can also run gqap
  " in normal mode to reflow a paragraph.
  autocmd FileType
    \ markdown,text
    \ setl tw=80 fo=t1

  " Automatically enter terminal mode when summoning a terminal
  autocmd TermOpen term://* startinsert

augroup END

" Make directories in a filename if they don't exist.

function! AskQuit (msg, options, quit_option)
    if confirm(a:msg, a:options) == a:quit_option
        exit
    endif
endfunction

function! EnsureDirExists ()
    let required_dir = expand("%:h")
    if !isdirectory(required_dir)
        try
            call mkdir( required_dir, 'p' )
        catch
          echom "Could not create directory"
          exit
        endtry
    endif
endfunction

augroup AutoMkdir
    autocmd!
    autocmd  BufNewFile  *  :call EnsureDirExists()
augroup END

" Ale
"
" An asynchronous linting engine.
let g:ale_lint_on_text_changed = 1

" Hallelujah!
let g:ale_set_signs = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '--'
let g:ale_sign_warning = '--'

" Gitgutter
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

" JSX in mah JavaScript
let g:jsx_ext_required = 0

" Status line stuff
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
" Input supports patched fonts already \o/
let g:airline_powerline_fonts = 1


" Go to most recently edited file
nnoremap <leader><leader> <c-^>

" Disable syntax hiding in JSON
"
" Vim JSON provides a fancy way of viewing, where it hides quotes and
" just shows you data. I don't want that.
let g:vim_json_syntax_conceal = 0

" Show syntax highlighting groups for word under cursor
"
" This is useful for finding rogue elements I forgot in my colour
" scheme.
nnoremap <leader>\ :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val,"name")')
endfunc

" Remap semi-colon to colon.
"
" Colon is the starting point of a lot of actions in Vim. And I
" shouldn't have to hold a modifier key to access so much
" essential functionality.
noremap ; :
noremap ;; ;

" Commenting aliases, because I hate change.
nnoremap <leader>/ :.Commentary<cr>

" Git blame
"
" I used to do this by just filling in my buffer, but this is nicer.
nnoremap <leader>a :Gblame<cr>

" Disable creation of swap files.
"
" Swap files serve a purpose, but not to me. I write often, and so
" these just get in the way.
set nobackup
set nowritebackup
set noswapfile

" What the hell is ex mode
"
" Whatever it is, I don't like it.
nnoremap Q <nop>

" Summon a terminal
nnoremap <leader>k :bot sp term://zsh<cr>

