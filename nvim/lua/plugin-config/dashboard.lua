local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end

  db.setup({
    theme = 'hyper',
    config = {
      week_header = {
       enable = true,
      },
      packages = { enable = true },
      shortcut = {
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          icon = "  ",
          desc = "Edit keybindings",
          action = "edit ~/.config/nvim/lua/keybindings.lua",
          key = 'k',
          icon_hl = '@variable',
          group = 'Label',
        },
      },
    },
  })


