--Boolean Integer conversion
BTI = function(A) return A and 1 or 0 end
ITB = function(A) if math.abs(A) > 0 then return true else return false end end

--Combines tables into a new one
table.Add = function(...)
  local list = {...}
  local tab = {}
  for a, b in ipairs(list) do
    for i, k in pairs(b) do
      if type(i) == "string" then tab[i] = k else table.insert(tab,k) end
    end
  end
  return tab
end

--Picks random index in a table
table.Random = function(tab)
  return tab[math.random(1,#tab)]
end

--Reverses index labeled keys
table.reverse = function(t)
  local reversedTable = {}
  local itemCount = #t
  for k, v in ipairs(t) do
    reversedTable[itemCount + 1 - k] = v
  end
  return reversedTable
end
--Added Math Functions
math.lerp = function(a,b,c) return a+(b-a)*c end

math.Anglelerp = function(a,b,c)
  function shortAngleDist(a0,a1)
      local max = math.pi*2;
      local da = (a1 - a0) % max;
      return 2*da % max - da;
  end
  return a + shortAngleDist(a,b)*c;
end
