
Methos.Entity = {}
function Methos.Entity.Create(object,arg)
  --COMP REV START
  if Methos.Directories.Entity[object] == nil then error("OBJECT SCRIPT \""..object.."\" DOES NOT EXIST IN ENTITIES FOLDER") end
  --COMP REV END
  if Methos.cache.data.entity[object] == nil then Methos.cache.data.entity[object] = require (Methos.Directories.Entity[object]) end
  local data = {}
  setmetatable(data, { __index = Methos.cache.data.entity[object]})
  data.DSTR = false
  data.PTNT = false
  function data:destroy()
    self.DSTR = true
  end
  function data:persistant(bool)
    if bool ~= nil then self.PTNT = bool else self.PTNT = not self.PTNT end
  end
  data:load(arg)
  table.insert(Methos.cache.data.entity_create,data)
end