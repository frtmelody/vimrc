set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/vim-plug
call plug#begin('~/.vim/bundle')

Plug 'frtmelody/vim-plug'
"Plug 'gmarik/Vundle.vim'

Plug 'frtmelody/a.vim'
Plug 'DoxygenToolkit.vim'
""Plug 'tomasr/molokai'
Plug 'fatih/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/vim-emoji'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'  }
"""plugin
Plug 'auto_mkdir'
Plug 'TagHighlight'
Plug 'auto-pairs'
Plug 'cuteErrorMarker'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'indent-motion'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'OmniCppComplete'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'surround.vim'
Plug 'majutsushi/tagbar'
Plug 'tlib'
Plug 'indentLine.vim'
Plug 'project.tar.gz'
Plug 'Pydiction'
Plug 'fatih/vim-go'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'L9'

Plug 'vim-orgmode'
Plug 'speeddating.vim'
Plug 'dantezhu/authorinfo'
Plug 'Valloric/YouCompleteMe',  { 'do': './install.py --clang-completer --gocode-completer --tern-completer --system-libclang' }
Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'
Plug 'plasticboy/vim-markdown'
Plug 'JamshedVesuna/vim-markdown-preview'
"Plug 'scrooloose/syntastic'
Plug 'frtmelody/vim-autoformat'

Plug 'kien/rainbow_parentheses.vim'

Plug 'junegunn/vim-easy-align'
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-scripts/matchit.zip'
"Git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
"cloorcheme
Plug 'flazz/vim-colorschemes'
Plug 'colepeters/spacemacs-theme.vim'

"" 等号对齐
Plug 'godlygeek/tabular'

"ctrlp
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'

Plug 'dyng/ctrlsf.vim'
Plug 'rking/ag.vim'
"Plug 'vim-multiple-cursors'

"ack, dash
Plug 'mileszs/ack.vim'
Plug 'rizzatti/dash.vim'

" c++ 代码生成
Plug 'frtmelody/vim-fswitch'
Plug 'derekwyatt/vim-protodef'

" vim 终端
Plug 'frtmelody/conque'
"快速选中结对
Plug 'gcmt/wildfire.vim'

" undo
Plug 'sjl/gundo.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'nginx.vim'

Plug 'derekwyatt/vim-scala'
Plug 'ktvoelker/sbt-vim'
Plug 'mpollmeier/vim-scalaConceal'

" tmux
Plug 'christoomey/vim-tmux-navigator'

call plug#end()
" General Settings

set laststatus=2   " Always show the statusline
set showcmd
set cmdheight=1
set nocompatible	" not compatible with the old-fashion vi mode
set bs=2		" allow backspacing over everything in insert mode
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set autoread		" auto read when file is changed from outside
set nu
set mouse=h
set title
set magic
set titleold = "


filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

au BufEnter /usr/include/c++/* setf cpp

function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'b'
        execute "normal ?" . l:pattern . "<cr>"
    else
        execute "normal /" . l:pattern . "<cr>"
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

if exists('$TMUX')
    set term=xterm-256color
endif

"使用粘贴的时候 禁止缩进
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" auto reload vimrc when editing it
au BufWritePost ~/.vim/vimrc source ~/.vim/vimrc

syntax enable
syntax on		" syntax highlight
set hlsearch		" search highlighting
"nm<Space> i<space><Esc>l

set background=dark
set t_Co=256
"colorscheme solarized
if (has("termguicolors"))
  set termguicolors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
colorscheme molokai
let g:solarized_termcolors=256
let g:rehash256 = 1
let g:molokai_original = 1

"let g:airline_theme= "molokai"
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_enable_branch= 1
let g:airline_detect_paste= 1
""" powerline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_alt_sep = ''
let g:airline_right_sep = '«'
let g:airline_right_alt_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

set cursorline         " highlight current line



set guioptions-=T
"set clipboard=unnamed	" yank to the system register (*) by default
set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

set autoindent		" auto indentation
set incsearch		" incremental search
set nobackup		" no *~ backup files
set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context

