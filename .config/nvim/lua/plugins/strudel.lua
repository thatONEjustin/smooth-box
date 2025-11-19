return {
  {
    "gruvw/strudel.nvim",
    build = "npm install",
    config = function()
      require("strudel").setup({
        -- headless = true,
        update_on_save = true,
        -- browser_exec_path = "/usr/bin/zen-browser",
      })
    end,
  },
}
