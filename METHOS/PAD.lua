--Methos.Pad
Methos.Pad = {}
Methos.Pad.JS = love.joystick.getJoysticks()
Methos.Pad.IN = 0
Methos.Pad.COUNT = 0
function Methos.Pad.Refresh()
  if Methos.Pad.COUNT < love.joystick.getJoystickCount( ) then
    Methos.Pad.JS = love.joystick.getJoysticks()
    Methos.Pad.COUNT = love.joystick.getJoystickCount( )
  end
end
function Methos.Pad.setIndex(index)
  Methos.Pad.IN = index
end
function Methos.Pad.getIndex(index)
  return Methos.Pad.IN
end
function Methos.Pad.Vibrate(...)
  return Methos.Pad.JS[Methos.Pad.IN]:setVibration(...)
end
function Methos.Pad.Axis(axis)
  if Methos.Pad.JS[Methos.Pad.IN] ~= nil then
    return Methos.Pad.JS[Methos.Pad.IN]:getGamepadAxis( axis )
  else
    return 0
  end
end
function Methos.Pad.Down(button)
  return Methos.Pad.JS[Methos.Pad.IN]:isGamepadDown(button)
end
function Methos.Pad.Press(button)
  if Methos.Pad.JS[Methos.Pad.IN] == nil then Methos.Pad.Refresh() end
  return Methos.Pad.pressed and Methos.Pad.JS[Methos.Pad.IN]:isGamepadDown(button)
end
function Methos.Pad.Release(button)
  return Methos.Pad.released[button] == Methos.Pad.JS[Methos.Pad.IN]
end
Methos.Pad.pressed = false
Methos.Pad.released = {}
