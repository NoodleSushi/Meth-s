Methos.Save = {}
--[[
  MODES
  plain
]]
Methos.Save.json = require("METHOS/_json")
function Methos.Save_Plain(TAB,FILENAME)
  f = love.filesystem.newFile(FILENAME..".METHOS_SAVE")
  f:open("w")
  f:write(Methos.Save.json.encode(TAB))
  f:close()
end
function Methos.Load_Plain(FILENAME)
  return Methos.Save.json.decode((love.filesystem.newFile(FILENAME..".METHOS_SAVE")):read())
end
function Methos.Save_Key()

end
