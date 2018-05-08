math.randomseed(os.time())
used = {}
function get(width)
  local windowwidth = love.graphics.getWidth()
  repeat
    value = math.random(1, windowwidth / 40)
  until check(value, used, bound)
  return value * width + 1
end
function check(value, used, bound)
    if not used[value] then
      used[value] = true
      return true
    else
      return false
    end
end