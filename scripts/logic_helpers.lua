-- Underscore prefixed functions return booleans.
-- For use with other functions because to Lua, '0' is truthy. /shrug
-- Otherwise most return an integer that's what the tracker expects.

--[[
  fn has(string, string) -> boolean

  Queries the tracker with a code and returns `true` if player has collected
  greater than or equal to `amount`, otherwise returns `false`.
]]--
function has(code, amount)
  local count = Tracker:ProviderCountForCode(code)
  amount = tonumber(amount)
  if not amount then
    amount = 1
  end
  return count >= amount
end

--[[
  fn not_has(string) -> boolean

  Queries the tracker with a code and returns `true` if the player has NOT
  collected that code, otherwise returns `false`.
]]
function not_has(code)
  local count = Tracker:ProviderCountForCode(code)
  return count < 1
end

--[[
  fn get_object(string) -> Option<Item>

  Queries the tracker with a code and returns the item object if exists,
  otherwise prints an error and returns `nil`.
]]--
function get_object(code)
  local object = Tracker:FindObjectForCode(code)
  if object then
    return object
  end
  print("[!ERR] unable to get_object: ", code)
  return nil
end

--[[
  fn has_star_spirits(string) -> boolean

  Queries the tracker for current number of collect star spirits and returns
  `true` if greater than or equal to `amount`, otherwise returns `false`.
]]--
function has_star_spirits(amount)
  local count = Tracker:ProviderCountForCode("spirits")
  amount = tonumber(amount)
  return count >= amount
end

--[[
  fn can_access_star_haven() -> integer

  Queries the tracker for the "Number of Star Spirits Required" setting and
  returns `1` if Mario has collected Star Spirits greater than or equal to
  the setting, otherwise returns `0`.
]]--
function can_access_star_haven()
  local amount = get_object("setting_spirits").AcquiredCount
  if amount == 0 then
    return 1
  elseif has_star_spirits(amount) then
    return 1
  end
  return 0
end

----
----Location Helper Functions
----

--[[
  fn can_access_toad_town() -> integer

  Mario needs either:
  * Toad Town start setting
  * Goomba Village start setting and has beaten the Goomba King (standard story progression)
  * Can ride the train backwards from Outpost start
  * Can ride the whale backwards from Yoshi Island start
]]--
function can_access_toad_town()
  if has("setting_start_toad")
     or (has("setting_start_goomba") and has("flag_beat_goomba_king"))
     or _can_ride_train()
     or _can_ride_whale() then
    return 1
  else
    return 0
  end
end

--[[
  fn can_plant_seeds() -> integer

  Mario needs either:
  * 4 individual seed items
  * composite seed item
]]--
function can_plant_seeds()
  if (has("seed1") and has("seed2") and has("seed3") and has("seed4"))
     or has("seeds", 4) then
    return 1
  else
    return 0
  end
end

--[[
  fn can_access_flower_fields() -> integer

  Mario needs either:
  * Open Flower Gate setting
  * Has turned in seeds in Toad Town
]]--
function can_access_flower_fields()
  if has("setting_open_flower_gate") or has("flag_flower_fields_access") then
    return 1
  end
  return 0
end

--[[
  fn can_access_blue_house() -> integer

  Mario needs either:
  * Can traverse Toad Town Tunnels via standard progression
    * Break planks to B2 -> Sushie across water -> Blow up wall
  * Open Blue House setting
  * Blue House door unlocked, futureproofing for outside unlock logic
]]--
function can_access_blue_house()
  if (has("spinjump") and has("sushie") and has("bombette"))
     or has("setting_open_blue_house")
     or has("flag_unlocked_blue_house") then
    return 1
  else
    return 0
  end 
end

--[[
  fn can_shake_trees() -> integer

  Mario needs a hammer or Bombette to shake a tree.
  Possible futureproofing for hammerless starts?
]]--
function can_shake_trees()
  if has("hammer") or has("bombette") then
    return 1
  else
    return 0
  end
end

--[[
  fn can_flip_panels() -> integer

  Mario needs the Super Boots or the Ultra Hammer to flip panels.
]]--
function can_flip_panels()
  if has("spinjump") or has("hammer3") then
    return 1
  else
    return 0
  end
end

--[[
  fn can_see_hidden_blocks() -> integer

  Mario needs either Watt or the Visible Hidden ? Blocks setting for hidden
  ? blocks to be in logic.
]]--
function can_see_hidden_blocks()
  if has("watt") or has("setting_visible_blocks") then
    return 1
  else
    return 0
  end
end

--[[
  fn _can_reach_warp1() -> boolean

  Mario needs a Super Hammer to reach Warp Zone 1 in Toad Town Tunnels.
]]--
function _can_reach_warp1()
  if has("superhammer") then
    return true
  end
end

--[[
  fn can_ride_whale() -> integer
  fn _can_ride_whale() -> boolean

  Riding the whale backwards to Toad Town does not unlock the reverse path.

  Mario needs either:
  * Yoshi Island start - Homeward Shroom (always take it)
  * Hit whale 3 times with the hammer, then use Watt to reveal and defeat Fuzzipede.
]]--
function can_ride_whale()
  if has("setting_start_yoshi") or has("flag_beat_fuzzipede") then
    return 1
  else
    return 0
  end
end
function _can_ride_whale()
  if has("setting_start_yoshi") or has("flag_beat_fuzzipede") then
    return true
  else
    return false
  end
end

--[[
  fn can_traverse_desert() -> integer
  fn _can_traverse_desert() -> boolean

  Mario needs either:
  * Rides the train, hover over Buzzar's bridge w/ Parakarry. (standard progression)
  * Warp Zone 1 -> Outpost, walk to desert.
  * Outpost start location, walk to desert.
]]--
function can_traverse_desert()
  if (has("flag_bombed_train_rock") and has("parakarry"))
     or _can_reach_warp1()
     or has("setting_start_outpost") then
    return 1
  end
  return 0
end
function _can_traverse_desert()
  if (has("flag_bombed_train_rock") and has("parakarry"))
     or _can_reach_warp1()
     or has("setting_start_outpost") then
    return true
  end
  return false
end

--[[
  fn can_ride_train() -> integer
  fn _can_ride_train() -> boolean

  Riding the train backwards breaks the stone without the need for Bombette.

  Mario needs either:
  * Blow up the rock w/ Bombette (standard progression)
  * Can traverse Dry Dry Desert (ride the train backwards)
]]--
function can_ride_train()
  if has("flag_bombed_train_rock") or _can_traverse_desert() then
    return 1
  else
    return 0
  end
end
function _can_ride_train()
  if has("flag_bombed_train_rock") or _can_traverse_desert() then
    return true
  else
    return false
  end
end

--[[
  fn fast_bowser_skipped_checks() -> integer

  Removes visibility for checks in Bowser's Castle that are skipped
  by the "fast Bowser's Castle" option.
]]--
function fast_bowser_skipped_checks()
  if has("setting_fast_bowser") then
    return 0
  end
  return 1
end
