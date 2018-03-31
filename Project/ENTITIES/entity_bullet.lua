local entity = {}

function entity:load(arg)
  self.dir = arg.angle
end

function entity:update(dt)

end

function entity:draw()
  love.graphics.setColor(255,255,255)
  love.graphics.circle("fill",self.pos.X,self.pos.Y,50)
  love.graphics.setColor(0,0,0)
  love.graphics.line(self.pos.X, self.pos.Y, self.pos.X+math.cos(self.dird)*80, self.pos.Y+math.sin(self.dird)*80)
end

return entity