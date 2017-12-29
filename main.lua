require "lua_extend"
require "METHOS/INIT"

function love.load()

end

function love.update(dt)

  Methos.keypressedtxt = {}
  Methos.keyreleasedtxt = {}
end

function love.draw()

end

------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------

function love.keypressed(key)
  Methos.keypressedtxt[key] = 0
end

function love.keyreleased(key)
  Methos.keyreleasedtxt[key] = 0
end
