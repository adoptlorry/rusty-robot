player = {x = love.graphics.getWidth() / 2,
          y = love.graphics.getHeight() - 200,
          width = 20, height = 20,
          cooldown = 20,
          health = 5, score = 0,
          bullets = {}}
player.fire = function()
  if player.cooldown <= 0 then
    player.cooldown = 20
    bullet = {radius = 5,
              x = player.x + (player.width / 2),
              y = player.y - 20,
              bulletspeed = 5}
    table.insert(player.bullets, bullet)
  end
end