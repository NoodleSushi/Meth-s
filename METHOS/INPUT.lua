Methos.Input = {}
Methos.Input.data = table.Add(require("Project/inputmap"))
Methos.Input.bool = nil
function Methos.Input.Set(bool)
  Methos.Input.bool = bool
end
function Methos.Input.Return(arg)
  local bool = Methos.Input.bool
  local lam = Methos.Input.data[arg]
  local val = lam()
  if type(bool) == "boolean" then
    local bti = function(A) return A and 1 or 0 end
    local itb = function(A) if math.abs(A) > 0 then return true else return false end end
    if bool == true then
        if type(val) == "boolean" then return val else return itb(val) end
    else
        if type(val) == "number"  then return val else return bti(val) end
    end
  elseif bool == nil then
    return val
  end
end
