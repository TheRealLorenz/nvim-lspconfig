local util = require 'lspconfig.util'

---@brief
---
---https://intelephense.com/
--
-- `intelephense` can be installed via `npm`:
-- ```sh
-- npm install -g intelephense
-- ```
--
-- ```lua
-- -- See https://github.com/bmewburn/intelephense-docs/blob/master/installation.md#initialisation-options
-- init_options = {
--   storagePath = …, -- Optional absolute path to storage dir. Defaults to os.tmpdir().
--   globalStoragePath = …, -- Optional absolute path to a global storage dir. Defaults to os.homedir().
--   licenceKey = …, -- Optional licence key or absolute path to a text file containing the licence key.
--   clearCache = …, -- Optional flag to clear server state. State can also be cleared by deleting {storagePath}/intelephense
-- }
-- -- See https://github.com/bmewburn/intelephense-docs
-- settings = {
--   intelephense = {
--     files = {
--       maxSize = 1000000;
--     };
--   };
-- }
-- ```
return {
  cmd = { 'intelephense', '--stdio' },
  filetypes = { 'php' },
  root_dir = function(bufnr, done_callback)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local cwd = vim.loop.cwd()
    local root = util.root_pattern('composer.json', '.git')(fname)

    -- prefer cwd if root is a descendant
    done_callback(util.path.is_descendant(cwd, root) and cwd or root)
  end,
}
