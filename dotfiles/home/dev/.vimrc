"" ==============
"  Initialization {{{1
"" ==============

    " plugins expect bash - not fish, zsh, etc
    set shell=bash

    " Use Vim settings instead of Vi settings.
    set nocompatible
    filetype off

    " If you can't spell, tough.
    set nospell

    " Assume a dark background
    set background=dark

    " Clear Autocommands
    autocmd!

    " Let Vim look for settings in a file
    set modeline
    set modelines=5

    " If vimrc has been modified, re-source it for fast modifications
    autocmd! BufWritePost *vimrc source %

    " Set Leader
    let mapleader = ","

    " Wildmode options {{{2
    " ----------------
    set wildmenu
    set wildmode=longest:full,full
    set wildignore+=*.o,*.out,*.obj,*.rbc,*.rbo,*.class,*.gem
    set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
    set wildignore+=*.jpg,*.png,*.gif,*.jpeg,*.bmp
    set wildignore+=*.hg,*.git,*.svn
    set wildignore+=*.exe,*.dll
    set wildignore+=*.pyc
    set wildignore+=*.DS_Store
    " }}}

"" ==================== }}}
"  Vundle Plugins {{{1
"" ==============

    set rtp+=~/.vim/bundle/vundle/
    call vundle#begin()

    " Required Plugins
    Plugin 'gmarik/vundle'

    " Approved Plugins
    Plugin 'godlygeek/tabular'
    Plugin 'scrooloose/nerdtree'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'jistr/vim-nerdtree-tabs'
    Plugin 'fatih/vim-go'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'majutsushi/tagbar'
    Plugin 'tpope/vim-repeat'
    Plugin 'tpope/vim-speeddating'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-pathogen'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-git'
    Plugin 'tpope/vim-commentary'
    Plugin 'vim-scripts/AutoClose'
    Plugin 'bling/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'bling/vim-bufferline'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'scrooloose/syntastic'
    Plugin 'plasticboy/vim-markdown'
    Plugin 'mbbill/undotree'
    Plugin 'myusuf3/numbers.vim'
    Plugin 'ekalinin/Dockerfile.vim'
    Plugin 'MarcWeber/vim-addon-mw-utils'

    call vundle#end()
    filetype plugin indent on

"" =============== }}}
"  Filetype Association {{{1
"" ====================

    au BufRead,BufNewFile *vimrc set foldmethod=marker

    augroup MarkdownFiles " Instead of this Modulo file bullshit
        autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    augroup end

    au BufWritePost ~/.bashrc !source %


"" ============= }}}
"  Look and Feel {{{1
"" =============
    " Basics / Misc {{{2
    " -------------

        " Used for saving git and hg commits
        filetype on
        filetype off

        " Set to allow you to backspace while back past insert mode
        set backspace=2

        " Increase History
        set history=999

        " Enable numbers in the left column
        set number

        " Give context to where the cursor is positioned in a file
        set scrolloff=14

        " Use UTF-8 encoding
        set encoding=utf-8 nobomb

        " Hide buffers after they are abandoned
        set hidden

        " Disable files that don't need to be created
        set noswapfile
        set nobackup
        set nowb

        " Auto Complete Menu
        set completeopt=longest,menu

    " }}}
    " Tabbing and Spaces {{{2
    " ------------------
        " Use 4 spaces instead of tabs
        set ts=4
        set sts=4
        set shiftwidth=4
        set expandtab

        " Auto indent
        set autoindent

        " replace trailing whitespace and tabs with unicode characters
        exec "set listchars=tab:\uBB\uBB,trail:\u2716,nbsp:~"
        set list
    " }}}
    " Color Settings {{{2
    " --------------

        " Enable syntax highlighting
        syntax enable

        " Set font and color scheme for Gvim
        set guifont=Inconsolata\ for\ Powerline:h14
        if has("gui_running")
            if has("gui_win32")
                set guifont=Consolas:h10:cANSI
            endif
        else
            set t_Co=256
        endif
        try
            colorscheme badwolf
        catch
            colorscheme darkzen
        endtry

        " }}}
    " Persistent Undo {{{2
    " ---------------
        if v:version >= 703
            set undofile
            set undodir=~/.vim/tmp,~/.tmp,~/tmp,~/var/tmp,/tmp
        endif
    " }}}
    " Spelling / Typos {{{2
    " ----------------
        :command! WQ wq
        :command! Wq wq
        :command! W w
        :command! Q q
    " }}}
    " Open file and goto previous location {{{2
    " ------------------------------------
        autocmd BufReadPost *  if line("'\"") > 1 && line("'\"") <= line("$")
                   \|     exe "normal! g`\""
                   \|  endif
    " }}}
