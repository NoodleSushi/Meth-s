--INITIATE CACHE DATA
Methos.cache = {}
function Methos.cache:reset()
  Methos.cache.data = {
    entity = {},
    entity_create = {}
  }
end
Methos.cache.custom = {}
--INITIATE DIRECTORIES
Methos.Directories = {
  Entity = {},
  Room = {}
}
--INITIATE OBJECTS


--ENTITIES
local files = love.filesystem.getDirectoryItems("Project/ENTITIES")
for i, k in ipairs(files) do
  local name = k:sub(1,#k-4)
  Methos.Directories.Entity[name] = "Project/ENTITIES/"..name
end

--ROOMS
local files = love.filesystem.getDirectoryItems("Project/ROOMS")
for i, k in ipairs(files) do
  local name = k:sub(1,#k-4)
  Methos.Directories.Room[name] = "Project/ROOMS/"..name
end

Methos.room = {}
Methos.room.name = __set.room
Methos.room.data = require (Methos.Directories.Room[__set.room])

--Methos.Load, Methos.Update, Methos.Draw
function Methos.Load()
  --RESET CACHE AND OBJECTS DATA
  Methos.cache:reset()

  Methos.Update = function(dt)
    Methos.Key.pressedtxt = {}
    Methos.Key.releasedtxt = {}
    Methos.Pad.pressed = false
    Methos.Pad.released = {}
  end
  Methos.Draw = function() end
  if Methos.room.data.load ~= nil then
    Methos.room.data:load()
  end
  if Methos.room.data.draw ~= nil then
    Methos.Draw=function()
      Methos.room.data:draw()
    end
  end
  if Methos.room.data.update ~= nil then
    Methos.Update=function(dt)
      Methos.room.data:update(dt)
      Methos.Key.pressedtxt = {}
      Methos.Key.releasedtxt = {}
      Methos.Pad.pressed = false
      Methos.Pad.released = {}
    end
  end
end
