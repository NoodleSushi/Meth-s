local entity = {}

function entity:load(room,arg)
  self.position = Vector2.new(arg.x,arg.y)
  self.view = Vector2.new(0,0)
  self.anim = math.random(1000)
  self.particles = {}
  for i = 1, 10 do
    table.insert(self.particles,{x = self.position.x+math.random(-10,10),y = self.position.y+math.random(-10,10), rot = math.random(math.pi*2)})
  end
end

function entity:update(dt,room)
  self.anim = self.anim + dt*4
  for i, k in ipairs(self.particles) do
    local max = 250
    k.x = math.lerp(k.x,self.position.x+math.random(-max,max),.01)
    k.y = math.lerp(k.y,self.position.y+math.random(-max,max),.01)
  end
end

function entity:draw(room)
  local l, t, w, h = room.cam:getWindow();
  local x, y = room.cam:toScreen(self.position.x,self.position.y);
  local rad = 25
  local xcheck = x+rad > 0 and x-rad < w
  local ycheck = y+rad > 0 and y-rad < h
  if xcheck and ycheck then
    self:drawstuff()
  end
end

function entity:drawstuff()
  love.graphics.push()
    love.graphics.translate(self.position.x, self.position.y)
    local function draw(rad)
      love.graphics.push()
      love.graphics.rotate(rad)
        love.graphics.setColor(43, 118, 239)
        love.graphics.circle("fill",0,0,25,3)
      love.graphics.pop()
    end
    local function lines(rad)
      love.graphics.push()
      love.graphics.rotate(rad)
      love.graphics.setColor(math.lerp(43,0,.75), math.lerp(118,0,.75), math.lerp(239,0,.75))
      love.graphics.setLineWidth(4)
      love.graphics.circle("line",0,0,25,3)
      love.graphics.pop()
    end
    lines(self.anim)
    lines(-self.anim+math.pi)
    draw(self.anim)
    draw(-self.anim+math.pi)
  love.graphics.pop()
  love.graphics.setColor(math.lerp(43,0,.75), math.lerp(118,0,.75), math.lerp(239,0,.75))
  for i, k in ipairs(self.particles) do
    love.graphics.push()
    love.graphics.translate(k.x,k.y)
    love.graphics.rotate(k.rot+love.timer.getTime())
    love.graphics.circle("fill",0,0,4,3)
    love.graphics.pop()
  end
end
return entity
