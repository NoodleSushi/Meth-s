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

--INITIATE METHOS
Methos = {}
__set = {}
require "Project/settings"
Methos.settings(__set)

--OPTIONAL METHOS MODULES
require "METHOS/KEY"
require "METHOS/PAD"
require "METHOS/INPUT"

--COMPULSORY METHOS MODULES
require "METHOS/LUD"
require "METHOS/SYSTM"
require "METHOS/INSTNC"