" disable sound on errors
set noerrorbells
set novisualbell
set vb t_vb=
set tm=500
set autowrite

" TAB setting{
set expandtab        "replace <TAB> with spaces
set softtabstop=4
set shiftwidth=4

au FileType Makefile set noexpandtab


" C/C++ specific settings
autocmd FileType c,cpp,cc,h set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^0,:s,=s,g0,h1s,ps,t0,+s,(0,ms,)20,*30
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=8 shiftwidth=8

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"---------------------------------------------------------------------------
" Tip #382: Search for <cword> and replace with input() in all open buffers
"---------------------------------------------------------------------------
fun! Replace(confirm)
    let s:word = input("Replace " . expand('<cword>') . " with:")
    if a:confirm
        :exe 'argdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/gec'
    else
        :exe 'argdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/ge'
    endif
    :unlet! s:word
endfun

set wmw=0                     " set the min width of a window to 0 so we can maximize others
set wmh=0                     " set the min height of a window to 0 so we can maximize others


" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete

"---------------------------------------------------------------------------
" ENCODING SETTINGS
"---------------------------------------------------------------------------
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk,ucs-bom,cp936


" --- EasyMotion
"let g:EasyMotion_leader_key = '<Leader>m' " default is <Leader>w
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment


" --- TagBar
" toggle TagBar with F7
let NERDTreeQuitOnOpen = 0
let g:tagbar_width = 25
" set focus to TagBar when opening it
let g:tagbar_autofocus = 0



set path+=/usr/local/include
set path+=/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include
set path+=/usr/include
set path+=/usr/lib/gcc/x86_64-redhat-linux/4.4.7/../../../../include/c++/4.4.7
set path+=/usr/lib/gcc/x86_64-redhat-linux/4.4.7/../../../../include/c++/4.4.7/x86_64-redhat-linux
set path+=/usr/lib/gcc/x86_64-redhat-linux/4.4.7/../../../../include/c++/4.4.7/backward
set path+=/usr/local/include
set path+=/usr/lib/gcc/x86_64-redhat-linux/4.4.7/include
set path+=/usr/include
set path+=~/svnprojects/include

"
"OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD", "string", "vector", "map"]
let OmniCpp_SelectFirstItem = 2

set completeopt=menuone,menu,longest,preview



"indentline
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_dark = 1
let g:indentLine_char = '¦'

set cursorcolumn



highlight Pmenu    guibg=darkgrey  guifg=black
highlight PmenuSel guibg=lightgrey guifg=black

"author info
let g:vimrc_author='FrtMeLody'
let g:vimrc_email='frtmelody@gmail.com'
let g:vimrc_homepage='http://www.meelive.cn'


"doxygen setting
let g:DoxygenToolkit_authorName="FrtMeLody, frtmelody@gmail.com"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1


"pydict"
let g:pydiction_location='~/.vim/bundle/Pydiction/complete-dict'

"snipmate
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"ycm config
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_auto_trigger = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_echo_current_diagnostic = 1
let g:ycm_complete_in_strings = 1
let g:ycm_use_ultisnips_completer = 1

set completeopt-=preview

"augroup load_us_ycm
"    autocmd!
"    autocmd InsertEnter * call plug#load('ultisnips')
"                \| call UltiSnips#FileTypeChanged()
"                \| autocmd! load_us_ycm
"augroup END
"let g:ycm_key_list_select_completion = ['<S-TAB>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<S-Tab>'
"

"markdown"
let g:vim_markdown_folding_disabled=1
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'


"easymotione
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

"auto formater
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 1
au BufWritePre * :Autoformat
"au BufWritePost * :SyntasticCheck

"let g:formatters_c = ['astyle_c']
"let g:formatdef_astyle_c = '"astyle --mode=c -A2 -f -S -p -k1 -v -U -H -N -M -w -L -s4 -o"'
"let g:formatters_cpp = ['astyle_cpp']
"let g:formatdef_astyle_cpp = '"astyle --mode=c -A2 -f -S -p -k1 -v -U -H -N -M -w -L -s4 -o"'
"let g:formatdef_autopep8 = '"autopep8 --aggressive --aggressive -"'

