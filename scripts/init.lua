-- Version
-- Settings
-- Auto-Tracking
-- Items
-- Grids

-- Variants
--- Map Variant
---- Map Definitions
---- Map Layouts
---- Locations

-- No Variant
--- Default "Variant"
--- Default Layouts
--- Dummy Maps
--- Dummy Locations

--===--

-- Version
-- FIXME

-- Settings
-- FIXME

-- Auto-Tracking
-- FIXME

local items_only = "standard"
local variant = Tracker.ActiveVariantUID
if variant == "" then
  variant = items_only
end

-- Items
print("Loading Global Items")
Tracker:AddItems("items/wheel.json")
Tracker:AddItems("items/equipment.json")
Tracker:AddItems("items/misc.json")
Tracker:AddItems("items/options.json")
print("")

-- Grids
print("Loading Global Grids")
dir = "layouts/grids"
grids = {
  "armors",
  "bottles",
  "collectibles",
  "rewards",
  "scents",
  "shields",
  "swords",
  "upgrades",
  "toggles",
  "progressives",
  "grids"
}
for _, gridCat in ipairs(grids) do
  Tracker:AddLayouts(dir .. "/" .. gridCat .. ".json")
end
print("")

-- Variants
if string.find(variant, "map") then
  --- Map Variant
  print("Map Variant; load map stuff")
  print("")

  ---- Map Definitions
  print("Loading Map Definitions")
  ----- Overworld Map
  Tracker:AddMaps("maps/maps.json")
  print("")

  ---- Map Layouts
  print("Loading Map Layouts")
  ----- Overworld Map
  Tracker:AddLayouts("layouts/maps/world.json")
  print("")

  ---- Locations
  print("Loading Map Locations")
  Tracker:AddLocations("locations/world.json")
  print("")

  ---- Options Items
  print("Loading Map Options Items")
  Tracker:AddLayouts("items/options.json")
  print("")

  ---- Options Layout
  print("Loading Map Options Layout")
  Tracker:AddLayouts("layouts/options.json")
  print("")
else
  -- No Variant
  print("Not a Map Variant; load default stuff")

  -- Legacy
  print("Satisfy Legacy Loads")
  --- Dummy Maps
  Tracker:AddMaps("maps/maps.json")
  --- Dummy Locations
  Tracker:AddLocations("locations/world.json")
  print("")
end

-- Other Layouts
print("Loading " .. (variant ~= items_only and ("Variant (" .. variant .. ")") or "Global") .. " Layouts")
Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/broadcast.json")
print("")
