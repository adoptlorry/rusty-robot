function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end
  require("player")
  require("enemy")
  require("collision")
end
function love.update(dt)
  --collision with player bullets
  for i,e in ipairs(enemies) do
    for j,b in ipairs(player.bullets) do
      if CheckCollision(b, e) then
        enemies.kill(i, e)
        table.remove(player.bullets, j)
        player.score = player.score + 1
      end
    end
  end
  --collision with enemy bullets
  for i,b in ipairs(enemies.bullets) do
    if CheckCollision(b, player) then
      player.health = player.health - 1
      table.remove(enemies.bullets, i)
    end
  end
  --change cooldowns of player
  player.cooldown = player.cooldown - 0.8
  --player movement
  if love.keyboard.isDown("right") and player.x + player.width <= love.graphics.getWidth() then
    player.x = player.x + 5
  end
  if love.keyboard.isDown("left") and player.x >= 0 then
    player.x = player.x - 5
  end
  --player fire
  if love.keyboard.isDown("space") then player.fire() end
  --manage player bullets
  for i,b in ipairs(player.bullets) do
    if b.y < 0 then table.remove(player.bullets, i) end
    b.y = b.y - b.bulletspeed
  end
  --enemy movement
  for i,e in ipairs(enemies) do
    e.cooldown = e.cooldown - 0.2
    if e.y > (love.graphics.getHeight() - 50) then enemies.kill(i, e) end
    enemies.fire(e) --try firing for each enemy
    e.y = e.y + e.movespeed --move the enemy down by it's move speed
  end
  --enemy bullets
  for i,b in ipairs(enemies.bullets) do
    if b.y > (love.graphics.getHeight() - 50) then table.remove(enemies.bullets, i) end
    b.y = b.y + b.bulletspeed
  end
  if enemies.count() ~= enemies.max then
    enemies.spawn()
  end
end
function love.draw()
  --draw player score
  love.graphics.print("Score:" .. player.score)
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
  for _,b in ipairs(enemies.bullets) do
    love.graphics.circle("fill", b.x, b.y, b.radius)
  end
end