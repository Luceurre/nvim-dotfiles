vim.o.hidden = true --- Required to keep multiple buffers open multiple buffers
vim.o.encoding = 'utf-8' --- The encoding displayed
vim.o.fileencoding = 'utf-8' --- The encoding written to file
vim.o.cmdheight = 2 --- Give more space for displaying messages
vim.o.splitright = true --- Vertical splits will automatically be to the right
vim.o.updatetime = 100 --- Faster completion
vim.o.timeoutlen = 300 --- Faster completion
vim.o.clipboard = 'unnamed,unnamedplus' --- Copy-paste between vim and everything else
vim.o.mouse = 'a' --- Enable mouse
vim.o.smartcase = true --- Uses case in search
vim.o.smarttab = true --- Makes tabbing smarter will realize you have 2 vs 4
vim.bo.smartindent = true --- Makes indenting smart
vim.bo.shiftwidth = 2 --- Change a number of space characeters inseted for indentation
vim.o.shiftwidth = 2 --- Change a number of space characeters inseted for indentation
vim.o.showtabline = 2 --- Always show tabs
vim.o.tabstop = 2 --- Insert 2 spaces for a tab
vim.bo.tabstop = 2 --- Insert 2 spaces for a tab
vim.o.softtabstop = 2 --- Insert 2 spaces for a tab
vim.bo.softtabstop = 2 --- Insert 2 spaces for a tab
vim.o.showmode = false --- Don't show things like -- INSERT -- anymore
vim.o.autoindent = true --- Good auto indent
vim.o.errorbells = false --- Disables sound effect for errors
vim.wo.number = true --- Shows current line number
vim.wo.relativenumber = true --- Enables relative number
vim.wo.cursorline = false --- Highlight of current line
vim.wo.wrap = false --- Display long lines as just one line
vim.o.backup = false --- Recommended by coc
vim.o.writebackup = false --- Recommended by coc
vim.o.swapfile = false --- Recommended by coc
vim.o.emoji = false --- Fix emoji display
vim.o.undodir = os.getenv('HOME') .. '/.config/nvim/undodir' --- Dir for undos
vim.o.undofile = true --- Sets undo to file
vim.o.incsearch = true --- Start searching before pressing enter
vim.o.conceallevel = 0 --- Show `` in markdown files
vim.o.backspace = 'indent,eol,start' --- Making sure backspace works
vim.o.lazyredraw = true --- Makes macros faster & prevent errors in complicated mappings
vim.o.wildignore = '*node_modules/**' --- Don't search inside Node.js modules (works for gutentag)
vim.o.scrolloff = 8 --- Always keep space when scrolling to bottom/top edge
vim.o.viminfo = "'1000" --- Increase the size of file history
vim.o.termguicolors = false --- Correct terminal colors
vim.o.signcolumn = 'yes' --- Add extra sign column next to line number
vim.o.completeopt = 'menu,menuone,noselect' --- Better autocompletion
vim.o.foldtext = 'CustomFold()' --- Emit custom function for foldtext
vim.g.mapleader = ' ' --- Map leader key
vim.o.shortmess = vim.o.shortmess .. 'c' --- Don't pass messages to |ins-completion-menu|
vim.o.expandtab = true
vim.bo.expandtab = true

vim.cmd('set background=dark')
vim.cmd('colorscheme tokyonight')
vim.cmd([[
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
]])
vim.cmd('let g:palenight_terminal_italics=1')

vim.cmd([[
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
let g:asyncomplete_log_file = expand('~/asyncomplete.log')
]])

vim.cmd([[
filetype on
]])

vim.cmd([[
set exrc
]])

vim.cmd([[
  let g:python3_host_prog = '/home/pglandon/.pyenv/versions/py3nvim/bin/python'
]])

vim.cmd([[
let g:loaded_matchit = 1
]])
