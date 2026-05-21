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
  vim.lsp.config.sourcekit = cfg
  vim.lsp.enable('sourcekit')
end, {})

-- UseMacosSdk: configures sourcekit for macOS development.
vim.api.nvim_create_user_command('UseMacosSdk', function()
  local cfg = create_sourcekit_cfg(sdk_map.macOS)
  vim.lsp.config.sourcekit = cfg
  vim.lsp.enable('sourcekit')
end, {})

return {
  {
    "https://gn.googlesource.com/gn",
    opts = {},
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/misc/vim")
    end
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      if vim.fn.executable('clangd') == 1 then
        vim.lsp.enable('clangd')
      end
      if vim.fn.executable('lua-language-server') == 1 then
        vim.lsp.enable('lua_ls')
      end
      if vim.fn.executable('zls') == 1 then
        vim.lsp.enable('zls')
      end
      if vim.fn.executable('rust-analyzer') == 1 then
        vim.lsp.enable('rust_analyzer')
      end
      if vim.fn.executable('beancount-language-server') == 1 then
        vim.lsp.enable('beancount')
      end
      if vim.fn.executable('sourcekit-lsp') == 1 then
        local cfg = create_sourcekit_cfg(sdk_map.iOS)
        vim.lsp.config.sourcekit = cfg
        vim.lsp.enable('sourcekit')
      end
      if vim.fn.executable('basedpyright-langserver') == 1 then
        vim.lsp.enable('basedpyright')
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true }

          -- Enable auto-completion if supported/enabled by the client.
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client and client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, {
              autotrigger = false,
            })
          end

          opts.desc = "See available code actions"
          vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)
          opts.desc = "Smart rename"
          vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
          opts.desc = "Show documentation for what is under cursor"
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          opts.desc = "Format buffer"
          vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, opts)
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        desc = "Automatically start Tree-sitter highlighting if a parser is available",
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match)
          if not lang then return end
      
          local parser = vim.treesitter.get_parser(args.buf, lang)
          if not parser then return end
      
          vim.treesitter.start(args.buf, lang)
        end,
      })
    end,
    config = function()
      require("nvim-treesitter").install({
        -- Bash, C, C++, Markdown, Lua, Markdown, Python supported by default.
        "rust",
        "swift",
        "zig",
      })
    end,
  },
}

