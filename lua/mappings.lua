require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
vim.filetype.add({ extension = { templ = "templ" } })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>fg", "<cmd>Telescope git_files<CR>", { desc = "telescope find git files"})
map("n", "<leader>pv", "<cmd>NvimTreeFocus<CR>", { desc = "focus files"})

-- yank to system clipboard
map({"n", "v"}, "<leader>y", [["+y]], { desc = "yank to system clipboard" })
map({"n", "v"}, "<leader>Y", [["+Y]], { desc = "yank to system clipboard" })

-- vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
map("n", "<leader>gs", "<cmd>Git<CR>", { desc = "git status" })

-- undotree
map("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "undotree" })
