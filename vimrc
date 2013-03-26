set nocompatible
behave mswin

if has('gui_running')
	if has('menu')
		let g:did_install_default_menus = 1
		set guioptions-=m
		set guioptions-=M
	endif

	if has('toolbar')
		set guioptions-=T
		set guioptions-=t
	endif

	" right-hand scrollbar
	set guioptions-=r
	set guioptions-=R

	" left-hand scrollbar
	set guioptions-=l
	set guioptions-=L
	" bottom scrollbar
	set guioptions-=b
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" let $VIMFILES var
"""""""""""""""""""""""""""""""""""""""""""""""""
let $VIMFILES = $VIM.'/vimfiles'
if has('unix')
	let $VIMFILES = '~/.vim'
	if !has('gui_running') && executable('wmctrl')
		function! ToggleFullscreen()
			call system("wmctrl -ir " . v:windowid . " -btoggle,fullscreen")
		endfunction
		map <silent> <F11> :call ToggleFullscreen()<CR>
	endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""
" init vim-pathogen plugin
"""""""""""""""""""""""""""""""""""""""""""""""""
let $VIMBALL = $VIMFILES.'/bundle'
source $VIMBALL/vim-pathogen/autoload/pathogen.vim

call pathogen#infect()




"""""""""""""""""""""""""""""""""""""""""""""""""
" remap leader
"""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let g:mapleader = ","


nmap <Leader>s :w<CR>
map <C-S> :w<CR>

"�ر��ļ�,����ļ��޸Ĺ��򲻹ر�
nmap <Leader>w :bd<CR>
"ǿ�ƹر��ļ�
nmap <Leader>W :bd!<CR>
"�˳� Vim
nmap <Leader>q :qall<CR>
"ǿ���˳�Vim,�����κθĶ�
nmap <Leader>Q :qall!<CR>

map <Leader>e :tabnew $MYVIMRC<CR>

"Show highlighting groups for current word
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line("."), col(".")), 'synIDattr(v:val, "name")')
endfunction

"�������е�ǰ�ļ�
map <leader>V :silent !%<CR>
"����ɾ������
map <leader>D dd


nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

nmap Q <Nop>
vmap Q <Nop>
map! <F1> <Nop>
map <A-w> :set wrap!<CR>

nnoremap ; :

nnoremap <leader>v V`]

inoremap jj <ESC>

" Only do this part when compiled with support for autocommands
if has("autocmd")
" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal g'\"" |
\ endif
endif

map <c-o> :browse tabnew<CR>
map <Leader>hi :noh<CR>
map <Leader>u :e ++enc=utf-8<CR>
map <Leader>su :set fileencoding=utf-8<CR>

"���±�ǩ�д򿪵�ǰ������ڵ��ļ�
nmap <silent> <Leader>tn :tabnew <cword><CR>

nnoremap <Leader>1 :set filetype=html<CR>
nnoremap <Leader>2 :set filetype=css<CR>
nnoremap <Leader>3 :set filetype=php<CR>
nnoremap <Leader>4 :set filetype=javascript<CR>
nnoremap <Leader>5 :set filetype=xhtml<CR>



"���ҵ�ǰѡ��ѡ�е�����,����
:vnoremap <silent> <Leader>f y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
"���ҵ�ǰѡ��ѡ�е�����,����
:vnoremap <silent> <Leader>F y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>




"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

nmap <leader>rr :syntax sync fromstart<CR>


" {{{ Fast Tab Switch
	nmap <c-j> :bnext<CR>
	nmap <c-k> :bprev<CR>
" }}}

" {{{ Fast Tab Switch
	map <C-Tab> :tabnext<CR>
	map <C-S-Tab> :tabprev<CR>
" }}}

cmap <c-a> <Home>
cmap <c-e> <End>
cmap <c-f> <Right>
cmap <c-b> <Left>

" CTRL-C are Copy
vnoremap <C-C> "+y
" CTRL-V and SHIFT-Insert are Paste
imap <C-V> <C-O>"+gP
nmap <Leader>P "+gP
imap <S-Insert> "+gP
cmap <C-V> <C-R>+
cmap <S-Insert> <C-R>+


":vimgrep /��������/gj d:/mydocs/*/*.txt
"���Ҫ�������ļ��У�����

":vimgrep /��������/gj d:/mydocs/**/*.txt
"��quickfix���ڲ鿴ƥ����
":cw
"������ģʽ���ƶ����,�������������
"����
"inoremap <C-a> <C-O>:SmartHomeKey<CR>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-h> <left>
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk
inoremap <C-l> <Right>

function! MakeTmpFile(ext)
	let s:fname = $TEMP.'/vim_tmp_'.abs(reltimestr(reltime())).'.'.a:ext
	exec ':tabnew '.s:fname
endfunction

map <Leader>n :call MakeTmpFile('html')<CR>
map <Leader>njs :call MakeTmpFile('js')<CR>
map <Leader>ncss :call MakeTmpFile('css')<CR>



" ���ù����ɫ
hi Cursor guifg=bg guibg=Green gui=NONE
" ���ò���״̬�¹����ɫ
hi CursorIM guifg=bg guibg=Blue gui=NONE


if !exists('g:VimrcLoaded')
	"����֧�ֵ���ɫ��
	set t_Co=256
	winpos 135 100
	set lines=38
	set columns=124

	color monokai
	if has('gui_running') && has('libcall')
		let g:MyVimLib = $VIMRUNTIME.'/gvimfullscreen.dll'
		function ToggleFullScreen()
			call libcallnr(g:MyVimLib, "ToggleFullScreen", 0)
		endfunction
		map <A-Enter> <Esc>:call ToggleFullScreen()<CR>
		"map <A-Enter> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

		let g:VimAlpha = 240
		function! SetAlpha(alpha)
			let g:VimAlpha = g:VimAlpha + a:alpha
			if g:VimAlpha < 180
				let g:VimAlpha = 180
			endif
			if g:VimAlpha > 255
				let g:VimAlpha = 255
			endif
			call libcall(g:MyVimLib, 'SetAlpha', g:VimAlpha)
		endfunction
		nmap <s-y> <Esc>:call SetAlpha(3)<CR>
		nmap <s-t> <Esc>:call SetAlpha(-3)<CR>

		let g:VimTopMost = 0
		function! SwitchVimTopMostMode()
			if g:VimTopMost == 0
				let g:VimTopMost = 1
			else
				let g:VimTopMost = 0
			endif
			call libcall(g:MyVimLib, 'EnableTopMost', g:VimTopMost)
		endfunction
		nmap <s-r> <Esc>:call SwitchVimTopMostMode()<CR>
	endif

	"����� set encoding=utf-8 ���� ToggleFullScreen ǰ��
	"��ᵼ��ȫ���л���ݼ�ʧЧ
	set encoding=utf-8
	set fileencodings=utf-8,ucs-bom,default,chinese,big5,gbk,gb2312,cp936
	"set guifont=Courier_New_for_Powerline:h12:cANSI
	set guifont=Microsoft_YaHei_Mono_for_Powerl:h10:cGB2312
	"set guifontwide=YaHei\ Consolas\ Hybrid:h11

	set fileformat=unix
	set fileformats=dos,unix,mac
	set bsdir=buffer
	set history=256
	set ambiwidth=double
	set linespace=0
	set display=lastline
	set autoread
	set cursorline
	set hidden
	set browsedir=buffer
	set autochdir
	"��ʾ����
	set showcmd
	"����˫�ֽ�
	set ambiwidth=double

	"���¿�������
	set scrolloff=6
	"�Զ������ļ�
	set autowrite
	set nowritebackup
	set nobackup
	set noswapfile
	"����ʾ����
	"set shortmess=atI
	set ignorecase
	set incsearch
	"��������ʱ�����������Ľ��
	set hlsearch
	"��������βʱ����������
	"set nowrapscan
	set smartcase
	"��ʾ����������
	set showmatch
	"������
	set nowrap
	"��ʾ�к�
	set number
	set autoindent
	set smartindent
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	set expandtab
	set smarttab
	"retab  ��tabת��Ϊ�ո�
	"ִ���ⲿ����ʱ��ֹ�ָ���Ļ����
	set norestorescreen

	"How many tenths of a second to blink
	set mat=2
	"����C/C++�����Զ�����
	set cin
	"�����Զ�������ʽ
	set cino=:1g1t1(sus
	"��ֹ���
	"set selectmode=key
	"�ر�����֧��(�����Ҫ��������ֵΪa)
	set mouse=a
	" Make the command-line completion better
	set wildmenu

	"��ʾ����к� (�������ֻ����һ����Ч)
	"set relativenumber
	set helplang=cn,en

	set shellquote=
	set shellslash
	set shellxquote=
	set shellpipe=2>&1\|tee
	set shellredir=>%s\ 2>&1

	"���ҹ���20���ַ���λ��
	set sidescroll=20

	set nolazyredraw
	set textwidth=99999

	"set colorcolumn=85

	"��ʾ�հ׼�Tab
	set list
	set listchars=tab:\|\ ,extends:>,precedes:<

	"����ɾ��ʱ�ɻ��˵��ַ�, ����, ������, ����
	set backspace=indent,eol,start whichwrap+=<,>,[,],h,l
	" ����������ʷ���� persistent undo
	set undofile
	set undodir=$VIMFILES/undo/
	set undolevels=1000 "maximum number of changes that can be undone

	"set nobomb
	"��Windows���������
	"set clipboard+=unnamed

	"���ô����۵���ʽΪ �ֹ�  indent
	"set foldmethod=manual
	set foldmethod=indent
	"���ô�����۵�����ʾ������
	"set foldexpr=1
	set foldlevel=3

	"�رմ�������
	set noerrorbells
	set novisualbell
	set t_vb=
	set tm=500

	" alway show status bar
	set laststatus=2
	"set statusline=\ %<%F[%1*%M%*%n%R%H]%6b\[0x%B\]\ %{strftime(\"%m-%d\ %H:%M\")}%=\ %y\ %0(%{&fileformat}\ [%{(&fenc\ ==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %6l:%3c/%L%)

	set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize

	"���������еĸ߶�Ϊ1
	set cmdheight=1
	"�رձ�ǩ��
	set showtabline=0

	"ִ��cmd�������������tab��
	"tabe +r\!cmd
endif


""""""""""""""""""""""""""""""""""""""""""""
" Fast edit hosts file
""""""""""""""""""""""""""""""""""""""""""""
function! FlushDNS()
	python import sys
	exe 'python sys.argv = ["ipconfig /flushdns"]'
	exe 'pyf '.g:svn_cmd_path
endfunction
:nmap <silent> <Leader>host :tabnew c:\windows\system32\drivers\etc\hosts<CR>
:nmap <silent> <Leader>dns :!ipconfig /flushdns<CR>
autocmd! bufwritepost hosts call FlushDNS()


"<c-w>+	 <c-w>5+	 ���ӵ�ǰbuffer�ĸ߶�
"<c-w>-	 <c-w>5-	 ���ٵ�ǰbuffer�ĸ߶�

"""""""""""""""""""""""""""""""""""""""
" Plugins Config Start
"""""""""""""""""""""""""""""""""""""""

" {{{ MRU
	let MRU_Add_Menu = 0
	let MRU_Max_Entries = 500
	let MRU_Window_Height = 20
	nmap <Leader>f :MRU<CR>
" }}}

" {{{ NERD_commenter
"   Turns the menu off
	let NERDMenuMode = 0
" }}}

" {{{ bookmarking.vim colorscheme
	hi BookMarkHighLight guifg=#7F9845 guibg=#232526
	"sign define bookmark text=-> texthl=BookMarkHighLight linehl=BookMarkHighLight
	let g:bookmarking_menu = 0
	map <silent> <F9> :ToggleBookmark<CR>
	map <silent> <F4> :NextBookmark<CR>
	map <silent> <S-F4> :PreviousBookmark<CR>
" }}}


" {{{ calendar.vim plugin
  nmap <Leader>sc :Colorizer<CR>
" }}}

" {{{ powerline.vim plugin
	let g:Powerline_symbols = 'fancy'
	let g:Powerline_colorscheme = 'solarized256'
	nmap <Leader>r :PowerlineReloadColorscheme<CR>
	autocmd BufWinEnter * call Pl#UpdateStatusline(1)
" }}}

" {{{ smarthome plugin
	map <Home> :SmartHomeKey<CR>
	imap <Home> <C-O>:SmartHomeKey<CR>
" }}}

" {{{ spacebox.vim plugin
	nmap <leader>sm :SpaceBox<CR>
" }}}

" {{{ surround ʹ��˵��
	"	Normal mode
	"	-----------
	"		ds  - delete a surrounding
	"		cs  - change a surrounding
	"		ys  - add a surrounding
	"		yS  - add a surrounding and place the surrounded text on a new line + indent it
	"		yss - add a surrounding to the whole line
	"		ySs - add a surrounding to the whole line, place it on a new line + indent it
	"		ySS - same as ySs

	"	Visual mode
	"	-----------
	"		s   - in visual mode, add a surrounding
	"		S   - in visual mode, add a surrounding but place text on new line + indent it

	"	Insert mode
	"	-----------
	"		<CTRL-s> - in insert mode, add a surrounding
	"		<CTRL-s><CTRL-s> - in insert mode, add a new line + surrounding + indent
	"		<CTRL-g>s - same as <CTRL-s>
	"		<CTRL-g>S - same as <CTRL-s><CTRL-s>
" }}}

" {{{ vimExplorer.vim plugin
	map <Leader>E :VE %:p:h<CR>
" }}}


" {{{ vim-bad-withespace plugin
	"�л� ������ʾ/���� ��β�ո�
	nmap <Leader>sh :ToggleBadWhitespace<CR>
	"�Ƴ� ��β�ո���β
	nmap <Leader>rh :EraseBadWhitespace <CR>
" }}}

" {{{ winmove.vim plugin
	let g:wm_move_left  = '<a-h>'
	let g:wm_move_down  = '<a-j>'
	let g:wm_move_up	= '<a-k>'
	let g:wm_move_right = '<a-l>'
" }}}


"""""""""""""""""""""""""""""""""""""""
" Plugins Config End
"""""""""""""""""""""""""""""""""""""""


"nmap <leader>ed :!start "D:/Program Files/EditPlus 3/editplus.exe" -e %:p<CR>

" Alt-Space is System menu
"if has("gui")
  "noremap <M-Space> :simalt ~<CR>
  "inoremap <M-Space> <C-O>:simalt ~<CR>
  "cnoremap <M-Space> <C-C>:simalt ~<CR>
"endif



"�۵���صĿ�ݼ�
"zR Unfold all folded lines in file.
"za Open/Close (toggle) a folded group of lines.
"aA Open a Closed fold or close and open fold recursively.
"zi ȫ�� չ��/�ر� �۵�
"zo չ����ǰ���������
"zc close a folded group of lines
"zC close all fold ed lines recursively
"zM �ر����п��۵�����
"map <F3> zo "���۵�
"map <F4> zc "�ر��۵�
"map <F5> zR "�������۵�
"map <F6> zM "�ر������۵�
"���õ��۵���ݼ���

"�������indent��markerΪ���������ɣ���Ϊ�������õıȽ϶ࣺ

"���ʹ����indent��ʽ��vim���Զ��ĶԴ����ŵ��м䲿�ֽ����۵������ǿ���ֱ��ʹ����Щ�ֳɵ��۵��ɹ���
"�ڿ��۵������������м䣩��

"zc	  �۵�
"zC	 �����ڷ�Χ������Ƕ�׵��۵�������۵�
"zo	  չ���۵�
"zO	 �����ڷ�Χ������Ƕ�׵��۵���չ��
"[z	   ����ǰ�򿪵��۵��Ŀ�ʼ����
"]z	   ����ǰ�򿪵��۵���ĩβ����
"zj	   �����ƶ���������һ���۵��Ŀ�ʼ�����رյ��۵�Ҳ�����롣
"zk	  �����ƶ���ǰһ�۵��Ľ��������رյ��۵�Ҳ�����롣

"��ʹ��marker��ʽʱ����Ҫ�ñ������ʶ������۵���ϵͳĬ����{{{��}}}(ǰ��������˵��)
"���ǿ���ʹ�������������������ɾ���۵���

"zf �����۵���������marker��ʽ�£�
"zf56G�������ӵ�ǰ����56�еĴ����۵���
"10zf��10zf+��zf10���������ӵ�ǰ���𵽺�10�еĴ����۵���
"10zf-��zf10���������ӵ�ǰ����֮ǰ10�еĴ����۵���
"�����Ŵ�zf%�������ӵ�ǰ���𵽶�Ӧ��ƥ���������ȥ��������{}��[]��<>�ȣ���
"zd ɾ�� (delete) �ڹ���µ��۵������� 'foldmethod' ��Ϊ "manual" �� "marker" ʱ��Ч��
"zD ѭ��ɾ�� (Delete) ����µ��۵�����Ƕ��ɾ���۵���
		 "���� 'foldmethod' ��Ϊ "manual" �� "marker" ʱ��Ч��
"zE ��ȥ (Eliminate) ��������С����۵���
		 "���� 'foldmethod' ��Ϊ "manual" �� "marker" ʱ��Ч��"


"����ʱ�Զ����
"au GUIENTER * simalt~x
au BufReadPost *.exe %!xxd

""""""""""""""""""""""""""""""""""
syntax on
filetype plugin indent on
let g:VimrcLoaded = 1

" vim: tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
