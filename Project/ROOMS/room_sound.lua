local room = {
  entities = {}
}

function room:load()
  local samples = 100000
  local data = love.sound.newSoundData(samples)
  local noteChange = 10000
  local note = 200
  local change = 50
  local minimum = 100
  for i = 0, samples * 2 - 1 do
    if i % noteChange == 0 then
      local factor = -2 + math.random(0, 4)
      if note <= minimum then factor = 1 end
      note = note + change * factor
    end
      
    data:setSample(i, math.sin(i % note / note / (math.pi * 2)))
  end
  sound = love.audio.newSource(data)
end

function room:update(dt)
  if love.keyboard.isDown( "space" ) and not sound:isPlaying() then
    sound:play()
  end
  if not love.keyboard.isDown( "space" ) then love.audio.stop( ) end
end

function room:draw()

end
return room
