vim.o.hidden = true --- Required to keep multiple buffers open multiple buffers
vim.o.encoding = 'utf-8' --- The encoding displayed
vim.o.fileencoding = 'utf-8' --- The encoding written to file
vim.o.cmdheight = 2 --- Give more space for displaying messages
vim.o.splitright = true --- Vertical splits will automatically be to the right
vim.o.clipboard = 'unnamed,unnamedplus' --- Copy-paste between vim and everything else
vim.o.mouse = 'a' --- Enable mouse
vim.o.smartcase = true --- Uses case in search
vim.o.smarttab = true --- Makes tabbing smarter will realize you have 2 vs 4
vim.bo.smartindent = true --- Makes indenting smart
vim.o.showtabline = 2 --- Always show tabs
vim.o.showmode = false --- Don't show things like -- INSERT -- anymore
vim.o.autoindent = true --- Good auto indent
vim.o.errorbells = false --- Disables sound effect for errors
vim.wo.number = true --- Shows current line number
vim.wo.relativenumber = true --- Enables relative number
vim.wo.cursorline = true --- Highlight of current line
vim.wo.wrap = false --- Display long lines as just one line
vim.o.undodir = os.getenv('HOME') .. '/.config/nvim/undodir' --- Dir for undos
vim.o.undofile = true --- Sets undo to file
vim.o.incsearch = true --- Start searching before pressing enter
vim.o.backspace = 'indent,eol,start' --- Making sure backspace works
vim.o.scrolloff = 16 --- Always keep space when scrolling to bottom/top edge
vim.o.viminfo = "'1000" --- Increase the size of file history
vim.o.signcolumn = 'yes' --- Add extra sign column next to line number
vim.o.completeopt = 'menu,menuone,noselect' --- Better autocompletion
vim.g.mapleader = ' ' --- Map leader key
vim.o.shortmess = vim.o.shortmess .. 'c' --- Don't pass messages to |ins-completion-menu|

vim.cmd([[
	colorscheme tokyonight
]])
