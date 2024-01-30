local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values

local command_values = {
	{ value = "GitGutter" },
	{ value = "GitGutterNextHunk" },
	{ value = "TSTextobjectGotoNextStart @function.outer" },
	{ value = "cclose" },
	{ value = "lua Search_all_files()" },
	{ value = "lua Search_git_files()" },
}

local function commands_picker()
	local commands = {}
	for _, v in ipairs(command_values) do
		local cmd = v.value
		local display = cmd
		local ordinal = cmd
		table.insert(commands, { value = cmd, display = display, ordinal = ordinal })
	end

	pickers.new({}, {
		prompt_title = "Custom Commands",
		finder = finders.new_table({
			results = commands,
			entry_maker = function(entry)
				return {
					value = entry.value,
					display = entry.display,
					ordinal = entry.ordinal,
					execute_command = function()
						vim.cmd(entry.value)
					end,
				}
			end,
		}),
		sorter = conf.generic_sorter({}),
		attach_mappings = function(prompt_bufnr, map)
			map('i', '<CR>', function()
				local selection = require('telescope.actions.state').get_selected_entry()
				require('telescope.actions').close(prompt_bufnr)
				selection.execute_command()
			end)
			map('n', '<CR>', function()
				local selection = require('telescope.actions.state').get_selected_entry()
				require('telescope.actions').close(prompt_bufnr)
				selection.execute_command()
			end)
			return true
		end,
	}):find()
end

vim.keymap.set('n', '<leader><leader>', function()
	commands_picker()
end, { noremap = true, silent = true })
