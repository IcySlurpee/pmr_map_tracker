function has(code, amount)
  local count = Tracker:ProviderCountForCode(code)
  amount = tonumber(amount)
  if not amount then
    amount = 1
  end
  return count >= amount
end

function has_partner(partner)
  return has(partner)
end

function has_star_spirits(amount)
  local count = Tracker:ProviderCountForCode("spirits")
  amount = tonumber(amount)

  return count >= amount
end

function can_access_flower_fields()
  if (has("seed1") and has("seed2") and has("seed3") and has("seed4"))
     or has("setting_open_flower_gate")
     or has("seeds", 4) then
    return 1
  else
    return 0
  end
end

function can_access_blue_house()
  if (has("spinjump") and has_partner("bombette"))
     or has("setting_open_blue_house")
     or has("flag_unlocked_blue_house") then
    return 1
  else
    return 0
  end 
end

function can_access_warp1()
  if has("superhammer") then
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
  if has("watt") or has("setting_blocksalwaysvisible") then
    return 1
  else
    return 0
  end
end
