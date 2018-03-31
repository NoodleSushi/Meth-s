--REQUIRE MODULES
local files = love.filesystem.getDirectoryItems("Project/MODULES")
for i, k in ipairs(files) do
  local name = ""
  name = k
  if k:sub(#k-3,#k) == ".lua" then name = k:sub(1,#k-4) end
  local alt  = name:match("%b[]")
  local fin = ""
  print(name,alt)
  if alt ~= nil then
    alt = alt:sub(2,#alt-1)
    fin = alt
  else fin = name end
  _G[fin] = require ("Project/MODULES/"..name)
end

--INITIATE METHOS
Methos = {}
__set = {}
require "Project/settings"
Methos.settings(__set)
if __set.save_name ~= nil and #__set.save_name>0 then love.filesystem.setIdentity( __set.save_name ) end
--OPTIONAL METHOS MODULES
require "METHOS/KEY"
require "METHOS/PAD"
require "METHOS/INPUT"
require "METHOS/SAVE"
--COMPULSORY METHOS MODULES
require "METHOS/LUD"
require "METHOS/SYSTM"
require "METHOS/INSTNC"
__set = nil
