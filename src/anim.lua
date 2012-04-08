local grd, img, idle, back, forwd, jump
local anim8 = require "lib/anim8/anim8"

  grd = {
    idle  = anim8.newGrid(64,64, 64,  64),
    nrml  = anim8.newGrid(64,64, 320, 64),
    jmp   = anim8.newGrid(64,64, 704, 64)
  }
  
  img = {
    idle  = love.graphics.newImage("gfx/anim/idle.png"),
    forwd = love.graphics.newImage("gfx/anim/forward.png"),
    back  = love.graphics.newImage("gfx/anim/backward.png"),
    jump  = love.graphics.newImage("gfx/anim/jump.png"),
    bJump = love.graphics.newImage("gfx/anim/backJump.png"),
    fJump = love.graphics.newImage("gfx/anim/forwdJump.png"),
  }

  idle  = anim8.newAnimation("once", grd.idle('1-1,1'), 0.1)
  back  = anim8.newAnimation("loop", grd.nrml('1-5,1'), 0.1)
  forwd = anim8.newAnimation("loop", grd.nrml('1-5,1'), 0.1)
  fJump = anim8.newAnimation("loop", grd.jmp('1-11,1'), 0.1)
  bJump = anim8.newAnimation("loop", grd.jmp('1-11,1'), 0.1)

  function animUpdate(hero, dt)
    if hero.cd == "forwd" then forwd:update(dt) end
    if hero.cd == "back"  then  back:update(dt) end
    if hero.cd == "idle"  then  idle:update(dt) end
    if hero.cd == "fJump" then fJump:update(dt) end
    if hero.cd == "bJump" then bJump:update(dt) end
  end
  
  function animDrawHero(hero)
    if hero.cd == "forwd" then forwd:draw(img.forwd, hero.x, hero.y) end
    if hero.cd == "back"  then   back:draw(img.back, hero.x, hero.y) end
    if hero.cd == "idle"  then   idle:draw(img.idle, hero.x, hero.y) end
    if hero.cd == "fJump" then fJump:draw(img.fJump, hero.x, hero.y) end
    if hero.cd == "bJump" then bJump:draw(img.bJump, hero.x, hero.y) end
  end
