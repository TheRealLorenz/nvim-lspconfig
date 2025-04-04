local util = require 'lspconfig.util'

local cache_dir = vim.loop.os_homedir() .. '/.cache/gitlab-ci-ls/'

---@brief
---
---https://github.com/alesbrelih/gitlab-ci-ls
--
-- Language Server for Gitlab CI
--
-- `gitlab-ci-ls` can be installed via cargo:
-- cargo install gitlab-ci-ls
return {
  cmd = { 'gitlab-ci-ls' },
  filetypes = { 'yaml.gitlab' },
  root_dir = function(bufnr, done_callback)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    done_callback(util.root_pattern('.gitlab*', '.git')(fname))
  end,
  init_options = {
    cache_path = cache_dir,
    log_path = cache_dir .. '/log/gitlab-ci-ls.log',
  },
}
