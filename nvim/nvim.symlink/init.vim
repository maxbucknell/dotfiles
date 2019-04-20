" Let's get the plugins out of the way first, shall we?
call plug#begin()
    " Pane Navigation (Tmux integration)
    Plug 'christoomey/vim-tmux-navigator'

    " Colours
    Plug 'morhetz/gruvbox'

    " Fuzzy finding
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'

    " Completion
    Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

    " Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " Surround
    Plug 'tpope/vim-surround'

    " Git integration
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Comments
    Plug 'tpope/vim-commentary'

    " Statusline
    Plug 'vim-airline/vim-airline'

    " TypeScript
    Plug 'HerringtonDarkholme/yats.vim'

    " Go
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

    " Rust
    Plug 'rust-lang/rust.vim'

    " CSV
    Plug 'chrisbra/csv.vim'

    " CSS Colour previews
    "
    " Working on changing this, making it use virtual text to render a swatch.
    Plug 'chrisbra/Colorizer'
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
set listchars=tab:‣\ ,trail:·

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
let g:gruvbox_italic = 1
colorscheme gruvbox

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

" Fuzzy finding
nnoremap <leader>o :Files<cr>
nnoremap <leader>b :Buffers<cr>

" Go to most recently edited file
nnoremap <leader><leader> <c-^>

" Ultisnips, y'all
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" Remap semi-colon to colon.
"
" Colon is the starting point of a lot of actions in Vim. And I
" shouldn't have to hold a modifier key to access so much
" essential functionality.
noremap ; :
noremap ;; ;

" Git blame
"
" I used to do this by just filling in my buffer, but this is nicer.
nnoremap <leader>a :Gblame<cr>

" What the hell is ex mode
"
" Whatever it is, I don't like it.
nnoremap Q <nop>

" Traversing lines
nnoremap - ddp
nnoremap _ :-1d<cr>pk

" Updating Vimrc
"
" A little mapping to edit my vimrc. I'd like to do this with a function, and
" account for a few things:
" 
" + Is a buffer already open and visible?
" + Open in a floating window over everything to not disturb my workflow
nnoremap <leader>ev :vsp $MYVIMRC<cr>

" Second part, every time I write to $MYVIMRC, source it for me.
augroup updateVimrc
    autocmd BufWritePost $MYVIMRC :source $MYVIMRC
augroup END

" Zoom the current split
"
" Tmux has a feature <prefix>-z, that will zoom the current pane. I decided
" that this was a useful enough feature to have in Vim as well. Voila.
function! ZoomOrUnzoom()
    if exists('g:is_zoomed')
        unlet g:is_zoomed
        execute "wincmd ="
    else
        let g:is_zoomed = 'true'
        execute "wincmd _"
        execute "wincmd \|"
    endif
endfunc

" Map it to <space>z
nnoremap <leader>v :call ZoomOrUnzoom()<cr>

" I had this running as an autocommand on resizes, but it was buggy so it's
" disabled at the moment.
function! HandleResize()
    if exists('g:is_zoomed')
        execute "wincmd _"
        execute "wincmd \|"
    else
        execute "wincmd ="
    endif
endfunc

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

" Make directories in a filename if they don't exist.
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
    autocmd BufNewFile * :call EnsureDirExists()
augroup END

" Gitgutter
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

" Status line stuff
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
" Input supports patched fonts already \o/
let g:airline_powerline_fonts = 1

" Show syntax highlighting groups for word under cursor
"
" This is useful for finding rogue elements I forgot in my colour
" scheme.
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val,"name")')
endfunc

nnoremap <leader>\ :call <SID>SynStack()<CR>
