Methos.System = {}
function Methos.System.entities_draw(...)
  for i, k in ipairs(Methos.Entities) do
    if Methos.Entities[i].draw ~= nil then  Methos.Entities[i]:draw(...) end
  end
end

function Methos.System.entities_update(dt,room)
  local room = room or {}
  for i, k in ipairs(Methos.Entities) do
    Methos.Entities[i]:update(dt,room)
  end
end

function Methos.System.entities_load(room)
  Methos.Entities = {}
  for i, k in ipairs(Methos.room.data.entities) do
    if Methos.cache.data.entity[k[1]] == nil then Methos.cache.data.entity[k[1]] = require (Methos.Directories.Entity[k[1]]) end
    local data = {}
    setmetatable(data, { __index = Methos.cache.data.entity[k[1]]})
    data.DSTR = false
    data.PTNT = false
    function data:destroy()
      self.DSTR = true
    end
    function data:persistant(bool)
      if bool ~= nil then
        self.PTNT = bool
      else self.PTNT = not bool end
    end
    data:load(room,k[2])
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
