rng = {}
math.randomseed(os.time())
used = {}
function rng.get(width)
  repeat
    newx = math.random(2, (love.graphics.getWidth() / (width)) - 2)
  until rng.check(newx, used, bound)
  return newx * width
end
function rng.check(value, used, bound)
    if not used[value] then
      used[value] = true
      return true
    else
      return false
    end
end
function rng.remove(value)
  used[value] = false
end