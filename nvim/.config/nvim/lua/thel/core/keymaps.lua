vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- fire telescope
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- let cursor stay in place after paste
keymap.set("n", "J", "mzJ`z")

-- let cursor stay in the middle when jumping half-pages
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- let cursor stay in the middle when searching
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- jk to normal mode
keymap.set("i", "jk", "<ESC>")

-- move blocks of code
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- save
keymap.set("n", "<c-s>", ":w<CR>") -- normal mode
keymap.set("i", "<c-s>", "<ESC>:w<CR>l") -- insert mode
keymap.set("v", "<c-s>", "<ESC>:w<CR>") -- normal mode

-- greatest remap ever
-- foo bar
keymap.set("x", "<leader>p", "\"_dP")

-- yank into buffer
keymap.set({"n", "v"}, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])
keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- delete to void register
keymap.set("n", "<leader>d", "\"_d")
keymap.set("v", "<leader>d", "\"_d")

-- nope
keymap.set("n", "Q", "<nop>")

-- switch projects
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
keymap.set("n", "<leader>f", vim.lsp.buf.format)

keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- split window
keymap.set("n", "<leader>sv", "<C-w>v") -- split window verically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- tab
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

--keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
--keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

--keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")
--keymap.set("n", "<leader>gs", vim.cmd.Git)
