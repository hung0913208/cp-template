" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'skanehira/gh.vim'
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'L-TChen/auto-dark-mode.vim'
Plug 'relastle/bluewery.vim'
Plug 'drzel/vim-repo-edit'
Plug 'dense-analysis/ale'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'gburca/vim-logcat'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'wakatime/vim-wakatime'
Plug 'keith/swift.vim'
Plug '0x84/vim-coderunner'
Plug 'rhysd/wandbox-vim'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-signify'
Plug 'embear/vim-localvimrc'
Plug 'jremmen/vim-ripgrep'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'garbas/vim-snipmate'
Plug 'jvanja/vim-bootstrap4-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
"Plug 'sheerun/vim-polyglot'
Plug 'hung0913208/codingblocks.vim'
Plug 'AndrewRadev/linediff.vim'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tibabit/vim-templates'
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips' , { 'tag': '2.2' }
Plug 'pgilad/vim-skeletons'
Plug 'sillybun/vim-repl'
"Plug 'tomtom/tlib_vim'
"Plug 'honza/vim-snippets'
call plug#end()

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX
"check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 <
  "https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) <
  "https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Set buffer to apart of our session
set sessionoptions+=buffers

if has('gui_running')
	set guifont=SauceCodePro\ Nerd\ Font\ Mono:h13
else
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h16
endif
set hlsearch
set incsearch
set number

autocmd Filetype cpp setlocal tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
autocmd Filetype c setlocal tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd Filetype d setlocal tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd Filetype go setlocal tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd Filetype rust setlocal tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd Filetype swift setlocal tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd Filetype java setlocal tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd Filetype kotlin setlocal tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd Filetype bash setlocal tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd Filetype python setlocal tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd Filetype bash setlocal tabstop=4 softtabstop=0 shiftwidth=4 smarttab
autocmd Filetype haskell setlocal tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

nmap <leader>p :VimuxPromptCommand<CR>

function! Csc()
  cscope find c <cword>
endfunction
command! Csc call Csc()

function! Cdef()
  cscope find d <cword>
endfunction
command! Cdef call Cdef()

function! Csym()
  cscope find s <cword>
endfunction
command! Csym call Csym()

function! Cgrep()
  Rg <cword> ./**/*.*
  copen
endfunction

nnoremap <C-p> :Files<cr>
nnoremap ,. :Tags<cr>
nnoremap ,, :BTags<cr>
nnoremap .. :Commits<cr>
nnoremap // :BLines<cr>
nnoremap <C-s> :Csym<cr>
nnoremap <C-d> :Cdef<cr>
nnoremap <C-c><C-g> :Rg<cr>
nnoremap <C-c><C-c> :Csc<cr>
nnoremap <C-c><C-d> :Cdef<cr>
nnoremap <C-c><C-f> :Csym<cr>
nnoremap <C-g><C-b> :Git blame<cr>
nnoremap <C-g><C-l> :Git log --graph<cr>
nnoremap <C-g><C-u> :Git pull<cr>
nnoremap <C-g><C-p> :Git push --force<cr>
nnoremap <C-g><C-c> :Git commit --signoff<cr>
nnoremap <C-g><C-a> :Git commit --amend --signoff<cr>
nnoremap <C-g><C-f> :Git commit --amend --signoff --no-edit<cr>
nnoremap <C-k><C-b> :NERDTreeToggle<cr>
nnoremap <C-k><C-n> :TagbarToggle<cr>
nnoremap q :bd!<cr>
nnoremap s :w!<cr>
vnoremap <silent> '' :.w !pbcopy<cr>
nnoremap <silent> '' :r !pbpaste<cr>

" In ~/.vim/vimrc, or somewhere similar.
let g:ale_fixers = {
	\   '*': ['remove_trailing_lines', 'trim_whitespace'],
	\   'cpp': ['clang-format'],
	\   'c': ['clang-format'],
	\ }

let g:ale_linters = {
	\	'cpp': ['gcc'],
	\	'c': ['gcc']
	\ }
let g:ale_enabled = 0
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

