Methos.System = {}
function Methos.System.entities_draw()
  for i, k in ipairs(Methos.Entities) do
    if Methos.Entities[i].draw ~= nil then  Methos.Entities[i]:draw() end
  end
end

function Methos.System.entities_update(dt)
  for i, k in ipairs(Methos.Entities) do
    Methos.Entities[i]:update(dt)
  end
end

function Methos.System.entities_load()
  Methos.Entities = {}
  for i, k in ipairs(Methos.room.data) do
    if Methos.cache.data.entity[k[1]] == nil then Methos.cache.data.entity[k[1]] = require (Methos.Directories.Entity[k[1]]) end
    local data = {}
    setmetatable(data, { __index = Methos.cache.data.entity[k[1]]})
    data:load(k[2])
    table.insert(Methos.Entities,data)
  end
end

function Methos.System.entities_create()
  if Methos.cache.data.entity_create ~= {} then
    for i, k in ipairs(Methos.cache.data.entity_create) do
      table.insert(Methos.Entities,k)
    end
    Methos.cache.data.entity_create = {}
  end
end

function Methos.System.PolygonCount()
  
end