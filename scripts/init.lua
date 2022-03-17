--Load Package
ScriptHost:LoadScript("scripts/globals.lua")
ScriptHost:LoadScript("scripts/items.lua")
ScriptHost:LoadScript("scripts/layouts.lua")
if HAS_MAP then
  ScriptHost:LoadScript("scripts/locations.lua")
end
