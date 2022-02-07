data:extend(
{
  {
    type = "fluid",
    name = "spider-labor",
    default_temperature = 25,
    fuel_value = "1.25J", --todo adapt? --based on https://en.wikipedia.org/wiki/Human_power 75J / 60 ticks. 
    base_color = {r=0.5, g=0.5, b=0},
    flow_color = {r=0.6, g=0.6, b=0},
    max_temperature = 100,
    icon = "__base__/graphics/icons/rail-chain-signal.png",--todo adapt
    icon_size = 64, icon_mipmaps = 4,
    order = "a[fluid]-g[human-labor]"--todo adapt
    },
})
