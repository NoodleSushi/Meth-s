local room =  {entities = {},
  --{"entity_player",{x = love.graphics.getWidth()/2,y = love.graphics.getHeight()/2,original= true}}
}

function room:load()
  Methos.Save_Plain({1,2,3,"STRING",{"tiger"}},"test file")
  table.print(Methos.Load_Plain("test file"))
  self.HC = HC.new(1000)
  self.colliders = {}
  self.room = LevelLoader.new("test")
  self.entities = self.room:dump_entities()
  table.insert(self.entities,{"entity_VirusNormal",{x = love.graphics.getWidth()/2,y = love.graphics.getHeight()/2}})
  for i, k in ipairs(self.room:dump_colliders()) do
    table.insert(self.colliders,self.HC:polygon(unpack(k)))
    print(#k)
    print("unpacks")
  end
  for i, k in ipairs(self.room.Objects) do
    table.insert(self.colliders,self.HC:polygon(unpack(k.line)))
    print(#k)
    print("unpacks")
  end
  --love.system.openURL( "http://127.0.0.1:8000" )
  self.cam=Gamera.new(0,0,self.room.Width,self.room.Height)
  self.cam:setScale(0.8)
  love.graphics.setBackgroundColor(self.room.Color.OUT)
  Methos.System.entities_load(room)
end

function room:draw()
  self.cam:draw(function(l,t,w,h)
    self.room:draw()
    Methos.System.entities_draw(Methos.room.data)
    --love.graphics.setLineWidth(10)
    --love.graphics.setColor(0, 0,0)
    --for i, k in ipairs(self.room:dump_colliders()) do
        --love.graphics.line(unpack(k))
    --end
  end)
end

function room:update(dt,room)
  Methos.System.entities_create()
  Methos.System.entities_update(dt,self)
  lovebird.update()
end
return room
