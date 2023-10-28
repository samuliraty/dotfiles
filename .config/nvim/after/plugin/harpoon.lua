local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local Path = require("plenary.path")

local NOTES_PATH = "~/repos/notes/"

local function check_or_create_file(path)
  if not Path:new(path):exists() then
    Path:new(path):touch({ parents = true })
  end
end

local function read_file(path)
  return Path:new(path):read()
end

local function prepend_date_entry(path, entry)
  local content = read_file(path)
  if not content:find(entry, 1, true) then
    Path:new(path):write(entry .. "\n\n" .. content, "w")
  end
end

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>d", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>j", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>k", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>l", function() ui.nav_file(3) end)

vim.keymap.set("n", "<leader>ö", function()
  local currentMonth = os.date("%Y%m")
  local fullFilePath = vim.fn.expand(NOTES_PATH .. currentMonth .. ".md")
  check_or_create_file(fullFilePath)

  local dayOfMonth = os.date("%d")
  local daysInMonth = os.date("%d", os.time({ year = os.date("%Y"), month = os.date("%m") + 1, day = 0 }))
  local weekday = os.date("%A")
  local entry = dayOfMonth .. "/" .. daysInMonth .. " " .. weekday

  prepend_date_entry(fullFilePath, entry)

  vim.cmd("e " .. fullFilePath)
end)
