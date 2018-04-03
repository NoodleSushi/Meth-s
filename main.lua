require "lua_extend"
require "METHOS/INIT"

function love.load()
  Methos.Load()
end

function love.update(dt)
  --love.timer.sleep(dt)
  Methos.Update(dt)
end

function love.draw()
  Methos.Draw()
end

------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------

function love.keypressed(key)
  Methos.Key.pressedtxt[key] = 0
end

function love.keyreleased(key)
  Methos.Key.releasedtxt[key] = 0
end
function love.gamepadpressed( joystick, button )
   Methos.Pad.pressed = true
end
function love.gamepadreleased( joystick, button )
   Methos.Pad.released[button] = joystick
end