autocmd filetype * match ErrorMsg '\%<0v.\+'

autocmd filetype python highlight clear ALEErrorSign
autocmd filetype python highlight clear ALEWarningSign
autocmd filetype python match ErrorMsg '\%>80v.\+'

autocmd filetype java highlight clear ALEErrorSign
autocmd filetype java highlight clear alewarningsign
autocmd filetype java match ErrorMsg '\%>120v.\+'

autocmd filetype cpp highlight clear ALEErrorSign
autocmd filetype cpp highlight clear ALEWarningSign
autocmd filetype cpp match ErrorMsg '\%>80v.\+'

autocmd filetype c highlight clear ALEErrorSign
autocmd filetype c highlight clear ALEWarningSign
autocmd filetype c match ErrorMsg '\%>80v.\+'

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif

"highlight ColorColumn ctermbg=gray
"set colorcolumn=80

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" let g:ctrlp_clear_cache_on_exit = 0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*
set cursorline

let g:localvimrc_ask = 0

set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2
set completeopt-=preview
set completeopt+=menuone,noinsert,noselect
let g:jedi#popup_on_dot = 0  " It may be 1 as well
let g:mucomplete#enable_auto_at_startup = 1

set belloff=all

if !has('gui_running')
	set t_Co=256
else
	set guioptions=
endif

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
\ call fzf#vim#grep(
                    \   'git grep --line-number '.shellescape(<q-args>), 0,
                    \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" Override Colors command. You can safely do this in your .vimrc as fzf.vim
" will not override existing commands.
command! -bang Colors
\ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
\ call fzf#vim#ag(<q-args>,
                  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
                  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
                  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
                    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
                    \   <bang>0 ? fzf#vim#with_preview('up:60%')
                    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
                    \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

function! LoadCscope()
	let db = findfile("cscope.out", ".;")

	if (!empty(db))
		let path = strpart(db, 0, match(db, "/cscope.out$"))
		set nocscopeverbose " suppress 'duplicate connection' error
		exe "cs add " . db . " " . path
		set cscopeverbose

		" else add the database pointed to by
		" environment variable
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
endfunction

