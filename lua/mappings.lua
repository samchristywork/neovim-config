local function dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then k = '"' .. k .. '"' end
      s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

local function write_mappings(mode, filename)
  local keymap = vim.api.nvim_get_keymap(mode);

  local file = io.open(filename, "wb")
  local raw = io.open(filename .. ".raw", "wb")

  if file then
    for _, line in pairs(keymap) do
      file:write(dump(line.lhs) .. "^^^" .. dump(line.desc) .. "^^^" .. dump(line.callback) ..
        "^^^" .. dump(line.rhs) .. "\n")
    end
    file:close()
  end

  if raw then
    for _, line in pairs(keymap) do
      raw:write(dump(line), "\n")
    end
    raw:close()
  end
end

write_mappings("n", "/home/sam/.config/nvim/mappings/normal")
write_mappings("v", "/home/sam/.config/nvim/mappings/visual")
write_mappings("i", "/home/sam/.config/nvim/mappings/insert")
