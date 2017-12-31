--REQUIRE MODULES
local files = love.filesystem.getDirectoryItems("Project/MODULES")
for i, k in ipairs(files) do
  local name = k:sub(1,#k-4)
  local alt  = name:match("%b[]")
  local fin = ""
  print(name,alt)
  if alt ~= nil then
    alt = alt:sub(2,#alt-1)
    fin = alt
  else fin = name end
  _G[fin] = require ("Project/MODULES/"..name)
end

Methos = {}
--Methos.Load, Methos.Update, Methos.Draw
Methos.Load = function()
  Methos.Objects = {}
  local files = love.filesystem.getDirectoryItems("Project/ENTITIES")
  for i, k in ipairs(files) do
    local name = k:sub(1,#k-4)
    table.insert(Methos.Objects,require ("Project/ENTITIES/"..name))
    Methos.Objects[#Methos.Objects]:load()
  end
end

Methos.Update = function(dt)
  for i, k in ipairs(Methos.Objects) do
    Methos.Objects[i]:update(dt)
  end
end

Methos.Draw = function()
  for i, k in ipairs(Methos.Objects) do
    Methos.Objects[i]:draw()
  end
end

--Methos.Key
Methos.Key = table.Add(require("Project/keymaps"))
Methos.Key.bool = nil
Methos.Key.SetInput= function(bool)
  Methos.Key.bool = bool
end
Methos.Key.Input = function(arg)
  local bool = Methos.Key.bool
  local lam = Methos.Key[arg]
  local val = lam()
  if type(bool) == "boolean" then
    local bti = function(A) return A and 1 or 0 end
    local itb = function(A) if math.abs(A) > 0 then return true else return false end end
    if bool == true then
        if type(val) == "boolean" then return val else return itb(val) end
    else
        if type(val) == "number"  then return val else return bti(val) end
    end
  elseif bool == nil then
    return val
  end
end
Methos.keypressedtxt = {}
Methos.Key.pressed = function(txt)
  return Methos.keypressedtxt[txt] ~= nil
end

Methos.keyreleasedtxt = {}
Methos.Key.released = function(txt)
  return Methos.keyreleasedtxt[txt] ~= nil
end

--Methos.Pad
Methos.Pad = {}
Methos.Pad.JS = nil
Methos.Pad.IN = 0
Methos.Pad.setIndex = function(index)
  local joysticks = love.joystick.getJoysticks()
  Methos.Pad.JS = joysticks[index]
  Methos.Pad.IN = index
end
Methos.Pad.Axis = function(axis)
  return Methos.Pad.JS:getGamepadAxis( axis )
end

require "Project/settings"
