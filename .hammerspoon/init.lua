hs.hotkey.bind({"ctrl"}, "§", function()
    hs.execute("yabai -m window --toggle float", true)
end)

hs.hotkey.bind({"ctrl"}, "1", function()
  hs.application.launchOrFocus("iTerm")
end)

hs.hotkey.bind({"ctrl"}, "2", function()
  hs.application.launchOrFocus("Google Chrome")
end)
