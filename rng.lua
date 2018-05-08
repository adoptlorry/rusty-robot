rng = {}
math.randomseed(os.time())
used = {}
function rng.getdistinct(width)
  repeat
    newx = math.random(2, (love.graphics.getWidth() / (width)) - 2)
  until rng.check(newx, used, bound)
  return newx * width
end
function rng.get(min, max)
  return math.random(min, max)
end
function rng.check(value, used, bound)
    if not used[value] and math.fmod(value, 2) == 0 then
      used[value] = true
      return true
    else
      return false
    end
end
function rng.remove(value)
  used[value] = false
end