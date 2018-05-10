require("rng")
enemies = {}
enemies.max = 3
enemies.bullets = {}
enemies.spawn = function()
  enemy = {x = rng.getdistinct(30),
           y = -10,
           width = 30, height = 20,
           cooldown = 20,
           movespeed = rng.get(5, 10) / 10.0}
  table.insert(enemies, enemy)
end
enemies.fire = function(enemy)
    if enemy.cooldown <= 0 then
      enemy.cooldown = 30
      bullet = {radius = 5,
                x = enemy.x + enemy.width / 2, 
                y = enemy.y + 40,
                bulletspeed = 1.8}
      table.insert(enemies.bullets, bullet)
    end
  end
enemies.count = function()
  local c = 0
  for i,_ in ipairs(enemies) do
    c = c + 1
  end
  return c
end
enemies.kill = function(i, e)
  rng.remove(e.x / e.width)
  table.remove(enemies, i)
end