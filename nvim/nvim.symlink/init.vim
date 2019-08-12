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
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'
    Plug 'HerringtonDarkholme/yats.vim'

    " Go
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

    " Rust
    Plug 'rust-lang/rust.vim'

    " CSS Colour previews
    Plug 'maxbucknell/Colorizer', { 'branch': 'neovim-virtual-text' }

    " Statusline
    Plug 'vim-airline/vim-airline'
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

" Show things faster, particularly error messages
set updatetime=300

" I always want a sign column
set signcolumn=yes

" Trying this bizarre method of self location again.
set cursorline

" Statuslines!

" Input supports patched fonts already \o/
let g:airline_powerline_fonts = 1

" Made a custom theme for it didn't I?
let g:airline_theme='maxbucknell'

let g:airline_left_sep='|'
let g:airline_right_sep='|'

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

let g:is_dark_mode = system("isdark")

if g:is_dark_mode == "true\n"
    set background=light
    colorscheme maxbucknell_light
else
    set background=light
    colorscheme maxbucknell_light
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

" Fuzzy finding
nnoremap <leader>o :Files<cr>
nnoremap <leader>b :Buffers<cr>

" Go to most recently edited file
nnoremap <leader><leader> <c-^>

" Ultisnips, y'all
" I previously configured tab as a trigger here, but now I just
" use CoC
let g:UltiSnipsSnippetDirectories=[$VIMCONFIG.'/UltiSnips']

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

" Some autocommands to handle Coc
augroup Coc
    autocmd!

    autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

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
" Open my vimrc in a floating window over my workspace when I want to edit it.
nnoremap <leader>ev :call OpenModalWindow(OpenFileHidden($MYVIMRC))<cr>

" Second part, every time I write to $MYVIMRC, source it for me.
augroup updateVimrc
    autocmd!

    autocmd BufWritePost $MYVIMRC :source $MYVIMRC
augroup END

" When I have my Vimrc open is when I most frequently open the help menu. This
" renders as a split under the floating window, so I need to move it to a
" floating window over my Vimrc

function! OpenHelpWindow()
    if &buftype == 'help'
        if exists('g:help_window_opening')
            return
        else
            let g:help_window_opening = v:true
        endif

        " Stuff to do now we know that help is open in a split
        let help_buffer = bufnr('%')
        let win_number = bufwinnr('%')

        call OpenModalWindow(bufnr('%'))

        execute win_number . 'wincmd c'

        unlet g:help_window_opening
    endif
endfunc

augroup helpWindow
    autocmd!

    autocmd BufEnter *.txt call OpenHelpWindow()
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
nnoremap <leader>z :call ZoomOrUnzoom()<cr>

" Making splits a little bit better.
"
" I open splits before opening files because I can never remember the
" keyboard incantations in FZF to open in splits, but I get annoyed for
" the brief moment that the same buffer was shown when I do :vsp or :sp.
"
" I don't have to have this problem anymore.
nnoremap <leader>v :vnew<cr>
nnoremap <leader>s :new<cr>

" And make moving around splits just a little bit sane.
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>

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

    " So too do Go files, apparently.
    autocmd FileType go setl noet sw=8 sts=8 ts=8

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

augroup WindowManagement
    autocmd!

    autocmd WinEnter * setl rnu cul syntax=on
    autocmd WinLeave * setl nornu nocul syntax=off
augroup END

" Show syntax highlighting groups for word under cursor
"
" This is useful for finding rogue elements I forgot in my colour
" scheme.
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  " echo map(synstack(line('.'), col('.')), 'synIDattr(v:val,"name")')

  echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
              \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
              \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
endfunc

nnoremap <leader>\ :call <SID>SynStack()<CR>

" Open a file as a hidden buffer
"
" Because Vim is single threaded, we can open this in the foreground, and
" replace it with the old buffer, and the screen won't change until we finish
" executing, at which point we are back where we began.
function! OpenFileHidden(file)
    " Store the current buffer number
    let oldbufnr = bufnr('%')

    " Open the given file for editing
    execute 'edit ' . a:file

    " Store the new buffer number, because we return it
    let newbufnr = bufnr('%')

    " If they are equal, it means it was an empty buffer before and we need to
    " open a new buffer instead of restoring the old one.
    if oldbufnr == newbufnr
        enew
    else
        execute oldbufnr . 'buffer'
    endif

    return newbufnr
endfunc

let g:modal_windows = []

function! OpenModalWindow(bufnr)
    let width = &columns - 10 - 5
    let height = &lines - 10 - 3

    let window_options = {
        \ 'relative': 'editor',
        \ 'height': height,
        \ 'width': width,
        \ 'row': 6,
        \ 'col': 9
    \ }

    let g:ignore_modal_focus = v:true

    let newwinnr = nvim_open_win(a:bufnr, v:true, window_options)
    call insert(g:modal_windows, newwinnr)

    unlet g:ignore_modal_focus

    return newwinnr
endfunc

" Check if a modal window is opened, and if so, focus it when switching
" buffers
function! FocusModalWindow()
    if exists('g:ignore_modal_focus') || !exists('g:modal_windows[0]')
        return
    endif

    let current_modal = g:modal_windows[0]
    echo current_modal
    let current_winnr = nvim_get_current_win()
    echo current_winnr

    if current_modal != current_winnr
        call nvim_set_current_win(current_modal)
    else

    endif
endfunc

augroup manageModalWindows
    autocmd!

  " autocmd BufEnter * call FocusModalWindow()
augroup END

" Remind me to update my plugins every so often. Run a function at startup
" that checks when they were last updated.
let g:plug_update_file = '~/dotfiles/nvim/nvim.symlink/plugged-update'
" Update every two weeks
let g:plug_update_timeout = 60 * 60 * 24 * 14

function! NeedsUpdate(update_file)
    let now = system('date +%s')

    if !filereadable(a:update_file)
        return v:true
    endif

    let contents = readfile(a:update_file)
    if !exists('contents[0]')
        return v:true
    endif

    let updated_at = contents[0]
    let updated_threshold = now - g:plug_update_timeout

    if updated_at == '' || updated_at < updated_threshold
        return v:true
    endif

    return v:false
endfunc

function! UpdatePlugReminder()
    let file = expand(g:plug_update_file)
    let now = system('date +%s')
    if NeedsUpdate(file)
        let msg = "Your plugins haven't been updated for over two weeks."
        let msg .= "\n" . "Update plugins now? : "
        if input(msg, "Y") == "Y"
            PlugUpdate
            call writefile([now], file)
        endif
    endif
endfunc

function! StartUp()
    call UpdatePlugReminder()
endfunc

augroup startUp
    autocmd!

    autocmd VimEnter * call StartUp()
augroup END
