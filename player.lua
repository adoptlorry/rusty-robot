player = {}
player.x = love.graphics.getWidth() / 2
player.y = love.graphics.getHeight() - 200
player.width, player.height = 20, 20
player.movespeed, player.bulletspeed = 5, 5
player.cooldown = 20
player.health = 5
player.score = 0 
player.bullets = {}

player.fire = function()
  if player.cooldown <= 0 then
    player.cooldown = 30
    bullet = {}
    bullet.x = player.x + (player.width / 2)
    bullet.y = player.y - 20
    bullet.radius  = 5
    table.insert(player.bullets, bullet)
  end
end