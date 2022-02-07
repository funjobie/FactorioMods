require("util")

local function init_globals()
  
  global.version = "0.1.1"
  
  global.spider_queen_hive = {}
  global.spider_queen_hive.map_entity_to_hidden_entity = {}
  global.spider_queen_hive.map_hidden_entity_to_entity = {}
  
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

local function on_built(entity)
  if entity.name == "spider-queen-hive" then
    --local newEntity = entity.surface.create_entity{name = "spider-queen-hive-car", position = entity.position, force = entity.force}
    local new_ent_pos = entity.position
	--new_ent_pos.x = new_ent_pos.x -3;
	local newEntity = entity.surface.create_entity{name = "spider-queen-hive-car", position = new_ent_pos, force = entity.force}
    newEntity.destructible = false
    newEntity.minable = false
    global.spider_queen_hive.map_entity_to_hidden_entity[entity.unit_number] = newEntity
    global.spider_queen_hive.map_hidden_entity_to_entity[newEntity.unit_number] = entity
  end
end

local function on_unbuilt(entity)
  if entity.name == "spider-queen-hive" then
    if global.spider_queen_hive.map_entity_to_hidden_entity[entity.unit_number].valid then
      local hidden_entity = global.spider_queen_hive.map_entity_to_hidden_entity[entity.unit_number]
      global.spider_queen_hive.map_hidden_entity_to_entity[hidden_entity.unit_number] = nil
      hidden_entity.destroy()
    end
    global.spider_queen_hive.map_entity_to_hidden_entity[entity.unit_number] = nil
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
      local assembler = global.spider_queen_hive.map_hidden_entity_to_entity[player.vehicle.unit_number]
      local fluidBoxes = assembler.fluidbox
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