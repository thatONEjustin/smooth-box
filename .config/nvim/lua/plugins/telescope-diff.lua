return {
  "jemag/telescope-diff.nvim",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
  },
  init = function()
    require("telescope").load_extension("diff")
  end,
}
