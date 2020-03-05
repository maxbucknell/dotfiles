" Let's get the plugins out of the way first, shall we?
call plug#begin()
    " Fuzzy finding
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'

    " Completion
    Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

    " Snippets
    Plug 'SirVer/ultisnips'

    " Surround
    Plug 'tpope/vim-surround'

    " Git integration
    Plug 'tpope/vim-fugitive'

    " Comments
    Plug 'tpope/vim-commentary'

    " (Java|Type)Script
    Plug 'HerringtonDarkholme/yats.vim'

    " Go
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

    " Rust
    Plug 'rust-lang/rust.vim'

    " CSS Colour previews
    Plug 'maxbucknell/Colorizer', { 'branch': 'neovim-virtual-text' }

    " JSON with comments, just for TypeScript
    Plug 'kevinoid/vim-jsonc'
call plug#end()

" I have a true colour terminal, and I will have true colours in my Vim
set termguicolors

" Disable creation of swap files.
"
" Swap files serve a purpose, but not to me. I write often, and so
" these just get in the way.
"
" I'm toying with the idea of re-enabling these and ignoring them in Git.
set nobackup
set nowritebackup
set noswapfile
set colorcolumn=80

" Show things faster, particularly error messages
set updatetime=300

" I always want a sign column
set signcolumn=yes

" Trying this bizarre method of self location again.
set cursorline

" Statuslines!
set laststatus=2
set statusline=—[%.30t]—%y—
set fillchars=stl:—
set fillchars+=stlnc:—
set fillchars+=eob:\ 

" Don't show that annoying intro message when Vim starts
set shortmess=I

" Wrap lines
"
" Splitting screens means that sometimes my code windows are little. It might
" be nice in future to indent and give indication that it's wrapped, but for
" now, I can manage by seeing line numbers.
set wrap

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

" Insert only one space when joining lines that contain
" sentence-terminating punctuation like `.`.
set nojoinspaces

" If a file is changed outside of vim, automatically reload it
set autoread

" Show trailing whitespace, since it's a crime
set list
set listchars=tab:‣\ ,trail:·,extends:◣,precedes:◢,nbsp:○

" Turn off code folding
"
" I hate code folding. It makes me mad. I just want a buffer with all
" of my text in it, no funny business.
set foldmethod=manual
set nofoldenable

" Scrolloff, because I'm allergic to the edges of my screen
set scrolloff=5

" Tab config options
"
" In general, I prefer spaces to tabs, and 4-space indentation. These
" settings just make that consistent, so I rarely have to think about
" it.
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent

" Enable highlighting for syntax
syntax on

" Enable file type detection.
filetype plugin indent on

" Theme configuration
" Should make this a plugin that detects file changes somehow
let g:is_dark_mode = system("isdark")

if g:is_dark_mode == "true\n"
    set background=dark
    colorscheme maxbucknell_dark
else
    set background=light
    colorscheme maxbucknell_neo
endif

let g:go_def_mapping_enabled = 0

" Lead with the biggest button on the motherfucking keyboard
let mapleader = "\<space>"
let localmapleader = "\\"

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

" Visual mode setting
vnoremap hh <esc>
vnoremap hhh h<esc>

" Go to most recently edited file
nnoremap <leader><leader> <c-^>

" Insert new lines
nnoremap <cr> i<cr><esc>

" Ultisnips, y'all
" I previously configured tab as a trigger here, but now I just
" use CoC
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Colorizer adds little colour swatches next to CSS colours
let g:colorizer_auto_filetype='css,less,scss,sass'
let g:colorizer_colornames = 0
let g:colorizer_use_virtual_text = 1

" Coc
"
" I'm not sure that I like Coc, its configuration feels very "unvimmy", but it
" is the only completion engine that integrates well with language servers and
" handles other language server tasks, like linting.
"
" The alternative would be to use some completion plugin (like deoplete), and
" then a whole separate process for linting, when both require the same
" inputs. Waste of energy.

" Remap semi-colon to colon.
"
" Colon is the starting point of a lot of actions in Vim. And I
" shouldn't have to hold a modifier key to access so much
" essential functionality.
noremap ; :

" What the hell is ex mode
"
" Whatever it is, I don't like it.
nnoremap Q <nop>

" Traversing lines
nnoremap - ddp
nnoremap _ :-1d<cr>pk

" Updating Vimrc
"
" Open my vimrc in a new window
nnoremap <leader>ev :tabedit $MYVIMRC<cr>

" Second part, every time I write to $MYVIMRC, source it for me.
augroup updateVimrc
    autocmd!

    autocmd BufWritePost $MYVIMRC :source $MYVIMRC
augroup END

" Focus mode
nmap <leader>z <Plug>ZoomOrUnzoom

" And make moving around splits just a little bit sane.
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>

" A load of default file runners. These need to be refactored, so that they
" are in filetype plugins, and would probably be better served by being bound
" to the localleader.
function! RunTypeScript()
    silent !clear
    execute "!$(findroot package.json)/node_modules/.bin/mocha -r ts-node/register -R dot %"
endfunction

function! RunJavaScript()
    silent !clear
    execute "!$(findroot package.json)/node_modules/.bin/mocha -R dot %"
endfunction

function! RunPython()
    silent !clear
    execute "!python %"
endfunction

function! RunRust()
    silent !clear
    execute "!cargo run"
endfunction

function! OpenInMarked()
    silent !clear
    execute '!open "x-marked://open?file=%:p"'
endfunction

augroup runFiles
    autocmd!

    autocmd FileType typescript nnoremap <localleader>r :call RunTypeScript()<cr>
    autocmd FileType javascript nnoremap <localleader>r :call RunJavaScript()<cr>
    autocmd FileType python nnoremap <localleader>r :call RunPython()<cr>
    autocmd FileType rust nnoremap <localleader>r :call RunRust()<cr>
    autocmd FileType markdown nnoremap <localleader>r :call OpenInMarked()<cr>
augroup END

" Text formatting rules for various files.
augroup textFormatting
    autocmd!

    " Make files really need tabs
    autocmd FileType make setl noet sw=8 sts=8 ts=8

    " So too do Go files, apparently.
    autocmd FileType go setl noet sw=8 sts=8 ts=8

    " Bazel messes with this apparently
    autocmd FileType bzl setl et sw=4 sts=4 ts=4

    " Hard wrap prose
    "
    " This will automatically insert a new line in insert mode when a
    " line gets too long (above 80 characters). I can also run gqap
    " in normal mode to reflow a paragraph.
    autocmd FileType
        \ markdown,text
        \ setl tw=80 fo=t1
augroup END

" I'm not interested in line numbers on terminal buffers. I hardly ever use
" terminal buffers anyway, but they are useful in a few cases.
"
" I never want line numbering.
augroup lineNumbering
    autocmd!

    autocmd TermOpen * setl nonu nornu
augroup END

augroup terminalInsert
    " Automatically enter terminal mode when summoning a terminal
    autocmd TermOpen term://* startinsert
augroup END

augroup WindowManagement
    autocmd!

    autocmd WinEnter * setl rnu cul syntax=on
    autocmd WinLeave * setl nornu nocul syntax=off
augroup END

nnoremap <leader>\ <Plug>SynStack



