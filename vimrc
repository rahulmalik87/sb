:syntax on
:set autoindent
:set smartindent
:set shiftwidth=2
:set tabstop=4
:set expandtab

function! Formatonsave()
  let l:formatdiff = 1
  py3file /opt/homebrew/opt/clang-format/share/clang/clang-format.py
  endfunction
autocmd BufWritePre *.h,*.cc,*.cpp,*.hpp call Formatonsave()
set nocompatible
filetype off

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
Plug 'zivyangll/git-blame.vim'
Plug 'tpope/fugitive.vim'
Plug 'ycm-core/YouCompleteMe'

call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
"  
"
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
