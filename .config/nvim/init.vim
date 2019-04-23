" from https://www.circuidipity.com/neovim/

set termguicolors

colorscheme gruvbox

set nocompatible            " Disable compatibility to old-time vi

set showmatch               " Show matching brackets.

set ignorecase              " Do case insensitive matching

set mouse=v                 " middle-click paste with mouse

set hlsearch                " highlight search results

set tabstop=4               " number of columns occupied by a tab character

set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing

set expandtab               " converts tabs to white space

set shiftwidth=2            " width for autoindents

set autoindent              " indent a new line the same amount as the line just typed

set number                  " add line numbers

set wildmode=longest,list,full   " get bash-like tab completions

 set cc=80                   " set an 80 column border for good coding style

set clipboard=unnamedplus

set splitright              "open split to the right

set splitbelow              "open split below

filetype on



let mapleader = "\<Space>"

let maplocalleader="\<Space>"

let g:vimtex_compiler_progname='nvr'



" test



" auto-reload config on save

if has ('autocmd') " Remain compatible with earlier versions

 augroup vimrc     " Source vim configuration upon save

    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw

  augroup END

endif " has autocmd



" Shortcutting split navigation, saving a keypress:

	map <C-h> <C-w>h

	map <C-j> <C-w>j

	map <C-k> <C-w>k

    map <C-l> <C-w>l



" Open my bibliography file in split

	map <leader>b :vsp<space>$BIB<CR>

   " map <leader>r :vsp<space>$REFER<CR>

map <leader>t :set bg=light<CR>

" Enter blank line

  map <Enter> o<ESC>



" Disables automatic commenting on newline:

  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o



" Automatically deletes all trailing whitespace on save.

  autocmd BufWritePre * %s/\s\+$//e



" Run xrdb whenever Xdefaults or Xresources are updated.

  autocmd BufWritePost *Xresources,*Xdefaults !xrdb %


" Toggle Markdown
nnoremap  <leader>m :MarkdownPreview <CR>

" Toggle Goyo
nnoremap <leader>g :Goyo <CR>

" Copy to clipboard
nnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

"####

"# Plugins

