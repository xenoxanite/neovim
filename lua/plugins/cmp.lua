return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",     -- source for text in buffer
    "hrsh7th/cmp-path",       -- source for file system paths
    "L3MON4D3/LuaSnip",       -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "onsails/lspkind.nvim",   -- vs-code like pictograms
  },
  config = function()
    local luasnip = require("luasnip")
    local options = {
      history = true,
      updateevents = "TextChanged,TextChangedI",
    }

    luasnip.config.set_config(options)
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.luasnippets_path or "" })

    vim.api.nvim_create_autocmd("InsertLeave", {
      callback = function()
        if
            require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
            and not require("luasnip").session.jump_active
        then
          require("luasnip").unlink_current()
        end
      end,
    })

    local cmp = require("cmp")

    local symbol_map = {
      Text = "󰉿 ",
      Method = "󰆧 ",
      Function = "󰡱 ",
      Constructor = " ",
      Field = "󰜢 ",
      Variable = " ",
      Class = "󰠱",
      Interface = " ",
      Module = " ",
      Property = "󰜢 ",
      Unit = "󰑭",
      Value = "󰎠 ",
      Enum = " ",
      Keyword = "󰌋 ",
      Snippet = " ",
      Color = "󰏘",
      File = "󰈙",
      Reference = "󰈇 ",
      Folder = "󰉋 ",
      EnumMember = " ",
      Constant = "󰭍 ",
      Struct = "󰙅 ",
      Event = " ",
      Operator = "󰆕 ",
    }
    local options = {
      completion = {
        completeopt = "menu,menuone",
      },
      preselect = cmp.PreselectMode.Item,
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        documentation = {
          winhighlight = "Normal:CmpDoc",
        },
        completion = {
          winhighlight = "Normal:Pmenu",
          scrollbar = false,
        },
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(_, item)
          local a = string.rep(" ", 10)
          item.abbr = item.abbr .. a
          item.menu = " " .. item.kind .. " "
          item.kind = " " .. symbol_map[item.kind] .. " "
          return item
        end,
      },

      mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(
              vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
              ""
            )
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      },
      sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
      },
    }

    cmp.setup(options)
  end,
}
