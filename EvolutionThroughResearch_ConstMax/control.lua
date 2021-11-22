require("util")

local function init_globals()
    
    global.maxResearchRate = 0
    
    global.version = "0.1.1"
                
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

script.on_event(defines.events.on_tick, function(event)

    if game.tick % (settings.startup["evolution-through-research-frequency"].value * 60) == 0 then
        for _,force in pairs(game.forces) do
            if force.ai_controllable or force == game.forces.enemy then
                force.evolution_factor=global.maxResearchRate
            end
        end
    end
end)

script.on_event(defines.events.on_research_finished, function(event)
    local currentResearchRate = 0
    for _, force in pairs(game.forces) do
        local numResearched = 0
        for _, tech in pairs(force.technologies) do
            if tech.enabled then
                if tech.prototype.research_unit_count_formula == nil then
                    if tech.researched then
                        numResearched = numResearched + 1
                    end
                end
            end
        end
        local currentForResearched = numResearched / settings.startup["evolution-through-research-max-tech"].value
        if currentForResearched > currentResearchRate then
            currentResearchRate = currentForResearched
        end
    end
    global.maxResearchRate=currentResearchRate
end)