"" ============== }}}
"  Plugin Settings {{{1
"" ===============
    " Airline Settings {{{2
    " ----------------
        let g:airline#extensions#tabline#enabled = 1
        set laststatus=2
        let g:bufferline_echo = 0
        let g:airline_theme = 'distinguished'
    " }}}
    " Markdown Settings {{{2
    " ----------------
       let g:vim_markdown_folding_disabled = 1
    " }}}
    " Vim Session Persist {{{2
    " -------------------
        let g:session_autosave = 1
        let g:session_autoload = 1
    " }}}
    " NERDTree {{{2
    " --------

      " General properties
      let NERDTreeDirArrows=1
      let NERDTreeMinimalUI=1
      let NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$']
      let NERDTreeWinSize = 35

      " Make sure that when NT root is changed, Vim's pwd is also updated
      let NERDTreeChDirMode = 2
      let NERDTreeShowLineNumbers = 1
      let NERDTreeAutoCenter = 1

    " Open NERDTree on startup, when no file has been specified
    autocmd VimEnter * if !argc() | NERDTree | endif
    " }}}
    " Neocomplete {{{2
    " -----------
      " Disable AutoComplPop.
      let g:acp_enableAtStartup = 0

      " Use neocomplete.
      let g:neocomplete#enable_at_startup = 1

      " Use smartcase.
      let g:neocomplete#enable_smart_case = 1

      " Set minimum syntax keyword length.
      let g:neocomplete#sources#syntax#min_keyword_length = 3
      let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'"
    "}}}
    " Syntastic {{{2
      let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
      let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
    " }}}
    " Vim-go {{{2
      " --------
      let g:go_fmt_fail_silently = 1
      let g:go_fmt_command = "gofmt" "Explicited the formater plugin (gofmt, goimports, goreturn...)

      let g:go_list_type = "quickfix"

      " Show a list of interfaces which is implemented by the type under your cursor
      au FileType go nmap <Leader>s <Plug>(go-implements)

      " Show type info for the word under your cursor
      au FileType go nmap <Leader>i <Plug>(go-info)

      " Open the relevant Godoc for the word under the cursor
      au FileType go nmap <Leader>gd <Plug>(go-doc)
      au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

      " Open the Godoc in browser
      au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

      " Run/build/test/coverage
      au FileType go nmap <leader>r <Plug>(go-run)
      au FileType go nmap <leader>b <Plug>(go-build)
      au FileType go nmap <leader>t <Plug>(go-test)
      au FileType go nmap <leader>c <Plug>(go-coverage)

      " By default syntax-highlighting for Functions, Methods and Structs is disabled.
      " Let's enable them!
      let g:go_highlight_functions = 1
      let g:go_highlight_methods = 1
      let g:go_highlight_structs = 1

      nmap <F8> :TagbarToggle<CR>
      let g:tagbar_type_go = {
          \ 'ctagstype' : 'go',
          \ 'kinds'     : [
              \ 'p:package',
              \ 'i:imports:1',
              \ 'c:constants',
              \ 'v:variables',
              \ 't:types',
              \ 'n:interfaces',
              \ 'w:fields',
              \ 'e:embedded',
              \ 'm:methods',
              \ 'r:constructor',
              \ 'f:functions'
          \ ],
          \ 'sro' : '.',
          \ 'kind2scope' : {
              \ 't' : 'ctype',
              \ 'n' : 'ntype'
          \ },
          \ 'scope2kind' : {
              \ 'ctype' : 't',
              \ 'ntype' : 'n'
          \ },
          \ 'ctagsbin'  : 'gotags',
          \ 'ctagsargs' : '-sort -silent'
      \ }
    "}}}
