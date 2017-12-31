require "lua_extend"
require "METHOS/INIT"

function love.load()
  Methos.Load()
end

function love.update(dt)
  Methos.Update(dt)
  Methos.keypressedtxt = {}
  Methos.keyreleasedtxt = {}
end

function love.draw()
  Methos.Draw()
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
