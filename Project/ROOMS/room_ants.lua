local room = {
  entities = {}
}
local GLOBALSCALE = 10
function room:load()
  color = {bg ={0,0,0},hole={30,30,30},affect={0,255,0}}
  love.window.setFullscreen( true )
  love.graphics.setBackgroundColor(color.bg)
  self.cell = {}
  self.cellx = math.floor(love.graphics.getWidth()/(GLOBALSCALE))
  self.celly = math.floor(love.graphics.getHeight()/(GLOBALSCALE))
  for x = 1, self.cellx do
    self.cell[x] = {}
    for y = 1, self.celly do
      self.cell[x][y] = {switch = 1, virgin = true}
    end
  end
  self.ants = {}
  for i = 1, 1 do
    table.insert(self.ants,{x = math.floor(love.math.random(1,self.cellx)),y = math.floor(love.math.random(1,self.celly)),dir = table.Random(-2,-1,0,1,2)*(math.pi/2),color = {love.math.random(255),love.math.random(255),love.math.random(255),100},trail = {}})
  end
  self.step = math.floor(love.math.random(100,500))
  self.trail = {}
end

function room:update(dt)
  --SET POSITION
  for i, k in ipairs(self.ants) do
    k.trail = {}
  end
  for i = 1, 10 do
    for i, k in ipairs(self.ants) do
      if k.x<1 then k.x=self.cellx elseif k.x>self.cellx then k.x = 1 end
      if k.y<1 then k.y=self.celly elseif k.y>self.celly then k.y = 1 end
      self.cell[k.x][k.y].virgin = false
      local base = self.cell[k.x][k.y].switch
      k.dir = k.dir+base*math.pi/2
      self.cell[k.x][k.y].switch = base*-1
      k.x = math.round(k.x + math.cos(k.dir))
      k.y = math.round(k.y + math.sin(k.dir))
      --print(i,k.x,k.y)
      table.insert(k.trail,{x = k.x,y = k.y})
    end
  end
  --self.step = self.step - 1
  --if self.step < 1 then
    --table.insert(self.ants,{x = self.ants[#self.ants].x+table.Random(-1,1),y = self.ants[#self.ants].y+table.Random(-1,1),dir = table.Random(-2,-1,0,1,2)*(math.pi/2),color = {love.math.random(255),love.math.random(255),love.math.random(255)}})
    --self.step = math.floor(love.math.random(100,1000))
  --end
end

function room:draw()
  love.graphics.push()
  love.graphics.scale(GLOBALSCALE,GLOBALSCALE)
  for x, k in ipairs(self.cell) do
    for y, k in ipairs(k) do
      if k.switch == -1 then
        love.graphics.setColor(color.hole)
        love.graphics.rectangle("fill", x-1, y-1, 1, 1)
      elseif k.virgin == false then
        love.graphics.setColor(color.affect)
        love.graphics.rectangle("fill", x-1, y-1, 1, 1)
      end
    end
  end
  for i, k in ipairs(self.ants) do
    love.graphics.setColor(k.color)
    for b, a in ipairs(k.trail) do
      love.graphics.rectangle("fill", a.x-1, a.y-1, 1, 1)
    end
  end
  love.graphics.pop()
  --for i, k in ipairs(self.ants) do
    --love.graphics.setColor(k.color)
    --love.graphics.rectangle("fill", -5-(self.cellx*5/2)+(love.graphics.getWidth()/2)+k.x*5, -5-(self.celly*5/2)+(love.graphics.getHeight()/2)+k.y*5, 5, 5)
    --love.graphics.circle("fill",-5-(self.cellx*5/2)+(love.graphics.getWidth()/2)+k.x*5,-5-(self.celly*5/2)+(love.graphics.getHeight()/2)+k.y*5,5)
  --end
  love.graphics.setColor(0, 0,0)
  love.graphics.rectangle("line", -(self.cellx*5/2)+(love.graphics.getWidth()/2), -(self.celly*5/2)+(love.graphics.getHeight()/2), self.cellx*5, self.celly*5)
end
return room
