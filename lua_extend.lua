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
