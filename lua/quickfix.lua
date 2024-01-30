vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    vim.cmd('cclose')
  end,
})

-- Function to populate the quickfix list with lines not starting with whitespace
local function populate_quickfix_non_whitespace()
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  local qf_items = {}

  for i, line in ipairs(lines) do
    if not line:match("^%s") and line ~= "" and line ~= "}" then
      table.insert(qf_items, {
        bufnr = bufnr,
        lnum = i,
        text = line
      })
    end
  end

  vim.fn.setqflist(qf_items)
end

-- Call the function to populate the quickfix list
vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    populate_quickfix_non_whitespace()
  end,
})
