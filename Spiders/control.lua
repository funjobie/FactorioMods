require("util")

local function init_globals()
  
  global.version = "0.1.1"
  
  global.spider_building_enterable = {}
  global.spider_building_enterable.map_entity_to_hidden_entity = {}
  global.spider_building_enterable.map_hidden_entity_to_entity = {}
  
end

script.on_init(function()
  init_globals()
end)

local function updateModVersion()
  if global.version < "0.1.1" then
    --nothing to update in this version
    global.version = "0.1.1"
  end
end

script.on_configuration_changed(function()
  updateModVersion()
end)

local function can_enter_spider_building(entity)
  if entity.name == "spider-research-lab" or entity.name == "spider-queen-hive" then
    return true
  end
end

local function on_built(entity)
  if can_enter_spider_building(entity) then
    local newEntity = entity.surface.create_entity{name = "spider-queen-hive-car", position = entity.position, force = entity.force}
    newEntity.destructible = false
    newEntity.minable = false
    global.spider_building_enterable.map_entity_to_hidden_entity[entity.unit_number] = newEntity
    global.spider_building_enterable.map_hidden_entity_to_entity[newEntity.unit_number] = entity
  end
end

local function isATreeWithTermites(entity)
  if entity.name == "dead-tree-desert" or entity.name == "dead-grey-trunk" or entity.name == "dead-dry-hairy-tree" then 
    return true
  end
  return false
end

local function on_unbuilt(entity)
  if can_enter_spider_building(entity) then
    if global.spider_building_enterable.map_entity_to_hidden_entity[entity.unit_number].valid then
      local hidden_entity = global.spider_building_enterable.map_entity_to_hidden_entity[entity.unit_number]
      global.spider_building_enterable.map_hidden_entity_to_entity[hidden_entity.unit_number] = nil
      hidden_entity.destroy()
    end
    global.spider_building_enterable.map_entity_to_hidden_entity[entity.unit_number] = nil
  end
  game.players[1].print("stuf died: " .. entity.name)
  if isATreeWithTermites(entity) then
    local num = math.random(100)
    local loot = 0
    if num >= 50 and num < 60 then loot = 3 end
    if num >= 60 and num < 70 then loot = 4 end
    if num >= 70 and num < 80 then loot = 5 end
    if num >= 80 and num < 90 then loot = 6 end
    if num >= 90 and num < 100 then loot = 7 end
    if loot > 0 then
      entity.surface.spill_item_stack(entity.position, {name="termite", count=loot}, true)
    end
    game.players[1].print("rolling " .. tostring(loot))
  end
end

script.on_event(defines.events.on_built_entity, function(event)
  on_built( event.created_entity )
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
  on_built( event.created_entity )
end)

script.on_event(defines.events.script_raised_built, function(event)
  on_built( event.entity )
end)

script.on_event(defines.events.on_player_mined_entity, function(event)
  on_unbuilt(event.entity)
end)

script.on_event(defines.events.on_robot_mined_entity, function(event)
  on_unbuilt(event.entity)
end)

script.on_event(defines.events.script_raised_destroy, function(event)
  on_unbuilt(event.entity)
end)

script.on_event(defines.events.on_entity_died, function(event)
  on_unbuilt(event.entity)
end)

local function spiderLabor_check_entities(event)
  for _, player in pairs(game.connected_players) do
    if player.vehicle and player.vehicle.name == "spider-queen-hive-car" then
      local entity = global.spider_building_enterable.map_hidden_entity_to_entity[player.vehicle.unit_number]
      local fluidBoxes = entity.fluidbox
      if fluidBoxes then
        for fluidBoxIndex = 1,#fluidBoxes do
          local filter = fluidBoxes.get_filter(fluidBoxIndex)
          if filter and filter.name == "spider-labor" then
            fluidBoxes[fluidBoxIndex] = {name="spider-labor", amount=20}
          end
        end
      end
    end
  end
end

script.on_nth_tick(20, function(event)
    spiderLabor_check_entities(event)
end)