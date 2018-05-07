math.randomseed(os.time())
enemies = {}
enemies.max = 2
enemies.bullets = {}
enemies.spawn = function()
  enemy = {x = math.random(100, love.graphics.getWidth() - 100),
           y = 20,
           width = 30, height = 20,
           cooldown = 20,
           movespeed = 0.8, bulletspeed = 1.8}
  table.insert(enemies, enemy)
end
enemies.fire = function(enemy)
    if enemy.cooldown <= 0 then
      enemy.cooldown = 30
      bullet = {radius = 5,
                x = enemy.x + enemy.width / 2, 
                y = enemy.y + 40}
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