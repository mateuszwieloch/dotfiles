set guifont=Monaco:h14
set fuoptions=maxvert,maxhorz


nmap <D-/> gcc


" Find in File
macmenu Edit.Find.Find\.\.\. key=<nop>
imap <D-f> <esc>/
nmap <D-f> /
" Find in Files
imap <D-F> <esc>:CtrlSF<space>
nmap <D-F> :CtrlSF<space>
vmap <D-F> <Plug>CtrlSFVwordExec
" Find Identifier Under Cursor in Files
nnoremap <leader>f "zyiw:exe ":CtrlSF ".@z""<cr>
" Go Back/Forward
nmap <D-[> <C-o>
nmap <D-k> <C-o>
nmap <D-]> <C-i>
nmap <D-j> <C-i>
" Quick Open
macmenu File.Open\.\.\. key=<nop>
imap <D-o> <esc>:CtrlP<cr>
nmap <D-o> :CtrlP<cr>


" Split Vertically
imap <D-i> :vs<cr>
nmap <D-i> :vs<cr>


" Tabs
macmenu Tools.List\ Errors key=<nop>
nmap <D-l> :tabn<CR>
nmap <D-h> :tabp<CR>

map <D-d> :call jedi#goto()<cr>
map <leader>jd :call jedi#show_documentation()<cr>
map <leader>jr :call jedi#rename()<cr>
