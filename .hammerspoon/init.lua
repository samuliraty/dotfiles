hs.hotkey.bind({"cmd"}, "§", function()
    hs.execute("yabai -m window --toggle float", true)
end)

hs.hotkey.bind({"cmd"}, "1", function()
  hs.application.launchOrFocus("iTerm")
end)

hs.hotkey.bind({"cmd"}, "2", function()
  hs.application.launchOrFocus("Firefox")
end)

hs.hotkey.bind({"cmd"}, "4", function()
  hs.application.launchOrFocus("Obsidian")
end)
