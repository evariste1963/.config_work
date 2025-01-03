local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

--making lazy code available to pluggins - rtp = run time path
vim.opt.rtp:prepend(lazypath)
-- equivelant to
-- vim.opt.rtp.prepend(vim.opt.rtp, lazypath)

require("lazy").setup({
  { import = "thisme.plugins" },
  { import = "thisme.plugins.lsp" },
}, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
