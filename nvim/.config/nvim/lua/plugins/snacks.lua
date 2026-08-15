-- Built-in but i need to configure hidden/ignored files
return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = "",
        -- stylua: ignore
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
    scroll = {
      enabled = false, -- Disable scrolling animations
    },
    picker = {
      sources = {
        files = { hidden = true, ignored = false },
        grep = { hidden = true, ignored = false },
        explorer = {
          hidden = true,
          ignored = true,
          follow_file = true,
        },
      },
    },
  },
}
