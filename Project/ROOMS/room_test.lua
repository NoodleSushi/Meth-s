local room = {
  {"entity_test"}
}
function room:load()
  Methos.System.entities_load()
end

function room:draw()
  Methos.System.entities_draw()
end

function room:update(dt,room)
  Methos.System.entities_create()
  Methos.System.entities_update(dt,room)
end
return room
