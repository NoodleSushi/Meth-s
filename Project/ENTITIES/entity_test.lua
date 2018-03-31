local entity = {}

function entity:load()
  self.pos = Vec2.new(love.graphics.getWidth()/2,love.graphics.getHeight()/2)
  self.dir = 0
  self.dird = 0
  Methos.Input.Set(false)
  Methos.Pad.setIndex(1)
end

function entity:update(dt)
  local Xup = math.maxabs(Methos.Pad.Axis("leftx"),Methos.Input.Return("right")-Methos.Input.Return("left"))
  local Yup = math.maxabs(Methos.Pad.Axis("lefty"),Methos.Input.Return("down")-Methos.Input.Return("up"))
  self.pos = self.pos+Vec2.new(Xup,Yup)*dt*500
  if math.abs(Xup) > 0 or math.abs(Yup) > 0 then
    self.dir = Vec2.new(0,0):toAngle(Vec2.new(Xup,Yup))
  end
  self.dird = math.Anglelerp(self.dird,self.dir,1-0.0000001^dt)
end

function entity:draw()
  love.graphics.setColor(255,255,255)
  love.graphics.circle("fill",self.pos.X,self.pos.Y,50)
  love.graphics.setColor(0,0,0)
  love.graphics.line(self.pos.X, self.pos.Y, self.pos.X+math.cos(self.dird)*80, self.pos.Y+math.sin(self.dird)*80)
end

return entity
