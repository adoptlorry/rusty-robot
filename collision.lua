function CheckCollision(bullet, o)
  return bullet.x < o.x + o.width and
         o.x < bullet.x + bullet.radius * 2 and
         bullet.y < o.y + o.height and
         o.y < bullet.y + bullet.radius * 2
end