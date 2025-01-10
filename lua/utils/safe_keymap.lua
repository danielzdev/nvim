local M = {}

M.safe_keymap = function(keymap, cmd, desc, mode, opts)
  mode = mode or "n"
  opts = opts or {}

  opts.desc = desc or "No description provided"

  if type(keymap) ~= "string" then
    vim.notify("Invalid keymap: must be a string", vim.log.levels.ERROR)
    return
  end

  local valid_modes = { "n", "x", "s", "v", "i", "o", "t", "c" }
  for _, m in ipairs(valid_modes) do
    if keymap == m then
      vim.notify("Invalid keymap: '" .. keymap .. "' matches a mode. Did you mix up arguments?", vim.log.levels.ERROR)
      return
    end
  end

  if type(cmd) ~= "string" and type(cmd) ~= "function" then
    vim.notify("Invalid command: must be a string or function", vim.log.levels.ERROR)
    return
  end

  if type(mode) ~= "string" and type(mode) ~= "table" then
    vim.notify("Invalid mode: must be a string or table", vim.log.levels.ERROR)
    return
  end

  local success, err = pcall(function()
    vim.keymap.set(mode, keymap, cmd, opts)
  end)

  if not success then
    vim.notify("Failed to set keymap for '" .. keymap .. "': " .. err, vim.log.levels.ERROR)
  end
end

return M
