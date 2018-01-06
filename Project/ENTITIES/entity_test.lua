local entity = {}

function entity:load()
  self.pos = Vec2.new(love.graphics.getWidth()/2,love.graphics.getHeight()/2)
  self.dir = 0
  self.dird = 0
end

function entity:update(dt)
  Methos.Pad.setIndex(1)
  local Xup = Methos.Pad.Axis("leftx")
  local Yup = Methos.Pad.Axis("lefty")
  self.pos = self.pos+Vec2.new(Xup,Yup)*dt*500
  if math.abs(Xup) > 0 or math.abs(Yup) > 0 then
    self.dir = Vec2.new(0,0):toAngle(Vec2.new(Xup,Yup)*10)
  end
  self.dird = math.Anglelerp(self.dird,self.dir,0.1)
end

function entity:draw()
  love.graphics.setColor(255,255,255)
  love.graphics.circle("fill",self.pos.X,self.pos.Y,50)
  love.graphics.setColor(0,0,0)
  love.graphics.line(self.pos.X, self.pos.Y, self.pos.X+math.cos(self.dird)*80, self.pos.Y+math.sin(self.dird)*80)
end

return entity
