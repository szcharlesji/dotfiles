return {
  "mrjones2014/smart-splits.nvim",
  commit = "c4afaf23141651845e6e1966d936d79ff8939e4d", -- Before the revert
  lazy = false,
  keys = {
    {
      "<c-h>",
      function()
        require("smart-splits").move_cursor_left()
      end,
    },
    {
      "<c-j>",
      function()
        require("smart-splits").move_cursor_down()
      end,
    },
    {
      "<c-k>",
      function()
        require("smart-splits").move_cursor_up()
      end,
    },
    {
      "<c-l>",
      function()
        require("smart-splits").move_cursor_right()
      end,
    },
  },
  opts = {
    tmux_integration = true,
  },
}
