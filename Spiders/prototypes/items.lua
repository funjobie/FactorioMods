data:extend(
{
  {
    type = "item",
    name = "nutrient-paste",
    icon = "__base__/graphics/icons/rail-chain-signal.png",--todo adapt
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "train-transport",--todo adapt
    order = "a[train-system]-e[rail-signal-chain]",--todo adapt
    stack_size = 50
  },  
  {
    type = "item",
    name = "spider-queen-hive",
    icon = "__base__/graphics/icons/rail-chain-signal.png",--todo adapt
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "train-transport",--todo adapt
    order = "a[train-system]-e[rail-signal-chain]",--todo adapt
    place_result = "spider-queen-hive",
    stack_size = 50
  },
  {
    type = "item",
    name = "spider-research-lab",
    icon = "__base__/graphics/icons/rail-chain-signal.png",--todo adapt
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "train-transport",--todo adapt
    order = "a[train-system]-e[rail-signal-chain]",--todo adapt
    place_result = "spider-research-lab",
    stack_size = 50
  },
  {
    type = "tool",
    name = "condensed-nutrient-paste",
    icon = "__base__/graphics/icons/automation-science-pack.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "science-pack",
    order = "a[automation-science-pack]",--todo adapt
    stack_size = 200,
    durability = 10,
    durability_description_key = "description.condensed-nutrient-paste-remaining-amount-key",
    durability_description_value = "description.condensed-nutrient-paste-remaining-amount-value"
  },
  {
    type = "item",
    name = "spider-minion-spawner",
    icon = "__base__/graphics/icons/rail-chain-signal.png",--todo adapt
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "train-transport",--todo adapt
    order = "a[train-system]-e[rail-signal-chain]",--todo adapt
    place_result = "spider-minion-spawner",
    stack_size = 50
  },
  {
    type = "item",
    name = "termite",
    icon = "__base__/graphics/icons/rail-chain-signal.png",--todo adapt
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "train-transport",--todo adapt
    order = "a[train-system]-e[rail-signal-chain]",--todo adapt
    stack_size = 50
  },
  {
    type = "item",
    name = "termite-hive",
    icon = "__base__/graphics/icons/rail-chain-signal.png",--todo adapt
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "train-transport",--todo adapt
    order = "a[train-system]-e[rail-signal-chain]",--todo adapt
    place_result = "termite-hive",
    stack_size = 50
  },
})
