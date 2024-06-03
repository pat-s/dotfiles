
set termguicolors

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

set wrap
set linebreak
set nolist  " list disables linebreak

set clipboard=unnamedplus

set splitright              "open split to the right

set splitbelow              "open split below

" filetype on
filetype plugin indent on
syntax enable

let mapleader = "\<Space>"

let maplocalleader=","

let g:vimtex_compiler_progname='nvr'
let g:tex_flavor = 'latex'



" i3 syntax highlighting
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
  au BufNewFile,BufRead ~/.config/sway/config set filetype=i3config
aug end


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



" Open  bibliography file in split

	map <leader>b :vsp<space>$BIB<CR>

   " map <leader>r :vsp<space>$REFER<CR>

  map <leader>lb :set bg=light<CR>
  map <leader>db :set bg=dark<CR>

" Enter blank line

  map <Enter> o<ESC>

" Buffer overview
  map <leader>b :BufExplorer<CR>

" Disables automatic commenting on newline:

  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o



" Automatically deletes all trailing whitespace on save.

  autocmd BufWritePre * %s/\s\+$//e



" Run xrdb whenever Xdefaults or Xresources are updated.

  autocmd BufWritePost *Xresources,*Xdefaults !xrdb %


" Toggle Markdown
nnoremap  <leader>m :MarkdownPreview <CR>

" Git
nnoremap  <leader>gs :Gstatus <CR>
nnoremap  <leader>gcf :Gcommit % <CR>
nnoremap  <leader>gc :Gcommit <CR>
nnoremap  <leader>gp :Gpush <CR>

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


