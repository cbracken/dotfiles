-- Sourcekit SDK map.
local sdk_map = {
  iOS = {
    platform = '/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform',
    path = '/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk',
    target = 'arm64-apple-ios13.0'
  },
  macOS = {
    platform = '/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform',
    path = '/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk',
    target = 'arm64-apple-macosx10.15'
  }
}
-- Returns the sourcekit config for the specified SDK.
local function create_sourcekit_cfg(sdk)
  local sourcekit_lsp_config = {
    cmd = {
      'sourcekit-lsp',
      '-Xswiftc',
      '-sdk',
      '-Xswiftc',
      sdk.path,
      '-Xswiftc',
      '-target',
      '-Xswiftc',
      sdk.target,
      '-Xswiftc',
      '-I' .. sdk.platform .. '/Developer/usr/lib',
      '-Xswiftc',
      '-F' .. sdk.platform .. '/Developer/Library/Frameworks',
    },
    capabilities = {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    },
  }
  return sourcekit_lsp_config
end

-- UseIosSdk: configures sourcekit for iOS development.
vim.api.nvim_create_user_command('UseIosSdk', function()
  local cfg = create_sourcekit_cfg(sdk_map.iOS)
  require'lspconfig'.sourcekit.setup(cfg)
end, {})

-- UseMacosSdk: configures sourcekit for macOS development.
vim.api.nvim_create_user_command('UseMacosSdk', function()
  local cfg = create_sourcekit_cfg(sdk_map.macOS)
  require'lspconfig'.sourcekit.setup(cfg)
end, {})

return {
  {
    "https://gn.googlesource.com/gn",
    opts = {},
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/misc/vim")
    end
  },
  { "nathangrigg/vim-beancount" },
  {
    "neovim/nvim-lspconfig",
    opts = {},
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require('lspconfig')
      if vim.fn.executable('clangd') == 1 then
        lspconfig.clangd.setup({})
      end
      if vim.fn.executable('dart') == 1 then
        lspconfig.dartls.setup({})
      end
      if vim.fn.executable('lua-language-server') == 1 then
        lspconfig.lua_ls.setup({})
      end
      if vim.fn.executable('rust-analyzer') == 1 then
        lspconfig.rust_analyzer.setup({})
      end
      if vim.fn.executable('sourcekit-lsp') == 1 then
        local cfg = create_sourcekit_cfg(sdk_map.iOS)
        lspconfig.sourcekit.setup(cfg)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true }
          opts.desc = "See available code actions"
          vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)
          opts.desc = "Smart rename"
          vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
          opts.desc = "Show documentation for what is under cursor"
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        end,
      })
    end,
  },
  { "rhysd/vim-clang-format" },
  { "rust-lang/rust.vim" },
}
