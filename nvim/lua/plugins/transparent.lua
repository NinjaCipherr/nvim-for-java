
-- lua/plugins/transparent.lua
return {
  {
    'tribela/transparent.nvim',
    event = 'VimEnter',
    config = function()
      require('transparent').setup({
        enable = true, -- Bật tính năng trong suốt
        extra_groups = { -- Các nhóm thêm mà bạn muốn làm trong suốt
          "Normal",
          "NormalNC",
          "Comment",
          -- Thêm các nhóm khác nếu cần
        },
      })
    end,
  }
}