"# Plugins

    " Specify a directory for Plugs
    call plug#begin('~/.local/share/nvim/plugged')

    " Buffer handling
    Plug 'jlanzarotta/bufexplorer'

    Plug 'mboughaba/i3config.vim'

    Plug 'Shougo/neosnippet.vim'
    " put word under cursor in quotes
    Plug 'tpope/vim-surround'

    Plug 'editorconfig/editorconfig-vim'

    " Long lines in mail
    Plug 'manu-mannattil/vim-longlines'
    autocmd FileType mail LongLines

    " strip trailing whitespace
    Plug 'itspriddle/vim-stripper'
    " Simplified copy/paste
    Plug 'svermeulen/vim-easyclip'
    " align rows
    Plug 'junegunn/vim-easy-align'
    " Easy commenting
    Plug 'tpope/vim-commentary'
    " Github
    Plug 'tpope/vim-rhubarb'
    " Travis
    Plug 'iurifq/vim-travis-ci'

    " multi-purpose (fzy, open)
    Plug 'Shougo/denite.nvim'

    " project management
    Plug 'dbakker/vim-projectroot'
    " open terminal or file manager in same dir
    Plug 'justinmk/vim-gtfo'
        let g:gtfo#terminals = { 'unix' : 'st' }

    " devtools plugin
    Plug 'mllg/vim-devtools-plugin', { 'for': ['r', 'rmd', 'rnoweb']}
    " edit fish scripts
    Plug 'dag/vim-fish'

    " nnn plugin
    Plug 'mcchrish/nnn.vim'
      let g:nnn#action = {
            \ '<c-t>': 'tab split',
            \ '<c-x>': 'split',
            \ '<c-v>': 'vsplit' }
    " Floating window (neovim)
    function! s:layout()
      let buf = nvim_create_buf(v:false, v:true)

      let height = &lines - (float2nr(&lines / 3))
      let width = float2nr(&columns - (&columns * 2 / 3))

      let opts = {
            \ 'relative': 'editor',
            \ 'row': 2,
            \ 'col': 8,
            \ 'width': width,
            \ 'height': height
            \ }

      call nvim_open_win(buf, v:true, opts)
    endfunction
    let g:nnn#layout = 'call ' . string(function('<SID>layout')) . '()'

    Plug 'w0rp/ale'
      "let g:ale_linters = {
      "          'r': ['styler']
      "          }
      let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'r': ['styler'],
            \}
      let g:ale_r_styler_options = 'styler::mlr_style'
      "let g:ale_r_lintr_options = ''
    " neosnippets

    if has('nvim')

      "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    else

      "Plug 'Shougo/deoplete.nvim'

      Plug 'roxma/nvim-yarp'

      Plug 'roxma/vim-hug-neovim-rpc'

    endif

    let g:deoplete#enable_at_startup = 1

    " window resizing
    Plug 'simeji/winresizer'

    Plug 'Shougo/neosnippet.vim'
      " Plugin key-mappings
      " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
      imap <C-k>     <Plug>(neosnippet_expand_or_jump)
      smap <C-k>     <Plug>(neosnippet_expand_or_jump)
      xmap <C-k>     <Plug>(neosnippet_expand_target)
      " SuperTab like snippets behavior.
      " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
      "imap <expr><TAB>
      " \ pumvisible() ? "\<C-n>" :
      " \ neosnippet#expandable_or_jumpable() ?
      " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
      smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
      " For conceal markers.
      if has('conceal')
        set conceallevel=2 concealcursor=niv
      endif

    Plug 'Shougo/neosnippet-snippets'


    " git

    Plug 'jreybert/vimagit'


    " show indent guides

    "Plug 'nathanaelkane/vim-indent-guides'


    " LaTeX

    Plug 'lervag/vimtex'
      let g:vimtex_toc_enabled = "1"
      let g:vimtex_compiler_method = "arara"
      let g:vimtex_view_automatic="1"
      let g:vimtex_fold_enabled="1"
      let g:vimtex_indent_enabled="1"
      let g:vimtex_view_general_viewer="okular"
      let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
      let g:vimtex_view_general_options_latexmk = '--unique'
      let g:vimtex_toc_config = {
            \ 'fold_enable': '1',
            \ 'tocdepth': '2',
            \ 'fold_level_start': '-1',
            \ 'resize': '0',
            \ 'layer_status': {
                \ 'label': 0,
                \ 'todo': 0,
                \ 'include': 0
                \ }
            \ }



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
      let g:goyo_width = '120'

    " Search and replace (:far)

    Plug 'brooth/far.vim'
      let g:far#window_layout = 'tab'
      "let g:far#source = 'acknvim'

  """ Themes
  "Plug 'dracula/vim', { 'as': 'dracula' }
  "Plug 'altercation/vim-colors-solarized'
  Plug 'morhetz/gruvbox'

    hi! link rPreProc GruvboxBlue
    hi! link rFunction GruvboxAqua
    hi! link rCommentTodo GruvboxOrange
    hi! link rOperator GruvboxRed
    hi! link rLstElmt GruvboxPurple
    hi! link rOperator GruvBoxBlue
    hi! link rDelimiter GruvboxFg3

  Plug 'ctrlpvim/ctrlp.vim'

    " R

"    Plug 'jalvesaq/Nvim-R'
"
"      vmap <Space> <Plug>RDSendSelection
"
"      nmap <Space> <Plug>RDSendLine
"      nmap <LocalLeader>rl :RLoadPackage<CR>
"      nmap <LocalLeader>rd :RDocumentPackage<CR>
"      autocmd FileType r noremap <buffer> <LocalLeader>dd :RDocumentPackage<cr>
"      autocmd FileType r noremap <buffer> <LocalLeader>ll :RLoadPackage<cr>
"      let g:r_indent_align_args = 0
"      let R_assign=2
"
"      let R_app = "radian"
"
"      let R_cmd = "R"
"
"      let R_hl_term = 0
"
"      let R_bracketed_paste = 1
"      let R_nvimpager = 'no'
"      let g:R_close_term = 1                    " Close terminal buffer after R quited
"      let g:R_in_buffer = 1                     " Run R in Vim/Neovim built in terminal emulator
"      let g:rout_follow_colorscheme = 1         " R output is highlighted

      "let R_objbr_place = 'console,below'

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
    nmap <F9> :Gstatus<cr>

    " Shows git changes in the file

    Plug 'airblade/vim-gitgutter'

    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

    Plug 'mzlogin/vim-markdown-toc'

    " specify browser to open preview page
    " default: ''
    let g:mkdp_browser = 'chromium'


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
      "autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p

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

"      autocmd FileType r if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif
"      autocmd FileType rmd if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif
"      autocmd VimLeave * if exists("g:SendCmdToR") && string(g:SendCmdToR) != "function('SendCmdToR_fake')" | call RQuit("nosave") | endif

colorscheme gruvbox

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not

    " found' messages

    " ale shortcut
    nmap <F8> <Plug>(ale_fix)

    " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.

    inoremap <c-c> <ESC>

    " When the <Enter> key is pressed while the popup menu is visible, it only

    " hides the menu. Use this mapping to close the menu and also start a new

    " line.

    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

    " vimtex snippets https://jdhao.github.io/2019/03/26/nvim_latex_write_preview/
    "call deoplete#custom#var('omni', 'input_patterns', {
    "      \ 'tex': g:vimtex#re#deoplete
    "      \})



    " Use <TAB> to select the popup menu:

    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    """ R
    " start R with F2 key
    map <F2> <Plug>RStart
    imap <F2> <Plug>RStart
    vmap <F2> <Plug>RStart
    " Use Ctrl-Space to do omnicompletion
    inoremap <C-Space> <C-x><C-o>

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

