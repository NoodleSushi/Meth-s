local entity = {}

function entity:load(room,arg)
  self.position = Vector2.new(arg.x,arg.y)
  self.translate = Vector2.new(0,0)
  self.view = Vector2.new(0,0)
  self.radius = 50
  self.color = {139,211,237}
  self.anim = math.random(1000)
  self.orig = arg.original
  self.num = 4
  self.len = 0
  self.collider = room.HC:circle(self.position.x,self.position.y,self.radius)
end

function entity:update(dt,room)
  --local l, t, w, h = room.cam:getWindow();

  if Methos.Key.Pressed("p") then table.print(Methos) end
  Methos.Pad.setIndex(1)
  local Xup = Methos.Pad.Axis("leftx"); local Yup = Methos.Pad.Axis("lefty")
  self.translate = self.translate:lerp(Vector2.new(Xup,Yup),1-0.0000001^dt)
  self.position = self.position+self.translate*10*self.radius*dt
  self.view = self.view:lerp(Vector2.new(Methos.Pad.Axis("rightx")*100,Methos.Pad.Axis("righty")*100),1-0.025^dt)
  self.anim = self.anim+dt*5*(1+math.max(math.abs(Xup),math.abs(Yup))*2)
  --[[if Methos.Pad.Press("x") then
    Methos.Entity.Create("entity_player",{x = select("#",self.position.X-self.radius,0,self.position.X+self.radius),y = select("#",self.position.Y-self.radius,0,self.position.Y+self.radius),original = false})
  end]]
  if Methos.Pad.Press("leftshoulder") then self.num = self.num - 1 end
  if Methos.Pad.Press("rightshoulder") then self.num = self.num + 1 end
  self.len = self.len + (Methos.Pad.Axis("triggerright")-Methos.Pad.Axis("triggerleft"))
  --COLLIDER FUNCTION
  self.collider:moveTo(self.position.X, self.position.Y)
  i = love.timer.getTime()
  local collisions = room.HC:collisions(self.collider)
  for other, separating_vector in pairs(collisions) do
      self.collider:move(separating_vector.x, separating_vector.y)
      self.position = Vector2.new(self.collider._center.x,self.collider._center.y)
  end
  if self.orig == true then room.cam:setPosition(self.position.x+self.view.x, self.position.y+self.view.y) end;
  print(math.floor((love.timer.getTime()-i)*1000000))
end

function entity:draw(room)
  local l, t, w, h = room.cam:getWindow();
  local x, y = room.cam:toScreen(self.position.x,self.position.y);
  local rad = self.radius/2
  local xcheck = x+rad > 0 and x-rad < w
  local ycheck = y+rad > 0 and y-rad < h
  if xcheck and ycheck then
    self:drawstuff()
  end
end

function entity:drawstuff()
  local index = self.anim
  local draw = {}
  local rad = self.radius
  local amp = 2
  local num = 3
  local shortcut = 36
  for i = 0, shortcut do
    local O = (2*math.pi/shortcut)*i
    local x1 = (rad+amp*math.sin(num*O+index))*math.cos(O+self.len)
    local y1 = (rad+amp*math.cos(num*O-index))*math.sin(O+self.len)
    table.insert(draw,x1)
    table.insert(draw,y1)
  end
  --DRAW BODY
  love.graphics.setLineWidth( self.radius*(1/50) )
  love.graphics.push()
  love.graphics.translate(self.position.x, self.position.y)
  local border = 100
  love.graphics.setColor(self.color)
  love.graphics.polygon("fill", draw)
  love.graphics.setColor(math.lerp(self.color[1],0,0.5),math.lerp(self.color[2],0,0.5),math.lerp(self.color[3],0,0.5))
  love.graphics.polygon("line", draw)
  --DRAW EYE
  love.graphics.setColor(255,255,255)
  love.graphics.ellipse( "fill", 0, 0, rad*(8/10), rad*0.4 )
  --DRAW PUPIL
  love.graphics.stencil(function () love.graphics.ellipse( "fill", 0, 0, rad*(8/10), rad*0.4 ) end,"replace", 1, false)
  love.graphics.setStencilTest("greater", 0)
  love.graphics.setColor(0,0,0)
  local limitx = rad*(8/10) - rad*0.2
  local limity = rad*0.4 - rad*0.2
  love.graphics.ellipse( "fill", 0+self.translate.X*limitx, 0+self.translate.Y*limity, rad*0.4-math.abs(self.translate.X)*(rad*0.1), rad*0.4)
  love.graphics.setStencilTest()
  --DRAW EYE OUTLINE
  love.graphics.setColor(math.lerp(self.color[1],0,0.5),math.lerp(self.color[2],0,0.5),math.lerp(self.color[3],0,0.5))
  love.graphics.ellipse( "line", 0, 0, rad*(8/10), rad*0.4 )
  love.graphics.pop()
end
return entity