"let g:syntastic_python_checkers = ['flake8']

"golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1

let g:go_def_mode = 'godef'
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 0
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
"let g:go_auto_type_info = 1
"let g:go_auto_sameids = 1

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

"ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

" ale syntastic
let g:ale_sign_error = '✗'
""let g:ale_sign_warning = '⚠'
let g:ale_sign_warning = '⊝'
"let g:ale_sign_error = emoji#for('boom')
"let g:ale_sign_warning = emoji#for('small_orange_diamond')
highlight clear ALEErrorSign
highlight clear ALEWarningSign

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_lint_on_enter = 1

"let g:ale_linters = {"go":["gometalinter"]}
let g:ale_linters = {"go":["go build", "go vet", "golint", "staticcheck", "gofmt"]}
let g:ale_go_gometalinter_options = "--fast"



 "synatistic
"let g:syntastic_error_symbol = '➜'
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
"

"---------------------------------------------------------------------------
" USEFUL SHORTCUTS
"---------------------------------------------------------------------------
" set leader to ,
let mapleader=","
let g:mapleader=","

vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>


map gf :IHV<cr>

"replace the current word in all opened buffers
map <leader>s :call Replace(0)<CR>
map <leader>r :call Replace(1)<CR>

"surround
"ds
"cs
"ys$" 当前到行尾, 引号引住"
map <leader>e ysiw
" open the error console
map <leader>ec :botright cope<CR>
" move to next error
map <leader>] :cn<CR>
" move to the prev error
map <leader>[ :cp<CR>

" --- move around splits {
" move to and maximize the below split
"map <C-j> <ESC><C-w>j
"map <C-k> <ESC><C-w>k
"map <C-h> <ESC><C-w>h
"map <C-l> <ESC><C-w>l

" ,/ turn off search highlighting
nmap <leader>/ :nohl<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

"tagbar
nnoremap <silent> <F7> :TagbarToggle<CR>
nnoremap <silent> <leader>tt :TagbarToggle<CR>
nnoremap <silent> <F8> :NERDTreeToggle<CR>
nnoremap <silent> <leader>tn :NERDTreeToggle<CR>

"ctags
"map <Leader>c :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ .<CR>

"add author info
"nmap <F4> :AuthorInfoDetect<cr>
"add doc
"nmap <F3> :Dox <cr>
"nmap <F2> :ConqueTermVSplit

"goto here
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

nmap s <Plug>(easymotion-s)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)

" git fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
"nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gt :SignifyToggle<CR>

"tabularize
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a,, :Tabularize /,\zs<CR>
vmap <Leader>a,, :Tabularize /,\zs<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

" This selects the next closest text object.
map <SPACE> <Plug>(wildfire-fuel)
" This selects the previous closest text object.
vmap <C-SPACE> <Plug>(wildfire-water)

nnoremap <Leader>u :GundoToggle<CR>

"彩色括弧
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" tmux
"let g:tmux_navigator_no_mappings = 0
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

" ctrlfs
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
nmap     <C-F>l <Plug>CtrlSFQuickfixPrompt
vmap     <C-F>l <Plug>CtrlSFQuickfixVwordPath
vmap     <C-F>L <Plug>CtrlSFQuickfixVwordExec

" vim zhs
nmap <C-x>s :ConqueTermVSplit zsh<CR>

let g:syntastic_ignore_files = ['\m\c\.h$', '\m\.sbt$']

" Scala has fsc and scalac checkers--running both is pretty redundant and
" slow. An explicit `:SyntasticCheck scalac` can always run the other.
"let g:syntastic_scala_checkers = ['fsc']
"let g:syntastic_scala_checkers = ['']

let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }


if has('gui_running')
        set guioptions-=T           " Remove the toolbar
        "set lines=40                " 40 lines of text instead of 24
        set guifont=Andale\ Mono\ Regular:h16,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h16
endif
