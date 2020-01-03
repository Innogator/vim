set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

nnoremap <leader>ev :vsp $MYVIMRC<CR>		" edit init.vim
nnoremap <leader>sv :source $MYVIMRC<CR>	" source init.vim

" if vim-plug isn't installed, download it to the autoload directory
if empty(glob('$LOCALAPPDATA\nvim\autoload\plug.vim'))
    silent ! powershell (md "$env:LOCALAPPDATA\nvim\autoload")
    silent ! powershell (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim', $env:LOCALAPPDATA + '\nvim\autoload\plug.vim')
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
  
call plug#begin('$LOCALAPPDATA\nvim\plugged')
	Plug 'tpope/vim-surround'   " quoting/parenthesizing made simple
	" Plug 'jceb/vim-orgmode'		" org mode for tasks management
call plug#end()