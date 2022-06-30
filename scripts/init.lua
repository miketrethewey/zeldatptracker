local items_only = "standard"
local variant = Tracker.ActiveVariantUID
if variant == "" then
  variant = items_only
end

-- Items
print("Loading Items")
Tracker:AddItems("items/wheel.json")
Tracker:AddItems("items/equipment.json")
Tracker:AddItems("items/misc.json")
print("")

-- Other Layouts
print("Loading Layouts")
Tracker:AddLayouts("tracker.json")
Tracker:AddLayouts("broadcast.json")
print("")

if string.find(variant, "map") then
  print("Map Variant; load map stuff")
  print("")

  -- Options Items
  print("Loading Items")
  Tracker:AddItems("variants/" .. variant .. "/items/options.json")
  print("")

  -- Options Layout
  print("Loading Options")
  Tracker:AddLayouts("variants/" .. variant .. "/layouts/options.json")
  print("")

  print("Loading Maps")
  -- Overworld Map
  Tracker:AddMaps("maps/maps.json")
  print("")
else
  print("Not a Map Variant; load default stuff")
end

-- Legacy
print("Satisfy Legacy Loads")
Tracker:AddMaps("maps/maps.json")
Tracker:AddLocations("locations/world.json")
print("")

-- Variant Overrides
if variant ~= items_only then
  print("Loading Variant")
  -- Layout Overrides
  Tracker:AddLayouts("variants/" .. variant .. "/layouts/tracker.json")    -- Main Tracker
  Tracker:AddLayouts("variants/" .. variant .. "/layouts/broadcast.json")  -- Broadcast View
  print("")
end
