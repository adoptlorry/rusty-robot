function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end
  require("player")
  require("enemy")
  require("collision")
  enemies.spawn()
end
function love.update(dt)
  --collision with player bullets
  for i,e in ipairs(enemies) do
    for _,b in ipairs(player.bullets) do
      if CheckCollision(b, e) then
        table.remove(enemies, i)
        table.remove(player.bullets, i)
        player.score = player.score + 1
      end
    end
  end
  --collision with enemy bullets
  for _,e in ipairs(enemies) do
    for i,b in ipairs(e.bullets) do
      if CheckCollision(b, player) then
        player.health = player.health - 1
        table.remove(e.bullets, i)
      end
    end
  end
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
  --manage enemies
  for i,e in ipairs(enemies) do
    if e.y > (love.graphics.getHeight() - 50) then 
      table.remove(enemies, i)
    end
    e.fire() --try firing for each enemy
    e.y = e.y + e.movespeed --move the enemy down by it's move speed
    for i,b in ipairs(e.bullets) do --manage each bullet
      if b.y > (love.graphics.getHeight() - 50) then table.remove(e.bullets, i) end
      b.y = b.y + e.bulletspeed
    end
  end
  if enemies.count() ~= enemies.max then
    enemies.spawn()
  end
end
function love.draw()
  --draw player score
  love.graphics.print("Score:" .. player.score, 0, 0, 0, 2,2)
  --draw player
  love.graphics.setColor(0, 255, 0)
  love.graphics.rectangle("line", player.x, player.y, player.width, player.height)
  --draw player bullets
  for _,b in pairs(player.bullets) do
    love.graphics.circle("fill", b.x, b.y, b.radius)
  end
  --draw enemies
  love.graphics.setColor(255, 0, 0)
  for _,e in ipairs(enemies) do
    love.graphics.rectangle("line", e.x, e.y, e.width, e.height)
  end
  --draw enemy bullets
  for _,e in ipairs(enemies) do
    for _,b in ipairs(e.bullets) do
      love.graphics.circle("fill", b.x, b.y, b.radius)
    end
  end
end