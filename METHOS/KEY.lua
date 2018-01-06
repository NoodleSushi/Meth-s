Methos.Key = {}
Methos.Key.pressedtxt = {}
Methos.Key.Pressed = function(txt)
  return Methos.Key.pressedtxt[txt] ~= nil
end

Methos.Key.releasedtxt = {}
Methos.Key.Released = function(txt)
  return Methos.Key.releasedtxt[txt] ~= nil
end
