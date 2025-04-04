local util = require 'lspconfig.util'

---@brief
---
---https://github.com/phpactor/phpactor
--
-- Installation: https://phpactor.readthedocs.io/en/master/usage/standalone.html#global-installation
return {
  cmd = { 'phpactor', 'language-server' },
  filetypes = { 'php' },
  root_dir = function(bufnr, done_callback)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local cwd = vim.loop.cwd()
    local root = util.root_pattern('composer.json', '.git', '.phpactor.json', '.phpactor.yml')(fname)

    -- prefer cwd if root is a descendant
    done_callback(util.path.is_descendant(cwd, root) and cwd or root)
  end,
}
