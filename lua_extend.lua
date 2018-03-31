--Boolean Integer conversion
BTI = function(A) return A and 1 or 0 end
ITB = function(A) if math.abs(A) > 0 then return true else return false end end

--Print table
table.print = function(node)
  -- to make output beautiful
      local function tab(amt)
          local str = ""
          for i=1,amt do
              str = str .. "\t"
          end
          return str
      end

      local cache, stack, output = {},{},{}
      local depth = 1
      local output_str = "{\n"

      while true do
          local size = 0
          for k,v in pairs(node) do
              size = size + 1
          end

          local cur_index = 1
          for k,v in pairs(node) do
              if (cache[node] == nil) or (cur_index >= cache[node]) then

                  if (string.find(output_str,"}",output_str:len())) then
                      output_str = output_str .. ",\n"
                  elseif not (string.find(output_str,"\n",output_str:len())) then
                      output_str = output_str .. "\n"
                  end

                  -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
                  table.insert(output,output_str)
                  output_str = ""

                  local key
                  if (type(k) == "number" or type(k) == "boolean") then
                      key = "["..tostring(k).."]"
                  else
                      key = "['"..tostring(k).."']"
                  end

                  if (type(v) == "number" or type(v) == "boolean") then
                      output_str = output_str .. tab(depth) .. key .. " = "..tostring(v)
                  elseif (type(v) == "table") then
                      output_str = output_str .. tab(depth) .. key .. " = {\n"
                      table.insert(stack,node)
                      table.insert(stack,v)
                      cache[node] = cur_index+1
                      break
                  else
                      output_str = output_str .. tab(depth) .. key .. " = '"..tostring(v).."'"
                  end

                  if (cur_index == size) then
                      output_str = output_str .. "\n" .. tab(depth-1) .. "}"
                  else
                      output_str = output_str .. ","
                  end
              else
                  -- close the table
                  if (cur_index == size) then
                      output_str = output_str .. "\n" .. tab(depth-1) .. "}"
                  end
              end

              cur_index = cur_index + 1
          end

          if (size == 0) then
              output_str = output_str .. "\n" .. tab(depth-1) .. "}"
          end

          if (#stack > 0) then
              node = stack[#stack]
              stack[#stack] = nil
              depth = cache[node] == nil and depth + 1 or depth - 1
          else
              break
          end
      end

      -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
      table.insert(output,output_str)
      output_str = table.concat(output)

      print(output_str)
end
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
table.Random = function(...)
  local tab
  local b = {...}
  if #b == 1 then tab = b[1] else tab = b end
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
function math.clamp(low, n, high) return math.min(math.max(n, low), high) end


function math.maxabs(...)
  local tab = {0,...}
  local high= 1
  for i, k in ipairs(tab) do
    if math.abs(k) > math.abs(tab[high]) then high = i end
  end
  if high == nil then return 0 else return tab[high] end
end

function math.round(n, deci) deci = 10^(deci or 0) return math.floor(n*deci+.5)/deci end
--COLOR Functions
function rgbToHsv(...)
  local tab = {...}
  r, g, b, a = (tab[1] or 0) / 255, (tab[2] or 0) / 255, (tab[3] or 0) / 255, (tab[4] or 0) / 255
  local max, min = math.max(r, g, b), math.min(r, g, b)
  local h, s, v
  v = max

  local d = max - min
  if max == 0 then s = 0 else s = d / max end

  if max == min then
    h = 0 -- achromatic
  else
    if max == r then
    h = (g - b) / d
    if g < b then h = h + 6 end
    elseif max == g then h = (b - r) / d + 2
    elseif max == b then h = (r - g) / d + 4
    end
    h = h / 6
  end

  return {h, s, v, a}
end

function hsvToRgb(...)
  local tab = {...}
  local h, s, v, a = tab[1] or 0,tab[2] or 0,tab[3] or 0,tab[4] or 0
  local r, g, b

  local i = math.floor(h * 6);
  local f = h * 6 - i;
  local p = v * (1 - s);
  local q = v * (1 - f * s);
  local t = v * (1 - (1 - f) * s);

  i = i % 6

  if i == 0 then r, g, b = v, t, p
  elseif i == 1 then r, g, b = q, v, p
  elseif i == 2 then r, g, b = p, v, t
  elseif i == 3 then r, g, b = p, q, v
  elseif i == 4 then r, g, b = t, p, v
  elseif i == 5 then r, g, b = v, p, q
  end

  return {r * 255, g * 255, b * 255, a * 255}
end
function hextoRgb(hex)
  hex=hex:sub(2,#hex)
  _,_,a,r,g,b = hex:find('(%x%x)(%x%x)(%x%x)(%x%x)')
  color = {tonumber(r,16),tonumber(g,16),tonumber(b,16)}
  return color
end