"" ======== }}}
"  Mappings {{{1
"" ========
    " Disable Q (Command Shell Mode) {{{2
    " ------------------------------
        nnoremap Q <nop>
        nnoremap gq <nop>
        nnoremap q: <nop>
    " }}}
    " * No longer moves the cursor when hitting it the first time {{{2
    " -----------------------------------------------------------
        nmap * *Nzz
        nmap # #Nzz
    " }}}
    " Y y$ Fix {{{2
    " --------
        " Why the hell isn't this the normal behavior?
        nnoremap Y y$
    " }}}
    " Easy Window Switching {{{2
    " ---------------------
        map <C-h> <C-w>h
        map <C-j> <C-w>j
        map <C-k> <C-w>k
        map <C-l> <C-w>l
    " }}}
    " Space folds and unfolds {{{2
    " -----------------------
        nnoremap <Space> za
        vnoremap <Space> za
    " }}}
    " Zencoding {{{2
    " ---------
        let g:user_zen_leader_key='<c-e>'
        let g:use_zen_complete_tag = 1
    " }}}
    " Misc {{{2
    " ----
        imap jj <Esc>:redraw!<CR>:syntax sync fromstart<CR>
    " }}}
    " Vimrc Toggle {{{2
    " ------------
        function! ToggleVimrc()
            if expand("%:p") =~ $MYVIMRC
                :bd
            else
                :vsp $MYVIMRC
            endif
        endfunction
        nmap <leader>v :call ToggleVimrc()<CR>
    " }}}

    " NERDTreeToggle {{{2
    " --------------
    function! NERDTreeToggleOrFocus()
        if expand("%") =~ "NERD_tree"
            :NERDTreeTabsToggle
        else
            call NERDTreeFocus()
        endif
    endfunction
        nmap <leader>n :call NERDTreeToggleOrFocus()<CR>
    " }}}
    " Quickfix list nav with C-n and C-m {{{2
    " ----------------------------------
        map <C-n> :cn<CR>
        map <C-m> :cp<CR>
    " }}}
    " Multipurpose Tab-key {{{2
    " --------------------
    " Taken from https://github.com/gregstallings/vimfiles/blob/master/vimrc
        " Indent if at the beginning of a line, else do completion
        function! InsertTabWrapper()
            let col = col('.') - 1
            if !col || getline('.')[col - 1] !~ '\k'
                return "\<tab>"
            else
                if CanExpandSnippet() > 0
                    return "\<C-r>=TriggerSnippet()\<cr>"
                else
                    return "\<c-p>"
                endif
            endif
        endfunction
        "inoremap <tab> <c-r>=InsertTabWrapper()<cr>
        "inoremap <s-tab> <c-n>
        "inoremap <c-c> <C-r>=TriggerSnippet()<cr>
    " }}}
    " Toggle Paste/No Paste {{{2
    " --------------------
        function! TogglePaste()
            if &paste
                :set nopaste
            else
                :set paste
            endif
        endfunction
        nmap <leader>p :call TogglePaste()<CR>
    " }}}
"" ========================= }}}
"" ========================= }}}
"  Performance Optimizations {{{1
"" =========================

    " Fast terminal connections
    set ttyfast

    " Don't redraw when running macros
    set lazyredraw

    " Syntax optimazations
    syntax sync minlines=256

"" =================== }}}
"  Post Configurations {{{1
"" ===================
    " Find local Vim files"
    silent! source ~/.vimrc.local
    silent! source ./.vimrc.local
    " Remap mappings that get overwritten by plugins
    set rtp+=~/.vim/after/
"" }}}
"" ==============

" vim: foldmethod=marker foldmarker={{{,}}} ts=2 sts=2 sw=2 expandtab:
