--------------------------------------------------------------------------------
--
-- ENEMY: Aquae
--
-- en_aqua.lua
--
------------------------------- Private Fields ---------------------------------
local enemyBase = require("baseEnemy")
local class = require("classy");

local M = {};

M.class = class("Aquae", enemyBase.BaseEnemy);
M.description = "Careful: Aquaes won't restrict themselves to one shape or size."

function M.class:__init(_x, _y)
  self.x = _x;
  self.y = _y;
  enemyBase.BaseEnemy.__init(self, 2, self.x, self.y, math.random(100, 500), math.random(100, 500), 0, "img/sprites/aqua.png", "Aquae", description, 0);

  self.sprite.maxSpeed = 200;
  self.sprite.acceleration = 0.25;
  self.sprite.healthBar.maxHealth = 65;
  self.sprite.healthBar.health = 65;
  self.sprite.healthBar.armour = ((self.sprite.width + self.sprite.height)/200)/10;
  self.sprite.damage = math.random(30, 60);
end

function M.class:runCoroutine()
  --Add enemytype specific run routines here

  --Size of Aqaue ships change over time

  if(self.sprite.width >= self.width + 99) then
    self.widthIncrease = false
  elseif(self.sprite.width <= self.width - 99) then
    self.widthIncrease = true;
  end

  if(self.widthIncrease == true) then
    self.sprite.width = self.sprite.width + 1;
  else
    self.sprite.width = self.sprite.width - 1;
  end

  if(self.sprite.height >= self.height + 99) then
    self.heightIncrease = false
  elseif(self.sprite.height <= self.height - 99) then
    self.heightIncrease = true;
  end

  if(self.heightIncrease == true) then
    self.sprite.height = self.sprite.height + 1;
  else
    self.sprite.height = self.sprite.height - 1;
  end

  --Armour changes depending on size
  self.sprite.healthBar.armour = ((self.sprite.width + self.sprite.height)/200)/10;
end

return M;
