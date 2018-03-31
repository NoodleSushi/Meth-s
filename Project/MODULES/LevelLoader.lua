local module = {}
  function module.new(level)
    local file = require ("Project/THIRD PARTY/"..level)
    local layers = file.layers
    local tab = {
      Color = {},
      Map = {},
      Objects = {},
      Width = file.width*file.tilewidth,
      Height = file.height*file.tileheight,
      Entities = {},
      Colliders= {}
    }
      --CONVERT FILE INTO STUFF
    local function nameget(b,name) 
      for i, k in ipairs(b) do 
        if k.name == name then return k end 
      end
    end
    local function countin(b,name) 
      local x = 0
      for i, k in ipairs(b) do 
        if k.name == name then x = x + 1 end 
      end
      return x
    end
    local function funcido(b,name,func)
      for i, k in ipairs(b) do
        if k.name == name then func(k) end	
      end
    end
    --WATCH MAP
    local x=nameget(layers,"Map")
    --colors
    tab.Color = {
      IN=hextoRgb(x.properties["INNCOLOR"]),
      OUT=hextoRgb(x.properties["OUTCOLOR"]),
      LIN=hextoRgb(x.properties["LINCOLOR"])
    }

    --player coordinates
    p=nameget(x.objects,"Player")
    table.insert(tab.Entities,{"entity_player",{x = p.x, y = p.y, original = true}})

    --Bound List
    n=nameget(x.objects,"Bounds")
    local info = {}
    for i, k in ipairs(n.polygon) do 
      table.insert(info,n.x+k.x)
      table.insert(info,n.y+k.y)
    end
    tab.Map.fill = love.math.triangulate( info )
    tab.Map.line = info

    --Rock List
    local ff = function(a)
      local info = {}
      for i, k in ipairs(a.polygon) do 
        table.insert(info,a.x+k.x)
        table.insert(info,a.y+k.y)
      end
      table.insert(tab.Objects,{line = info, fill = love.math.triangulate(info)})
    end
    funcido(x.objects,"Rock",ff)

    --WATCH MAP
    x=nameget(layers,"Colliders")
    local ff = function(a)
      local temptab = {}
      for i, k in ipairs(a.polygon) do
        table.insert(temptab,a.x+k.x)
        table.insert(temptab,a.y+k.y)
      end
      table.insert(tab.Colliders, temptab)
    end
    funcido(x.objects,"",ff)
    --DRAW FUNCTION
    function tab:draw()
      love.graphics.setLineJoin( "bevel" )
      love.graphics.setLineWidth(5)
      love.graphics.setColor(self.Color.IN)
      for i, k in ipairs(self.Map.fill) do
        love.graphics.polygon("fill",k)
      end
      love.graphics.setColor(self.Color.LIN)
      love.graphics.polygon("line",self.Map.line)

      for i, k in ipairs(self.Objects) do
          --fill
          love.graphics.setColor(self.Color.OUT)
          for c, d in ipairs(k.fill) do
            love.graphics.polygon("fill",d)
          end
          --line
          love.graphics.setColor(self.Color.LIN)
          love.graphics.polygon("line",k.line)
      end
    end
    --ENTITY DUMP FUNCTION
    function tab:dump_entities()
      return tab.Entities
    end
    --COLLIDER DUMP FUNCTION
    function tab:dump_colliders()
      return self.Colliders
    end
    return tab
  end
return module
