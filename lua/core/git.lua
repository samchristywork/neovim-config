local first_git_open=true
vim.api.nvim_create_autocmd({"BufRead"}, {
  pattern = {"*COMMIT_EDITMSG"},
  callback = function()
    if first_git_open then
      first_git_open=false
      vim.cmd('set spell')
      vim.cmd('vsplit')
      vim.cmd('set nospell')
      local win = vim.api.nvim_get_current_win()
      local buf = vim.api.nvim_create_buf(true, true)
      vim.api.nvim_win_set_buf(win, buf)
      vim.cmd(':set syntax=diff')

      local file = io.popen('git diff --cached 2> /dev/null')
      local output = file:read('*all')
      local rc = {file:close()}
      local lines={}
      for t in string.gmatch(output, "([^\n]*)\n?") do
        table.insert(lines, t)
      end

      vim.api.nvim_buf_set_lines(buf, 0, -1, true, lines)
    end
  end})
