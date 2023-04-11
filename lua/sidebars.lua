vim.keymap.set('n', '<F1>', ':SidebarNvimToggle<cr>')
vim.keymap.set('n', '<F2>', ':TagbarToggle<cr>')
vim.keymap.set('n', '<F3>', ':NvimTreeToggle<cr>')
vim.g.tagbar_width = 40

local sidebar_git_status = {
    title = "Status",
    icon = "💿",
    setup = function(ctx)
    end,
    update = function(ctx)
    end,
    draw = function(ctx)
        local file = io.popen('git status -s --branch 2> /dev/null')
        local output = file:read('*all')
        local rc = {file:close()}
        local highlight={}

        local count = 0
        for t in string.gmatch(output, "([^\n]*)\n?") do
          table.insert(highlight, { "identifier", count, 0, -1 })
          table.insert(highlight, { "LineNr", count, 0, 2 })
          if string.gmatch(t, "##")() then
            table.insert(highlight, { "phpNull", count, 0, -1 })
          end
          count = count + 1
        end

        return {
          lines = output,
          hl = highlight
        }
    end
}

local sidebar_git_commits = {
    title = "Commits",
    icon = "💿",
    setup = function(ctx)
    end,
    update = function(ctx)
    end,
    draw = function(ctx)
        local file = io.popen('git log --oneline 2> /dev/null | head -n5')
        local output = file:read('*all')
        local rc = {file:close()}
        local highlight={}

        local count = 0
        for t in string.gmatch(output, "([^\n]*)\n?") do
          if string.gmatch(t, "Feature:")() then
            table.insert(highlight, { "string", count, 0, -1 })
          end
          if string.gmatch(t, "Minor change:")() then
            table.insert(highlight, { "rubyFunction", count, 0, -1 })
          end
          if string.gmatch(t, "Bug fix:")() then
            table.insert(highlight, { "phpNull", count, 0, -1 })
          end
          table.insert(highlight, { "LineNr", count, 0, 7 })
          count = count + 1
        end

        return {
          lines = output,
          hl = highlight
        }
    end
}

local sidebar_git_branches = {
    title = "Branches",
    icon = "💿",
    setup = function(ctx)
    end,
    update = function(ctx)
    end,
    draw = function(ctx)
        local file = io.popen('git branch --list 2> /dev/null')
        local output = file:read('*all')
        local rc = {file:close()}
        local highlight={}

        local count = 0
        for t in string.gmatch(output, "([^\n]*)\n?") do
          table.insert(highlight, { "rubyFunction", count, 0, -1 })
          table.insert(highlight, { "Todo", count, 0, 2 })
          if string.gmatch(t, "*")() then
            table.insert(highlight, { "string", count, 0, -1 })
          end
          count = count + 1
        end

        return {
          lines = output,
          hl = highlight
        }
    end
}

require("sidebar-nvim").setup({
    disable_default_keybindings = 0,
    bindings = { ["q"] = function() require("sidebar-nvim").close() end },
    open = false,
    side = "left",
    initial_width = 40,
    hide_statusline = false,
    update_interval = 10*1000,
    sections = { sidebar_git_status, sidebar_git_commits, sidebar_git_branches},
    -- section_separator = {"", "-----", ""},
    section_separator = {"", "", ""},
    section_title_separator = {""},
    containers = {
        attach_shell = "/bin/sh", show_all = true, interval = 5000,
    },
    datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
    todos = { ignored_paths = { "~" } },
})
