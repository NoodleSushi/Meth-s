local room = {
  entities = {}
}
function room:load()
    bitDepth = 16
    samplingRate = 44100
    channelCount = 1
    -- With the above sampling rate, a buffer length of 1024 samplepoints should be enough.
    bufferSize = 1024
    pointer = 0
    sd = love.sound.newSoundData(bufferSize, samplingRate, bitDepth, channelCount)
    qs = love.audio.newQueueableSource(samplingRate, bitDepth, channelCount)

    dspTime = 0.0
end
function math.sqr(a)
  local x = math.sin(a)
  if x > 0 then return 1 else return -1 end
end
function room:update(dt)
     if qs:getFreeBufferCount() == 0 then return end -- only render if we can.
     local samplesToMix = bufferSize -- easy way of doing things.
     for smp = 0, samplesToMix-1 do
         -- put your generator function here.
         
         sd:setSample(pointer, math.sqr(440*math.pi*2*dspTime))
         pointer = pointer + 1
         dspTime = dspTime + (1 / samplingRate)
         if pointer >= sd:getSampleCount() then
             pointer = 0
             qs:queue(sd)
             qs:play()
         end
     end
end

function room:draw()

end
return room
