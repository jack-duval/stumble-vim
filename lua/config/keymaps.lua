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

-- Toggle KEYMAPS.md in a floating window
map("n", "<leader>?", function()
  local keymaps_path = vim.fn.stdpath("config") .. "/KEYMAPS.md"
  if vim.fn.filereadable(keymaps_path) == 0 then
    vim.notify("KEYMAPS.md not found in config directory", vim.log.levels.WARN)
    return
  end

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "single",
    title = " Neovim Keymaps Cheatsheet ",
    title_pos = "center",
  })

  vim.cmd("read " .. vim.fn.fnameescape(keymaps_path))
  vim.api.nvim_buf_set_lines(buf, 0, 1, false, {})

  vim.bo[buf].filetype = "markdown"
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].modifiable = false

  vim.wo[win].number = false
  vim.wo[win].relativenumber = false
  vim.wo[win].wrap = true

  local opts = { buffer = buf, silent = true }
  vim.keymap.set("n", "q", "<cmd>close<CR>", opts)
  vim.keymap.set("n", "<Esc>", "<cmd>close<CR>", opts)
end, { desc = "Toggle Keymaps Cheatsheet" })
