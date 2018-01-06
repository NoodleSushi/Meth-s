return{
  up = function()
    return love.keyboard.isDown("w")
  end,
  down = function()
    return love.keyboard.isDown("s")
  end,
  left = function()
    return love.keyboard.isDown("a")
  end,
  right = function()
    return love.keyboard.isDown("d")
  end
}
