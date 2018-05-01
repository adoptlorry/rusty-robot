function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end
  
  require("player")
  require("enemy")
  
  enemies.spawn()
end
function checkCollisions(enemies, bullets)
	for i, e in ipairs(enemies) do
	    for _, b in ipairs(bullets) do
        if b.y <= e.y + e.height and b.x > e.x and b.x < e.x + e.width then
            table.remove(enemies, i)
            enemies.spawn()
            table.remove(bullets, i)
        end
	    end
	end
end
function love.update(dt)
  --manage coolodwns of players and enemies
  player.cooldown = player.cooldown - 0.8
  for _,e in ipairs(enemies) do
    e.cooldown = e.cooldown - 0.2
  end
  --player movement
  if love.keyboard.isDown("right") then
    player.x = player.x + player.movespeed
  end
  if love.keyboard.isDown("left") then
    player.x = player.x - player.movespeed
  end
  --player fire
  if love.keyboard.isDown("space") then player.fire() end
  --manage player bullets
  for i,b in ipairs(player.bullets) do
    if b.y < 0 then table.remove(player.bullets, i) end
    b.y = b.y - player.bulletspeed
  end
  --player bullet collisions with enemies
  checkCollisions(enemies,player.bullets)
  --manage enemies
  for i,e in ipairs(enemies) do
    if e.y > (love.graphics.getHeight() - 50) then 
      table.remove(enemies, i)
      enemies.spawn()
    end
    e.fire() --try firing for each enemy
    e.y = e.y + e.movespeed --move the enemy down by it's move speed
    for i,b in ipairs(e.bullets) do --manage each bullet
      if b.y > (love.graphics.getHeight() - 50) then table.remove(enemy.bullets, i) end
      b.y = b.y + enemy.bulletspeed
    end
  end
end
function love.draw()
  --draw player
  love.graphics.setColor(0, 255, 0)
  love.graphics.rectangle("line", player.x, player.y, player.width, player.height)
  --draw player bullets
  for _,b in pairs(player.bullets) do
    love.graphics.circle("fill", b.x, b.y, 5)
  end
  --draw enemies
  love.graphics.setColor(255, 0, 0)
  for _,e in ipairs(enemies) do
    love.graphics.rectangle("line", e.x, e.y, e.width, e.height)
  end
  --draw enemy bullets
  for _,b in pairs(enemies) do
    for _,b in pairs(enemy.bullets) do
      love.graphics.circle("fill", b.x, b.y, 5)
    end
  end
end