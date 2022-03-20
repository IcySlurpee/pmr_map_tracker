-- Underscore prefixed functions return booleans.
-- For use with other functions because to Lua, '0' is truthy. /shrug
function has(code, amount)
  local count = Tracker:ProviderCountForCode(code)
  amount = tonumber(amount)
  if not amount then
    amount = 1
  end
  return count >= amount
end

function get_object(code)
  local object = Tracker:FindObjectForCode(code)
  if object then
    return object
  end
  print("[!ERR] unable to get_object: ", code)
  return nil
end

function has_star_spirits(amount)
  local count = Tracker:ProviderCountForCode("spirits")
  amount = tonumber(amount)
  return count >= amount
end

function can_access_star_haven()
  local amount = get_object("setting_spirits").AcquiredCount
  if amount == 0 then
    return 1
  elseif has_star_spirits(amount) then
    return 1
  end
  return 0
end

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

function can_plant_seeds()
  if (has("seed1") and has("seed2") and has("seed3") and has("seed4"))
     or has("seeds", 4) then
    return 1
  else
    return 0
  end
end

function can_access_flower_fields()
  if has("setting_open_flower_gate") or has("flag_flower_fields_access") then
    return 1
  end
  return 0
end

function can_access_blue_house()
  if (has("spinjump") and has("bombette"))
     or has("setting_open_blue_house")
     or has("flag_unlocked_blue_house") then
    return 1
  else
    return 0
  end 
end

function can_shake_trees()
  if has("hammer") or has("bombette") then
    return 1
  else
    return 0
  end
end

function can_flip_panels()
  if has("spinjump") or has("hammer3") then
    return 1
  else
    return 0
  end
end

function can_see_hidden_blocks()
  if has("watt") or has("setting_visible_blocks") then
    return 1
  else
    return 0
  end
end

function can_ride_train()
  if has("setting_start_outpost") or has("flag_bombed_train_rock") then
    return 1
  else
    return 0
  end
end
function _can_ride_train()
  if has("setting_start_outpost") or has("flag_bombed_train_rock") then
    return true
  else
    return false
  end
end

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
