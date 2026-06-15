-- init.lua
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.bo.softtabstop = 4

-- line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- textwrap at 80 cols
vim.opt.colorcolumn = '80'
-- vim.opt.tw = 80

function _G.toggleC()
  local value = vim.api.nvim_get_option_value("colorcolumn", {})
  if value == "" then
     vim.api.nvim_set_option_value("colorcolumn", "80", {})
  else
     vim.api.nvim_set_option_value("colorcolumn", "", {})
  end
end

-- leader remaps
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('v', '<Space>', '<NOP>', { noremap = true })
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>k', ':lua toggleC()<CR>', {noremap = true})

-- other remaps
vim.api.nvim_set_keymap('n', '&', ':let @/ = "" <Bar> <CR>', { noremap = true })
-- nnoremap & :let @/ = "" <Bar> <CR>

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins", {
  ui = {
    icons = {
      cmd = "",
      config = "",
      event = "",
      ft = "",
      init = "",
      keys = "",
      plugin = "",
      runtime = "",
      require = "",
      source = "",
      start = "",
      task = "",
      lazy = "",
    },
  },
})


-- remaps
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('v', '<Return>', '<Esc>', { noremap = true })


vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest,list:full" -- don't insert, show options

-- colorscheme
require('bamboo').load()

-- lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- commenting
require('Comment').setup()

-- LSP servers
local cmp_nvim_lsp = require "cmp_nvim_lsp"
require'lspconfig'.clangd.setup {
  on_attach = on_attach,
  capabilities = cmp_nvim_lsp.default_capabilities(),
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}
require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").pyright.setup{}

-- format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
