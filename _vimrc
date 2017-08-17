set autochdir
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
language messages zh_CN.UTF-8
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936 
set encoding=utf-8
set fencs=utf-8,gb18030,gbk,gb2312,cp936,ucs-bom,euc-jp,
behave mswin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"命令行模式下输入wm打开Tlist和WM
set showcmd
set noic
let OmniCpp_DefaultNamespace= ["std"]
let OmniCpp_GlobalScopeSearch = 1  " 0 or 1
let OmniCpp_NamespaceSearch = 2   " 0 ,  1 or 2
let OmniCpp_DisplayMode = 1
let OmniCpp_ShowScopeInAbbr = 0
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '"' . $VIMRUNTIME . '\diff"'
      let eq = '""'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
 silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"一般设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F4> :e .<CR>
map <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"gvim的字体设定
set guifont=Consolas:h13
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"不要使用vi的键盘模式，而是vim自己的
set nocompatible
"history文件中需要记录的行数
set history=100
"在处理未保存或只读文件的时候，弹出确认
set confirm
"与windows共享剪贴板
set clipboard+=unnamed
"侦测文件类型
filetype on
"载入文件类型插件
filetype plugin on
"为特定文件类型载入相关缩进文件
filetype indent on
"保存全局变量
set viminfo+=!
set viminfo='1000,f1,<100
"带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
"语法高亮
set nu!
syntax enable
syntax on
"color zenburn
"color desertEx
"colorscheme desert
"colo peachpuff 
colorscheme murphy
"高亮字符，让其不受100列限制
"":highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
"":match OverLength '\%101v.*'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"文件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"不要备份文件（根据自己需要取舍）
set nobackup
"不要生成swap文件，当buffer被丢弃的时候隐藏它
setlocal noswapfile
set bufhidden=hide
"字符间插入的像素行数目
set linespace=0
"增强模式中的命令行自动完成操作
set wildmenu
"在状态行上显示光标所在位置的行号和列号
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
"命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2
"使回格键（backspace）正常处理indent, eol, start等
set backspace=2
"可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
"通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
"在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"搜索和匹配
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"高亮显示匹配的括号
set showmatch
"匹配括号高亮的时（单位是十分之一秒）
set matchtime=5
"在搜索的时候忽略大小写
set ignorecase
"不要高亮被搜索的句子（phrases）
set nohlsearch
"在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch
"光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
"不要闪烁
set novisualbell
"我的状态行显示的内容（包括文件类型和解码）
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\[POS=%l,%v][ASCII=/%03.3b][HEX=/%02.2B][%p%%]\%{strftime(\"%Y-%m-%d\ \%H:%M\")}\ %{''.(&fenc!=''?&fenc:&enc).''}\ %{(&bomb?\",BOM\":\"\")}
"总是显示状态行
set laststatus=2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"文本格式和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"自动格式化
set formatoptions=tcrqn
"继承前一行的缩进方式，特别适用于多行注释
set autoindent
"为C程序提供自动缩进
set smartindent
"使用C样式的缩进
set cindent
"制表符为4统一缩进为4
set tabstop=4
set softtabstop=4
set shiftwidth=4
"用空格代替制表符
set expandtab
"不要换行
set nowrap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"CTags的设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置Taglist
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"这项必须设定，否则出错,配置taglist的ctags路径
let Tlist_Ctags_Cmd = 'C:\ctags\ctags.exe'
"不同时显示多个文件的 tag ，只显示当前文件的
let Tlist_Show_One_File=1
"如果 taglist 窗口是最后一个窗口，则退出 vim
let Tlist_Exit_OnlyWindow=1
"让当前不被编辑的文件的方法列表自动折叠起来 
let Tlist_File_Fold_Auto_Close=1
"把taglist窗口放在屏幕的右侧，缺省在左侧 
let Tlist_Use_Right_Window=1 
"显示taglist菜单
let Tlist_Show_Menu=1
"启动vim自动打开taglist
"let Tlist_Auto_Open=1
"""""""""""""""""""""""""""""""
"" winManager setting
"""""""""""""""""""""""""""""""
"设置界面分割
"let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"
""let g:winManagerWindowLayout = "TagList|NERDTreeToggle"
"设置winmanager的宽度，默认为25
let g:winManagerWidth = 30
"定义打开关闭winmanager按键
nmap wm :WMToggle<cr>
"
"按照名称排序
let Tlist_Sort_Type = "name"
"压缩方式
let Tlist_Compart_Format = 1
"如果只有一个buffer，kill窗口也kill掉buffer
let Tlist_Exist_OnlyWindow = 1
"不要关闭其他文件的tags
let Tlist_File_Fold_Auto_Close = 0
"不要显示折叠树
let Tlist_Enable_Fold_Column = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"只在下列文件类型被侦测到的时候显示行号，普通文本文件不显示
if has("autocmd")
    autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby set number
    autocmd FileType xml,html vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o-->
    autocmd FileType java,c,cpp,cs vmap <C-o> <ESC>'<o/*<ESC>'>o*/
    autocmd FileType html,text,php,vim,c,java,xml,bash,shell,perl,python setlocal textwidth=100
    autocmd Filetype html,xml,xsl source $VIMRUNTIME/plugin/closetag.vim
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \ exe " normal g`\"" |
      \ endif
endif "has("autocmd")
"F5编译和运行C程序，F6编译和运行C++程序
"请注意，下述代码在windows下使用会报错
"需要去掉./这两个字符
"去空行  
nnoremap <F2> :g/^\s*$/d<CR> 
"C的编译和运行
map <F5> :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java %<"
    elseif &filetype == 'python'
        exec "!python %"
    endif
endfunc
map <F6> :call CompileOnly()<CR>
func! CompileOnly()
    exec "w"
    if &filetype == 'c'
        exec "AsyncRun gcc % -o %<"
    elseif &filetype == 'cpp'
        exec "AsyncRun g++ % -o %<"
    elseif &filetype == 'python'
        exec "AsyncRun python %" 
    endif 
endfunc
map <F7> :call RunAsync()<CR>
func! RunAsync()
    exec "w"
    if &filetype == 'c'
        exec "AsyncRun gcc % -o %<"
    elseif &filetype == 'cpp'
        exec "AsyncRun g++ % -o %<"
    elseif &filetype == 'python'
        exec "!start python %"
    endif 
endfunc
"高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile * setfiletype txt
"映射<F11>的作用
map <F11> :call CallTags() <CR>
func! CallTags()
	exec "w"
	"exec "! ctags -R --c++-kinds=+p --fields=+iaS --extra=+q"
	exec "! ctags -R %"
	exec "set tags+=tags"
endfun
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.c,*.sh,*.cpp,*.java,*.py exec ":call SetTitle()" 
"新建文件后，自动定位到文件末尾 
autocmd BufNewFile * normal G
"设置Java代码的自动补全
au FileType java setlocal omnifunc=javacomplete#Complete
"定义函数SetTitle，自动插入文件头 
func SetTitle()
""call setline(1, "//********************************************************************") 
""call append(0, "// Time: ".strftime("%c")) 
""call append(0, "// Description: ") 
""call append(0, "// File Name: ".expand("%")) 
if &filetype == 'cpp' 
call append(1, "#include <iostream>") 
call append(2, "using namespace std;") 
call append(3, "int main(void)") 
call append(4, "{ ") 
call append(5, "    return 0;")
call append(6, "}")
call append(5, " ")
call append(3, " ")
call append(2, " ")
elseif &filetype == 'c' 
call append(1, "#include <stdio.h>") 
call append(2, " ") 
call append(3, "int main()") 
call append(4, "{") 
call append(5, "    return 0;")
call append(6, "}") 
call append(5, " ") 
elseif &filetype == 'java' 
call append(1, "public class ".expand("%<").expand("{")) 
call append(2, "  public static void main(String[] args)") 
call append(3, "  {") 
call append(4, "       System.out.println();")
call append(5, "  }") 
call append(6, "}") 
call append(4, " ") 
call append(2, " ") 
elseif &filetype == 'python' 
call append(0,"# -*- coding: utf-8 -*-")
call append(1,"#!/usr/local/bin/python")
call append(2, "#Time: ".strftime("%c")) 
call append(3, "#Description: ") 
call append(4, "#File Name: ".expand("%")) 
call append(5," ")
endif 
endfunc
"用空格键来开关折叠
set foldenable
set foldmethod=manual
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>
"minibufexpl插件的一般设置
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
"Tree explorer的设置
let g:treeExplVertical=1
let g:treeExplWinSize=30
"自动补全功能
set completeopt=longest,menu 
set tags+=tags
set tags+=C:\ctags\tags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:inoremap <S-ENTER> <c-r>=SkipPair()<CR>
:inoremap <S-SPACE> <ESC>la
:inoremap <C-ENTER> <ESC>A;<CR>
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { <c-r>=ClsoeBrace()<CR>
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap ;; <ESC>A;<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function ClosePair(char)
   if getline('.')[col('.') - 1] == a:char
      return "\<Right>"
   else
      return a:char
   endif
endf
function Semicolon()
   "echo getline('.')[col('.')]
   if getline('.')[col('.')] == ')'
      return "<ESC>A;"
   elseif getline('.')[col('.')] == '}'
      return "\<ESC>A;"
   elseif getline('.')[col('.')] == ']'
      return "\<ESC>A;"
   else
      return ";"
   endif
endf
function SkipPair()
   if getline('.')[col('.') - 1] == ')'
      return "\<ESC>o"
   else
      normal j
      let curline = line('.')
      let nxtline = curline
      while curline == nxtline
         if getline('.')[col('.') - 1] == '}'
            normal j
            let nxtline = nxtline + 1
            let curline = line('.')
            continue
         else
            return "\<ESC>i"
         endif
      endwhile
      return "\<ESC>o"
   endif
endf
function ClsoeBrace()
   if getline('.')[col('.') - 2] == '='
      return "{}\<ESC>i"
   elseif getline('.')[col('.') - 3] == '='
      return "{}\<ESC>i"
   elseif getline('.')[col('.') - 1] == '{'
      return "{}\<ESC>i"
   elseif getline('.')[col('.') - 2] == '{'
      return "{}\<ESC>i"
   elseif getline('.')[col('.') - 2] == ','
      return "{}\<ESC>i"
   elseif getline('.')[col('.') - 3] == ','
      return "{}\<ESC>i"
   else
      return "{\<ENTER>}\<ESC>O"
   endif
endf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guioptions-=m
set guioptions-=T
set guioptions-=L
"set guioptions-=r
set guioptions-=B
set guioptions-=e
set guioptions+=c
"map <silent> <F4> :if &guioptions =~# 'T' <Bar>
""winpos 450 235
set lines=33 columns=100
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"gvim打开以后最大化
au GUIEnter * simalt ~x
"when started as "evim",evim.vim will already have done these settings
if v:progname =~? "evim"
    finish
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smarttab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White
"允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
"""""""""""""""""""""""""python 补全"""""""""""""""""""""""""
let g:pydiction_location = 'C:\Program Files (x86)\Vim\vim80\tools\pydiction\complete-dict'
function! KeepLines(pattern)
    let pattern = a:pattern
    let hits = []
    exec '%s/' . pattern . '/\=add(hits, submatch(0))/ge'
    let str = join(hits, "\n") . "\n"
    %d
    put! = str
endfunction
command! -nargs=1 KeepLines call KeepLines(<f-args>)
"PYTHON语法检查"
if has("gui_running") 
     highlight SpellBad term=underline gui=undercurl guisp=Orange 
endif

au BufNewFile,BufRead *.py,*.pyw setf python
set ofu=syntaxcomplete#Complete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python runtime! autoload/pythoncomplete.vim
source $VIMRUNTIME/delmenu.vim 
source $VIMRUNTIME/menu.vim 
