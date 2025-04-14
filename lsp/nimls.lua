---@brief
---
-- https://github.com/PMunch/nimlsp
--
-- `nimlsp` can be installed via the `nimble` package manager:
--
-- ```sh
-- nimble install nimlsp
-- ```
return {
  cmd = { 'nimlsp' },
  filetypes = { 'nim' },
  root_markers = function(name, _)
    local patterns = { '*.nimble', '.git' }
    for _, pattern in ipairs(patterns) do
      if vim.glob.to_lpeg(pattern):match(name) ~= nil then
        return true
      end
    end
    return false
  end,
}
