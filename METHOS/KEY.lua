Methos.Key = {}
Methos.Key.pressedtxt = {}
function Methos.Key.Pressed(txt)
  return Methos.Key.pressedtxt[txt] ~= nil
end

Methos.Key.releasedtxt = {}
function Methos.Key.Released(txt)
  return Methos.Key.releasedtxt[txt] ~= nil
end