"###

    " Specify a directory for Plugs

    call plug#begin('~/.local/share/nvim/plugged')



    Plug 'Shougo/neosnippet.vim'



    " neosnippets

    if has('nvim')

      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    else

      Plug 'Shougo/deoplete.nvim'

      Plug 'roxma/nvim-yarp'

      Plug 'roxma/vim-hug-neovim-rpc'

    endif

    let g:deoplete#enable_at_startup = 1

    " window resizing
    Plug 'simeji/winresizer'

    Plug 'Shougo/neosnippet.vim'

    Plug 'Shougo/neosnippet-snippets'


    " git

    Plug 'jreybert/vimagit'


    " show indent guides

    Plug 'nathanaelkane/vim-indent-guides'


    " LaTeX

    Plug 'lervag/vimtex'
      let g:vimtex_toc_enabled = "1"
      let g:vimtex_compiler_method = "arara"
      let g:vimtex_view_automatic="1"
      let g:vimtex_fold_enabled="1"
      let g:vimtex_indent_enabled="1"

    " Grammar
    Plug 'rhysd/vim-grammarous'

    " Avoid duplicate words
    Plug 'dbmrq/vim-ditto'
      " Use autocmds to check your text automatically and keep the highlighting
      " up to date (easier):
      au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds
      nmap <leader>di <Plug>ToggleDitto      " Turn Ditto on and off

    Plug 'reedes/vim-wordy'

    Plug 'junegunn/goyo.vim'

    " Search and replace (:far)

    Plug 'brooth/far.vim'

  """ Themes
  "Plug 'dracula/vim', { 'as': 'dracula' }
  "Plug 'altercation/vim-colors-solarized'
  Plug 'morhetz/gruvbox'

    " R

    Plug 'jalvesaq/Nvim-R'

      vmap <Space> <Plug>RDSendSelection

      nmap <Space> <Plug>RDSendLine

      let R_assign=2

      let R_app = "radian"

      let R_cmd = "R"

      let R_hl_term = 0

      let R_bracketed_paste = 1

  Plug 'vim-pandoc/vim-rmarkdown'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'


    " autocompletion

    Plug 'ncm2/ncm2'



    " enable ncm2 for all buffers

    "autocmd BufEnter * call ncm2#enable_for_buffer()

    " IMPORTANT: :help Ncm2PopupOpen for more information

    set completeopt=noinsert,menuone,noselect

    " NOTE: you need to install completion sources to get completions. Check

    " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki

    Plug 'ncm2/ncm2-bufword'

    Plug 'ncm2/ncm2-path'

    Plug 'gaalcaras/ncm-R'


    Plug 'scrooloose/nerdcommenter'


    " Git

    Plug 'tpope/vim-fugitive'

    "

    " Shows git changes in the file

    Plug 'airblade/vim-gitgutter'

    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

    Plug 'mzlogin/vim-markdown-toc'

    " specify browser to open preview page
    " default: ''
    let g:mkdp_browser = 'surf'



    " Linting

"    Plug 'neomake/neomake'

    Plug 'christoomey/vim-tmux-navigator'



    " Statusline

    Plug 'vim-airline/vim-airline'


    Plug 'vim-airline/vim-airline-themes'

      let g:airline_theme='molokai'



    " Auto-close brackets and quotes

    Plug 'tpope/vim-surround'



    " File Browser Plugin (Ctrl+n)

    Plug 'scrooloose/nerdtree'
      map <C-n> :NERDTreeToggle<CR>
      " auto refresh nerdtree on file save
      autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p

      " Close nerdtree if all windows are closed

      autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

      let NERDTreeShowHidden=1

    "Plug 'Xuyuanp/nerdtree-git-plugin'

    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    Plug 'ryanoasis/vim-devicons'



    " Vim 8 only

    if !has('nvim')

        Plug 'roxma/vim-hug-neovim-rpc'

    endif

    inoremap jk <Esc>



" Initialize Plug system

call plug#end()



" suppress the annoying 'match x of y', 'The only match' and 'Pattern not

    " found' messages

    set shortmess+=c



    " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.

    inoremap <c-c> <ESC>



    " When the <Enter> key is pressed while the popup menu is visible, it only

    " hides the menu. Use this mapping to close the menu and also start a new

    " line.

    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")



    " Use <TAB> to select the popup menu:

    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"



 "   " wrap existing omnifunc

 "   " Note that omnifunc does not run in background and may probably block the

 "   " editor. If you don't want to be blocked by omnifunc too often, you could

 "   " add 180ms delay before the omni wrapper:

 "   "  'on_complete': ['ncm2#on_complete#delay', 180,

 "   "               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],

 "   au User Ncm2Plugin call ncm2#register_source({

 "           \ 'name' : 'css',

 "           \ 'priority': 9,

 "           \ 'subscope_enable': 1,

 "           \ 'scope': ['css','scss'],

 "           \ 'mark': 'css',

 "           \ 'word_pattern': '[\w\-]+',

 "           \ 'complete_pattern': ':\s*',

 "           \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],

 "           \ })

" indent guides

let g:indent_guides_enable_on_vim_startup = 1

"LATEX
"
    " Word count:

    autocmd FileType tex map <leader>w :w !detex \| wc -w<CR>

    " Code snippets

    autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i

    autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA

    autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA

    autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i

    autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i

    autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a

    autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i

    autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i

    autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i

    autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw

    autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>

    autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>

    autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>

    autocmd FileType tex inoremap ,li <Enter>\item<Space>

    autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i

    autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i

    autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i

    autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i

    autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i

    autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i

    autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i

    autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i

    autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i

    autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i

    autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i

    autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i

    autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i

    autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c

    autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i

    autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i

    autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i

    autocmd FileType tex inoremap ,bt {\blindtext}

    autocmd FileType tex inoremap ,nu $\varnothing$

    autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA"
    autocmd FileType tex inoremap ,rn (\ref{})<++><Esc>F}
