return {
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = "LazyFile",
  opts = {
    sign_priority = 16, -- sign priority
    keywords = {
      FIXED = {
        icon = "󰄯 ", -- icon used for the sign, and in search results
        color = "#50FA7B", -- can be a hex color, or a named color (see below)
        -- signs = false, -- configure signs for some keywords individually
      },
      TODO = { icon = "󰄰 ", color = "test" },
      HACK = { icon = " ", color = "#BD93F9" },
      WARN = { icon = " ", color = "#F1FA8C", alt = { "WARNING", "XXX" } },
      NOTE = { icon = " ", color = "default" },
      TEST = { icon = "󰇉 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    colors = {
      test = { "TestIdentifier", "#FF79C6" },

      -- FIX: text
      -- -- BUG: ALT
      -- FIXED: completed
      -- TODO: text
      -- HACK: text
      -- WARN: text
      -- -- XXX: this alt works
      -- NOTE: text identifier should assign "hint"
      -- -- INFO: this alt works
    },
  },
  -- stylua: ignore
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
    { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
    { "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
    { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
  },
}
