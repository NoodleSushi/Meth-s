--Methos.Pad
Methos.Pad = {}
Methos.Pad.JS = love.joystick.getJoysticks()
Methos.Pad.IN = 0
Methos.Pad.Refresh = function()
  Methos.Pad.JS = love.joystick.getJoysticks()
end
Methos.Pad.setIndex = function(index)
  Methos.Pad.IN = index
end
Methos.Pad.Vibrate = function(...)
  return Methos.Pad.JS[Methos.Pad.IN]:setVibration(...)
end
Methos.Pad.Axis = function(axis)
  if Methos.Pad.JS[Methos.Pad.IN] ~= nil then
    return Methos.Pad.JS[Methos.Pad.IN]:getGamepadAxis( axis )
  else
    return 0
  end
end
Methos.Pad.Down = function(button)
  return Methos.Pad.JS[Methos.Pad.IN]:isGamepadDown(button)
end
Methos.Pad.Press = function(button)
  return Methos.Pad.pressed and Methos.Pad.JS[Methos.Pad.IN]:isGamepadDown(button)
end
Methos.Pad.Release = function(button)
  return Methos.Pad.released[button] == Methos.Pad.JS[Methos.Pad.IN]
end
Methos.Pad.pressed = false
Methos.Pad.released = {}