au BufEnter /* call LoadCscope()

" vim-android
let g:android_sdk_path = '/Users/hung0913208/Downloads/tools'

" lightline-buffer config
set hidden  " allow buffer switching without saving
set ruler   " show ruler
set laststatus=2 " always show laststatus
set showtabline=2  " always show tabline

" use lightline-buffer in lightline
let g:lightline = {
    \ 'separator': { 'left': '', 'right': ''  },
    \ 'subseparator': { 'left': '', 'right': ''  },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
    \             [ 'separator' ],
    \             [ 'tagbar' ],
    \           ]
    \ },
    \ 'tabline': {
    \   'left': [ [ 'bufferinfo' ],
    \             [ 'separator' ],
    \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
    \   'right': [ [ 'close' ] ],
    \ },
    \ 'component_expand': {
    \   'buffercurrent': 'lightline#buffer#buffercurrent',
    \   'bufferbefore': 'lightline#buffer#bufferbefore',
    \   'bufferafter': 'lightline#buffer#bufferafter',
    \ },
    \ 'component_type': {
    \   'buffercurrent': 'tabsel',
    \   'bufferbefore': 'raw',
    \   'bufferafter': 'raw',
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head',
    \   'bufferinfo': 'lightline#buffer#bufferinfo',
    \ },
    \ 'component': {
    \   'tagbar': '%{tagbar#currenttag("[%s]", "")}',
    \ },
    \ }

" remap arrow keys
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
let g:lightline_buffer_logo = ' '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = '  '

let g:lightline#bufferline#auto_hide = 4000
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed      = '[No Name]'

let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

"let g:lightline.colorscheme = 'gruvbox'

" enable devicons, only support utf-8
" require <https://github.com/ryanoasis/vim-devicons>

if has('gui_running')
  let g:lightline_buffer_enable_devicons = 1
else
  let g:lightline_buffer_enable_devicons = 0
endif

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1

" :help filename-modifiers
let g:lightline_buffer_fname_mod = ':t'

" hide buffer list
let g:lightline_buffer_excludes = ['vimfiler']

" max file name length
let g:lightline_buffer_maxflen = 30

" max file extension length
let g:lightline_buffer_maxfextlen = 3

" min file name length
let g:lightline_buffer_minflen = 16

" min file extension length
let g:lightline_buffer_minfextlen = 3

" reserve length for other component (e.g. info, close)
let g:lightline_buffer_reservelen = 20

" change intent line to make it looks better
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let g:wandbox#default_compiler = {
\   'd': 'dmd-head',
\   'go': 'go-1.15.11',
\   'cpp': 'gcc-8.4.0',
\   'rust': 'rust-1.51.0',
\   'swift': 'swift-5.0.1',
\   'python': 'cpython-3.9.3',
\   'haskell': 'ghc-8.8.4'
\ }

" Set extra options for compilers if you need
let g:wandbox#default_extra_options = {
\   'gcc-10.1.0': '-Ofast -Wall -Wextra -pedantic -std=c++2a -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 ',
\   'gcc-8.4.0': '-Ofast -Wall -Wextra -pedantic -std=c++2a -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -I/opt/wandbox/boost-1.73.0/gcc-8.4.0/include ',
\   'ghc-8.8.4': '-threaded -rtsopts',
\   'dmd-head' : '-unittest',
\ }

let g:wandbox#default_options = {
\   'cpp': 'warning,optimize,boost-1.73,gcc-8.4.0',
\   'haskell': 'warning,optimization,ghc-8.8.4',
\ }

" config coderunner
"let g:vcr_languages["objc"] = {
"    \ "compiler": "cpp.sh",
"    \ "compiler_flags": "-fobjc-arc -framework Foundation -Ofast -Wall -Wextra -pedantic -std=c++2a -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 ",
"    \ "cmd": "./$compiler",
"    \ "ext": "m"
"    \ }

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Config gist username and token
let g:github_user="hung0913208"
let g:gist_token="70ac3220aad0993d953d0506287e2907a10b5704"

" workaround to fix using backspace to remove characters in INSERT mode
set nocompatible
set backspace=indent,eol,start

"[Rg] Config fzf to use with ripgrep
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

autocmd filetype cpp map <leader>b :<C-U>!clang++ -Wall -Wextra -pedantic -std=c++17 -O2 -g -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wshift-overflow -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2  -fprofile-instr-generate -Wno-sign-conversion %:r.cpp -o %:r<CR>
autocmd filetype cpp map <leader>d :<C-U>!clang++ -Wall -Wextra -pedantic -std=c++17 -O2 -g -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wshift-overflow -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-omit-frame-pointer -fsanitize-link-c++-runtime -fno-sanitize-recover -fstack-protector -fprofile-instr-generate -Wno-sign-conversion -DUSE_SANITIZER=1 %:r.cpp -o %:r<CR>
autocmd filetype cpp map <leader>g :<C-U>!lldb -batch -o 'thread backtrace all' -o 'quit' %:r<CR>
autocmd filetype cpp map <leader>r :<C-U>!%:r<CR>

" Configure vim-templates
let g:tmpl_search_paths = ['~/.dotfiles/vim/skeletons']
let g:tmpl_author_email = 'hung0913208@gmail.com'
let g:tmpl_author_name = 'Hung Nguyen Xuan Pham'

" Configure vim-skeleton
let skeletons#autoRegister = 1
let skeletons#skeletonsDir = "~/.dotfiles/vim/skeletons"

" Configure vim-devicons
set encoding=UTF-8

" Configure gh.vim
let g:gh_token = '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'

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 0

" Configure to make vim-session to be able to autoload after closing
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

" Clear ^G
let g:NERDTreeNodeDelimiter = "\u00a0"

" New command to control ale fixer
command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"

" Set colorscheme base on which type of vim running
if !has('gui_running')
	set background=dark
endif

colorscheme gruvbox

" Config monikai with italic font
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

" Set syntax off
syntax on

" Set nowrap
set nowrap
