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

Methos.keypressedtxt = {}
Methos.keypressed = function(txt)
  return Methos.keypressedtxt[txt] ~= nil
end

Methos.keyreleasedtxt = {}
Methos.keyreleased = function(txt)
  return Methos.keyreleasedtxt[txt] ~= nil
end

Methos.key = table.Add(require("Project/keymaps"))
Methos.key.bool = true
Methos.SetInput= function(bool)
  Methos.key.bool = bool
end
Methos.Input = function(arg)
  local bool = Methos.key.bool
  local lam = Methos.key[arg]
  local val = lam()
  if type(bool) == "boolean" then
    local bti = function(A) return A and 1 or 0 end
    local itb = function(A) if A > 0 then return true else return false end end
    if bool == true then
        if type(val) == "boolean" then return val else return itb(val) end
    else
        if type(val) == "number"  then return val else return bti(val) end
    end
  elseif bool == nil then
    return val
  end
end

require "Project/settings"
