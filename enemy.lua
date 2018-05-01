math.randomseed(os.time())
enemies = {}

enemies.spawn = function()
  enemy = {}
  enemy.x = math.random(100, love.graphics.getWidth() - 100)
  enemy.y = 20
  enemy.width, enemy.height = 30, 20
  enemy.cooldown = 20
  enemy.movespeed, enemy.bulletspeed = 0.8, 1.8
  enemy.bullets = {}
  enemy.fire = function()
    if enemy.cooldown <= 0 then
      enemy.cooldown = 30
      bullet = {}
      bullet.x = enemy.x + enemy.width / 2
      bullet.y = enemy.y + 40
      table.insert(enemy.bullets, bullet)
    end
  end
  table.insert(enemies, enemy)
end