" VSCodium

"VSCode
function! s:split(...) abort
    let direction = a:1
    let file = a:2
    call VSCodeCall(direction == 'h' ? 'workbench.action.splitEditorDown' : 'workbench.action.splitEditorRight')
    if file != ''
        call VSCodeExtensionNotify('open-file', expand(file), 'all')
    endif
endfunction

function! s:splitNew(...)
    let file = a:2
    call s:split(a:1, file == '' ? '__vscode_new__' : file)
endfunction

function! s:closeOtherEditors()
    call VSCodeNotify('workbench.action.closeEditorsInOtherGroups')
    call VSCodeNotify('workbench.action.closeOtherEditors')
endfunction

function! s:manageEditorSize(...)
    let count = a:1
    let to = a:2
    for i in range(1, count ? count : 1)
        call VSCodeNotify(to == 'increase' ? 'workbench.action.increaseViewSize' : 'workbench.action.decreaseViewSize')
    endfor
endfunction

function! s:vscodeCommentary(...) abort
    if !a:0
        let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
        return 'g@'
    elseif a:0 > 1
        let [line1, line2] = [a:1, a:2]
    else
        let [line1, line2] = [line("'["), line("']")]
    endif

    call VSCodeCallRange("editor.action.commentLine", line1, line2, 0)
endfunction

function! s:openVSCodeCommandsInVisualMode()
    normal! gv
    let visualmode = visualmode()
    if visualmode == "V"
        let startLine = line("v")
        let endLine = line(".")
        call VSCodeNotifyRange("workbench.action.showCommands", startLine, endLine, 1)
    else
        let startPos = getpos("v")
        let endPos = getpos(".")
        call VSCodeNotifyRangePos("workbench.action.showCommands", startPos[1], endPos[1], startPos[2], endPos[2], 1)
    endif
endfunction

function! s:openWhichKeyInVisualMode()
    normal! gv
    let visualmode = visualmode()
    if visualmode == "V"
        let startLine = line("v")
        let endLine = line(".")
        call VSCodeNotifyRange("whichkey.show", startLine, endLine, 1)
    else
        let startPos = getpos("v")
        let endPos = getpos(".")
        call VSCodeNotifyRangePos("whichkey.show", startPos[1], endPos[1], startPos[2], endPos[2], 1)
    endif
endfunction


command! -complete=file -nargs=? Split call <SID>split('h', <q-args>)
command! -complete=file -nargs=? Vsplit call <SID>split('v', <q-args>)
command! -complete=file -nargs=? New call <SID>split('h', '__vscode_new__')
command! -complete=file -nargs=? Vnew call <SID>split('v', '__vscode_new__')
command! -bang Only if <q-bang> == '!' | call <SID>closeOtherEditors() | else | call VSCodeNotify('workbench.action.joinAllGroups') | endif
" Better Navigation
nnoremap <silent> <Cmd-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <silent> <Cmd-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <silent> <Cmd-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <silent> <Cmd-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <silent> <Cmd-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <silent> <Cmd-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <Cmd-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <silent> <Cmd-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>


nnoremap <silent> <Cmd-w>_ :<Cmd-u>call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>

nnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
xnoremap <silent> <Space> :<C-u>call <SID>openWhichKeyInVisualMode()<CR>
xnoremap <silent> <C-P> :<C-u>call <SID>openVSCodeCommandsInVisualMode()<CR>
