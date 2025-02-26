return {
  {
    "zk-org/zk-nvim",
    config = function()
      require("zk").setup({
        -- See Setup section below
        picker = "telescope",
        auto_attach = {
          enabled = true,
          filetypes = { "markdown" },
        },
        notebooks = {
          ["default"] = "~/memo/",
        },
      })
    end,
  },
}
