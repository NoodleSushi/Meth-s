
Methos.Entity = {}
function Methos.Entity.Create(object,arg)
  if Methos.cache.data.entity[object] == nil then Methos.cache.data.entity[object] = require (Methos.Directories.Entity[object]) end
  local data = {}
  setmetatable(data, { __index = Methos.cache.data.entity[object]})
  data:load(arg)
  table.insert(Methos.cache.data.entity_create,data)
end
