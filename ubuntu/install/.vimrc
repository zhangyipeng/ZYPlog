set nocompatible        "be IMproved,required
filetype off            "required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively ,pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle,required
Plugin  'VundleVim/Vundle.vim'

" The following are example of different formats supported
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'majutsushi/tarbar'
Plugin 'L9'

Plugin 'taglist.vim'	"显示定位程序中各种符号的插件
let Tlist_Use_Right_Window=1 "taglist窗口出现在右边
let Tlist_File_Fold_Auto_close=1 "当同时显示多个文件的tag时，只显示当前，其他折叠
let Tlist_Show_One_File=1 "只显示一个文件的tag，默认显示多个
let Tlist_GainFocus_On_ToggleOpen=1 "窗口打开时，立刻切换为焦点状态
let Tlist_Exit_OnlyWindow=1 "当最后一个窗口时，退出vim
let Tlist_WinWidth=32 "设置窗体宽度为32
let Tlist_Ctags_Cmd='ctags' "ctags地址
map <F3> :TlistToggle<CR>

Plugin 'scrooloose/nerdtree'	"树形资源管理器
let NERDTreeWinPos='right'
let NERDTreeWinSize=31
let NERDTreeChDirMode=1
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif		"当最后一个窗口时退出vim

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'	"底部功能条
let g:airline#extensions#tabline#enabled = 1			"自动显示所有的buffers当仅有一个tab打开打开tablist
"let g:airline#extensions#statusline#enabled = 1
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
"let g:airline_powerline_fonts =1

"添加配色修改方案，修改例子 colorscheme molokai/solarized
Plugin 'flazz/vim-colorschemes'
"colorscheme  molokai

"添加一个补全插件youcompleteme
Plugin 'Valloric/YouCompleteMe'




"添加全局搜索插件--使用失败
"Plugin 'mileszs/ack.vim'
"map <F4> :Ack -i
"let g:ackprg = "/usr/bin/ack -s -H --nocolor --nogroup --column"
"All of your Plugins must be added before the following line
call vundle#end()       "required
filetype plugin indent on   "required
"To ignore plugin indent changes,instead use:
"filtype plugin on
"
"Brief help
":Pluginlist    -Lists configured plugins
":PluginInstall -installs plugins;append '!' to update or just ：PluginUpdate
":PluginSearch foo -searchs for foo;append'!'to refresh loacl cache
"PluginClean    -confirms removal of unused plugins;append'!'to auto-approve
"remval
"see:h vundle for more details or wiki for FAQ
"Put your non-Plugin stuff afer this line
"Launch vim and run :PluginInstall
"===============开启颜色配置
set background=dark
colorscheme solarized
"molokai多彩模式phd复古模式solarized素雅模式
"==============个人配置
set gcr=a:block-blinkon0	"禁止光标闪烁
set laststatus =2	"总是显示状态栏
set number		"显示行号
set ruler		"在编辑过程中右下角显示光标的行列信息
set nowrap		"当文字很长时取消换行
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R	"禁止显示滚动条
set guioptions-=m
set guioptions-=T	"禁止显示菜单和工具条
set showcmd		"在状态栏显示正在输入的命令
set history=1000	"历史记录条数
set nobackup
set noswapfile		"取消备份，禁止临时文件生成
set cursorline
set cursorcolumn		"突出显示当前行列
set hlsearch		"高亮显示搜索结果
set showmatch		"设置匹配模式
set autoindent
set cindent		"设置C/C++方式自动对齐
syntax enable
syntax on		"开启语法高亮功能
set t_Co=256		"指定配色方案为256
set ignorecase		"搜索时忽略大小写
set mouse=a		"Vim中可以使用鼠标
set expandtab	"将制表符扩展为空格
set tabstop=4		"tab宽度4
set shiftwidth=4	"自动对齐空格数
set softtabstop=4	"让vim把连续数量的空格视为一个制表符
set foldmethod=syntax   "基于语法进行代码折叠\manual手动建立、indent基于缩进建立,操作：za打开或关闭当前折叠，zM,关闭所有折叠，zR打开所有折叠
set nofoldenable    "启动vim时关闭折叠代码
set encoding=utf-8	"设置编码方式
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,eur-jb,euc-kr,latiin1		"自动判断编码时，依次尝试
set incsearch	"开启实时搜索功能
set nocompatible	"关闭兼容模式
set wildmenu	"vim自身命令行模式智能补全
set backspace=indent,eol,start  "allow backspace over everything in insert mode
"=========自定义快捷键
let mapleader=";"	"定义快捷键的前缀，即<leader>
"设置快捷键讲选中文本块复制到系统剪切板
vnoremap <leader>y "+y
"设置快捷键讲系统剪切板内容黏贴至vim
nmap <leader>p "+p
"=================youcompleteme配置
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>   "跳转到定义
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>    "跳转到声明
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR> "跳转到两者的合体
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nmap <F4> :YcmDiags<CR>     "显示警告和错误信息
"===================================
"filetype on
"filetype plugin on
autocmd BufWritePost $MYVIMRC source $MYVIMRC
