local variant = Tracker.ActiveVariantUID
if variant == "" then
  variant = "items_only"
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

  -- Options Layout
  print("Loading Options")
  Tracker:AddLayouts("options.json")
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
