--Methos.Pad
Methos.Pad = {}
Methos.Pad.JS = love.joystick.getJoysticks()
Methos.Pad.IN = 0
function Methos.Pad.Refresh()
  Methos.Pad.JS = love.joystick.getJoysticks()
end
function Methos.Pad.setIndex(index)
  Methos.Pad.IN = index
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
  return Methos.Pad.pressed and Methos.Pad.JS[Methos.Pad.IN]:isGamepadDown(button)
end
function Methos.Pad.Release(button)
  return Methos.Pad.released[button] == Methos.Pad.JS[Methos.Pad.IN]
end
Methos.Pad.pressed = false
Methos.Pad.released = {}
