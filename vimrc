"------------------------------------------------
" => 基本设置
"------------------------------------------------
let mapleader = ","         "Set mapleader
let maplocalleader='\'      " Change the maplocalleader"
set backspace=2              " 设置退格键可用
set autoindent               " 自动对齐
set ai!                      " 设置自动缩进
set smartindent              " 智能自动缩进
set shiftwidth=2             " 换行时行间交错使用2空格
set cindent shiftwidth=2     " 自动缩进2空格
set nu!                      " 显示行号
set mouse=a                  " 启用鼠标
set ruler                    " 右下角显示光标位置的状态行
set incsearch                " 开启实时搜索功能
set hlsearch                 " 开启高亮显示结果
set nowrapscan               " 搜索到文件两端时不重新搜索
set vb t_vb=                 " 关闭提示音
set hidden                   " 允许在有未保存的修改时切换缓冲区
set autochdir                " 设定文件浏览器目录为当前目录
set foldmethod=syntax        " 选择代码折叠类型
set foldlevel=100            " 禁止自动折叠
set laststatus=2             " 开启状态栏信息
set cmdheight=2              " 命令行的高度，默认为1，这里设为2
"set showmatch               " 显示括号配对情况
"set cursorline              " 突出显示当前行
"set nowrap                  " 设置不自动换行
set writebackup              " 设置无备份文件
set nobackup
set list                     " 显示Tab符，使用一高亮竖线代替
set listchars=tab:\|\ ,
syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全
set history=1000             " keep 1000 lines of command line history
set undolevels=100
set autoread                 " auto read when file is changed from outside
set wrap
set linebreak
set linespace=0
set nofoldenable
set number
set numberwidth=4
set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}
set showmode
set nobomb                    " no BOM(Byte Order Mark)
set nostartofline
set switchbuf=useopen
set showtabline=2             " always show tab
set wildmode=longest,list     " use emacs-style tab completion when selecting files, etc
set wildmenu                  " make tab completion for files/buffers act like bash
set key=			                " disable encryption
set synmaxcol=128
set viminfo=			            " disable .viminfo file
set ttyfast                   " send more chars while redrawing
filetype on                   " enable filetype detection
set t_Co=256
set noswapfile
set nowritebackup
set copyindent                " copy the previous indentation on autoindenting
set ignorecase                        " ignore case when searching
set smartcase
set tabstop=2
" disable sound on errors
set visualbell
set noerrorbells
set t_vb=
set tm=500
" ignores
set wildignore+=*.o,*.obj,*.pyc                " output objects
set wildignore+=*.png,*.jpg,*.gif,*.ico        " image format
set wildignore+=*.swf,*.fla                    " image format
set wildignore+=*.mp3,*.mp4,*.avi,*.mkv        " media format
set wildignore+=*.git*,*.hg*,*.svn*            " version control system
set wildignore+=*sass-cache*
set wildignore+=*.DS_Store
set wildignore+=log/**
set wildignore+=tmp/**

" Source the vimrc file after saving it
autocmd BufWritePost .vimrc source $MYVIMRC

" 每行超过80个的字符用下划线标示
au BufRead,BufNewFile *.s,*.c,*.cpp,*.h,*.cl,*.rb,*.sql,*.sh,*.vim,*.js,*.css,*.html 2match Underlined /.\%81v/


" 设置编码
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1

set autowrite " Write on make/shell commands

set clipboard+=unnamed " Yanks go on clipboard instead
"set spell " Spell checking on
   
"-------------------------------------------------
" => Colors and Fonts
"-------------------------------------------------
"set background=dark " Set background
if !has('gui_running')
    set t_Co=256 " Use 256 colors
endif
colorscheme molokai " Load a colorscheme

nnoremap \t :colorscheme Tomorrow-Night-Eighties<CR>
nnoremap \m :colorscheme molokai<CR>
if has('gui_running')
    nnoremap \t :colorscheme Tomorrow-Night<CR>
    nnoremap \s :colorscheme solarized<CR>
end

if has('gui_running')
    if has('gui_gtk')
        set guifont=Monospace\ 13
    elseif has('gui_win32')
        set guifont=Consolas:h13:cANSI
    endif
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------------------------------------
" => 平台特别配置
"-------------------------------------------------

" On Windows, also use '.vim' instead of 'vimfiles'
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
		"":windowsyong
		source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin

    " 解决菜单乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    " 解决consle输出乱码
    language messages zh_CN.utf-8
endif

set viewoptions+=slash,unix " Better Unix/Windows compatibility
set fileformats=unix,mac,dos " Auto detect the file formats

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ======= 引号 && 括号自动匹配 ======= "
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
:inoremap ` ``<ESC>i
:inoremap # ##<ESC>i
function ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
     return "\<Right>"
  else
     return a:char
  endif
endf


"--------------------------------------------------
" => 插件
"--------------------------------------------------
filetype off " Required!
let g:vundle_default_git_proto='git'
"linux 下设置
set rtp+=~/.vim/bundle/vundle/
""在windows下使用，设置为
"set rtp+=$HOME/.vim/bundle/vundle/
call vundle#rc()
" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 图形界面
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"颜色主题
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'                                     
"显示对齐线
Bundle 'mutewinter/vim-indent-guides'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'Lokaltog/powerline'
" 导航
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar
"--------------------
if executable('ctags')
    Bundle 'majutsushi/tagbar'
endif
nnoremap <Leader>t :TagbarToggle<CR>
let g:tagbar_autofocus=1
let g:tagbar_expand=1
let g:tagbar_foldlevel=2
let g:tagbar_ironchars=['▾', '▸']
let g:tagbar_autoshowtag=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'spolu/dwm.vim'
"nerdtree
"""""""""
Bundle 'scrooloose/nerdtree'
nnoremap <silent> <F2> :NERDTreeToggle<CR>          "F2 打开tree
let NERDTreeShowBookmarks=0
let NERDTreeChDirMode=2
let NERDTreeMouseMode=2
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_open_on_gui_startup=0


"ctrlp 
""""""
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

"ack.vim
"""""""""
Bundle 'mileszs/ack.vim'
" if silver searcher is installed, use `ag` instead of `ack`
" for more information, please visit https://github.com/ggreer/the_silver_searcher
if executable("ag")
  let g:ackprg = 'ag --nogroup --nocolor --column'
  noremap  <Leader>a :Ack<SPACE>
else
  if executable("ack")
    noremap <Leader>a :Ack<SPACE>
  else
    noremap <Leader>a :echo "Sorry, you need to install ack or ag first!"<CR>
  endif
endif

"fugitive 
"""""""""""""""""""""
if executable('git')
    Bundle 'tpope/vim-fugitive'
endif
" shortcuts mapping
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"命令
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------
" => NERD_commenter
"-------------------
Bundle 'scrooloose/nerdcommenter'
let NERDCommentWholeLinesInVMode=2
let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1
Bundle 'jistr/vim-nerdtree-tabs'
""""""""""""""""""""""""""""""""

Bundle 'tpope/vim-surround'
let g:surround_113="#{\r}"     " v
let g:surround_35="#{\r}"      " #
let g:surround_45="<% \r %>"   " -
let g:surround_61="<%= \r %>"  " =
"文本对齐"
Bundle 'godlygeek/tabular'
"--------------------------------------------------
" => SingleCompile编译和运行源代码
"--------------------------------------------------
Bundle 'xuhdev/SingleCompile'
nmap <F5> :SCCompileRun<cr>
nnoremap <Leader>r :SingleCompileRun<CR>
let g:SingleCompile_showquickfixiferror=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatic Helper
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => Syntastic语言编码风格检查
"--------------------------------------------------
Bundle 'scrooloose/syntastic'
nnoremap <Leader>s :Errors<CR>
let g:syntastic_check_on_open=1
let g:syntastic_auto_jump=1
let g:syntastic_stl_format='[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"自动补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'Shougo/neocomplcache'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'spf13/snipmate-snippets'
Bundle 'garbas/vim-snipmate'

"--------------------------------------------------
" => Zencoding
"--------------------------------------------------
Bundle 'ZenCoding.vim'
let g:user_zen_leader_key='<C-Z>'
let g:user_zen_settings={'indentation':'   '}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"语法高亮
"""""""""""""""""""""""""""""""
Bundle 'othree/html5.vim'
Bundle 'groenewege/vim-less'
Bundle 'Markdown'
Bundle 'Markdown-syntax'
Bundle 'skammer/vim-css-color'

"rails
"""""""""""""""""""""""""""""""
Bundle 'tpope/vim-rails'
map <leader>gg :topleft 100 :split Gemfile<CR>
map <leader>gr :topleft 100 :split config/routes.rb<CR>

""vim latex--------------------------------------------------------- 
Bundle 'gerw/vim-latex-suite'
set shellslash 
set grepprg=grep\ -nH\ $*
let g:tex_flavor = 'latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'SumatraPDF -reuse-instance -inverse-search "gvim -c \":RemoteOpen +\%l \%f\""'
let g:Tex_CompileRule_pdf = 'xelatex --synctex=-1 -src-specials -interaction=nonstopmode $*'
let g:Tex_MultipleCompileFormats='pdf'
""------------------------------------------------------------

"pandoc markdow
""""""""""""""""""""""""""""""""""""""""
Bundle 'tpope/vim-markdown'
"文件格式转换"
Bundle 'vim-pandoc/vim-pandoc'
"""""""""""""""""""""""""""""""""""""""""
"--------------------------------------------------
" => EasyTags
"--------------------------------------------------
if executable('ctags')
    Bundle 'xolox/vim-easytags'
endif
function! InitializeTagDirectory()
    let parent=$HOME
    let prefix='.vim'
    let dirname='tags'
    let directory=parent.'/'.prefix.'/'.dirname.'/'
    if !isdirectory(directory)
        if exists('*mkdir')
            call mkdir(directory)
            let g:easytags_by_filetype=directory
        else
            echo "Warning: Unable to create directory: ".directory
            echo "Try: mkdir -p ".directory
        endif
    else
        let g:easytags_by_filetype=directory
    endif
endfunction
call InitializeTagDirectory()
let g:easytags_python_enabled=1
let g:easytags_python_script=1
let g:easytags_include_members=1
highlight cMember gui=italic

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Local bundles if avaiable
if filereadable(expand("~/.vimrc.bundles.local"))
    source ~/.vimrc.bundles.local
endif

filetype plugin indent on " Required!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-------------------------------------------------
" => Filetype Specific
"-------------------------------------------------

" Markdown
augroup ft_markdown
    autocmd!
    " Use <localLeader>1/2/3/4/5/6 to add headings
    autocmd Filetype markdown nnoremap <buffer> <localLeader>1 I# <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>2 I## <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>3 I### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>4 I#### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>5 I##### <ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>6 I###### <ESC>
    " Use <LocalLeader>b to add blockquotes in normal and visual mode
    autocmd Filetype markdown nnoremap <buffer> <localLeader>b I> <ESC>
    autocmd Filetype markdown vnoremap <buffer> <localLeader>b :s/^/> /<CR>
    " Use <localLeader>ul and <localLeader>ol to add list symbols in visual mode
    autocmd Filetype markdown vnoremap <buffer> <localLeader>ul :s/^/* /<CR>
    autocmd Filetype markdown vnoremap <buffer> <LocalLeader>ol :s/^/\=(line(".")-line("'<")+1).'. '/<CR>
    " Use <localLeader>ul and <localLeader>ol to add list symbols in visual mode
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e1 I*<ESC>A*<ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e2 I**<ESC>A**<ESC>
    autocmd Filetype markdown nnoremap <buffer> <localLeader>e3 I***<ESC>A***<ESC>
augroup END

"""""""""""""""""""""设置文件类型"""""""'""""""""""""""""""""'"""""""
" Objective-C
autocmd! BufNewFile,BufRead *.m set filetype=objc

" ActionScript
autocmd! BufNewFile,BufRead *.as set filetype=actionscript
autocmd! BufNewFile,BufRead *.mxml set filetype=mxml

" SCSS
autocmd! BufNewFile,BufRead *.scss set filetype=scss.css

" eRuby
autocmd! BufNewFile,BufRead *.erb set filetype=eruby.html

" JSON
autocmd! BufNewFile,BufRead *.json set filetype=javascript

" GitIgnore
autocmd! BufNewFile,BufRead *.gitignore set filetype=gitignore

" ZSH
autocmd! BufNewFile,BufRead *.zsh-theme set filetype=zsh

" Nginx Config
autocmd! BufNewFile,BufRead nginx.conf set filetype=nginx

" CocoaPods
autocmd! BufNewFile,BufRead Podfile,*.podspec set filetype=ruby

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " NeoComplCache  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " 停用 AutoComplPop.
  "let g:acp_enableAtStartup = 0
  " 启用 neocomplcache.
  let g:neocomplcache_enable_at_startup = 1

  let g:neocomplcache_enable_smart_case = 1
  " 启用大写字母补全.
  let g:neocomplcache_enable_camel_case_completion = 1
  " 启用下划线补全.
  let g:neocomplcache_enable_underbar_completion = 1
  " 设定最小语法关键词长度.
  let g:neocomplcache_min_syntax_length = 3
  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
    " 定义字典.
  let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
         \ }

  " 定义关键词.
  if !exists('g:neocomplcache_keyword_patterns')
      let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
  
  " 插件键映射.
  imap <C-k>     <Plug>(neocomplcache_snippets_expand)
  smap <C-k>     <Plug>(neocomplcache_snippets_expand)
  inoremap <expr><C-g>     neocomplcache#undo_completion()
  inoremap <expr><C-l>     neocomplcache#complete_common_string()
  
  " 推荐的键映射.
  inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><C-Y>  neocomplcache#close_popup()
  inoremap <expr><C-e>  neocomplcache#cancel_popup()
  inoremap <expr><Enter>  pumvisible() ? "\<C-Y>" : "\<Enter>"
  
  " 类似于AutoComplPop用法 .
  let g:neocomplcache_enable_auto_select = 1
  
  " 启用 omni 补全.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  
  " 启用 heavy omni 补全.
  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif
  let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'



"-------------------------------------------------
" => Key Mapping
"-------------------------------------------------

"取词翻译
nmap F :!sdcv -n <C-R>=expand("<cword>")<CR><CR>

" jj                  保存当前文件并留在插入模式      [插入模式]
imap jj <ESC>:w<CR>li

" kk                  返回Normal模式，执行保存      [插入模式]
imap kk <ESC>:w<CR>l

"拼写检查"
map ,ss :setlocal spell!<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
