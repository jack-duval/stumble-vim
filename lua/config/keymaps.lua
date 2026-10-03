vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

local map = vim.keymap.set

local function open_explorer(cmd)
    local dir = vim.fn.expand("%:p:h")
    if dir == "" or dir == "." then
        dir = vim.fn.getcwd()
    end
    vim.cmd(cmd .. " " .. vim.fn.fnameescape(dir))
end

map("n", "nt", function() open_explorer("tabnew") end, { desc = "New Tab in current dir" })
map("n", "nv", function() open_explorer("vsplit") end, { desc = "New Vertical Split in current dir" })
map("n", "nh", function() open_explorer("split") end, { desc = "New Horizontal Split in current dir" })

map("n", "gh", "<C-w>h", { desc = "Move to left split" })
map("n", "gj", "<C-w>j", { desc = "Move to lower split" })
map("n", "gk", "<C-w>k", { desc = "Move to upper split" })
map("n", "gl", "<C-w>l", { desc = "Move to right split" })


map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })

