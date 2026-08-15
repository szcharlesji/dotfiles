require("config.remote_clipboard").setup()
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = true
vim.opt.smartcase = true

-- Filetype associations
vim.filetype.add({
  extension = {
    env = "sh",
  },
  filename = {
    [".env"] = "sh",
    ["Brewfile"] = "sh",
  },
  pattern = {
    ["%.env%.[%w_.-]+"] = "sh",
  },
})

-- Set root directory to cwd
vim.g.root_spec = { "cwd" }

if vim.g.neovide then
  vim.o.guifont = "TX-02:h15"

  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_padding_top = 8
  vim.g.neovide_padding_bottom = 8
  vim.g.neovide_padding_left = 8
  vim.g.neovide_padding_right = 8

  -- vim.g.neovide_window_blurred = true -- macOS only
  -- vim.g.neovide_floating_blur_amount_x = 2.0
  -- vim.g.neovide_floating_blur_amount_y = 2.0
  -- vim.g.neovide_opacity = 0.05

  vim.g.neovide_cursor_animation_length = 0.03
  vim.g.neovide_cursor_trail_size = 0.3
  vim.g.neovide_cursor_vfx_mode = "pixiedust" -- try "railgun" or "pixiedust" if you like fireworks

  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_refresh_rate = 120 -- match your display

  -- macOS: make Cmd work as a real modifier
  vim.g.neovide_input_macos_option_key_is_meta = "only_left"
  vim.g.neovide_input_use_logo = true
end
