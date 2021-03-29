-- treesitter
require "nvim-treesitter.configs".setup {
  highlight = {
    enable = true
  },
  playground = {
    enable = true
  },
  ensure_installed = {
    "typescript",
    "javascript",
    "tsx",
    "go",
    "elm",
    "lua"
  }
}
