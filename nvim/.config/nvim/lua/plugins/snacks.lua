-- Built-in but i need to configure hidden/ignored files
return {
  "folke/snacks.nvim",
  opts = {
    scroll = {
      enabled = false, -- Disable scrolling animations
    },
    picker = {
      sources = {
        files = { hidden = false, ignored = false },
        grep = { hidden = false, ignored = false },
        explorer = {
          hidden = true,
          ignored = true,
          follow_file = true,
        },
      },
    },
  },
}
