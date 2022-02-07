data:extend(
{
  {
    type = "recipe-category",
    name = "hive-crafting"
  },
  {
    type = "recipe",
    name = "spider-queen-hive",
    enabled = true,
    ingredients =
    {
      {"wood", 1}
    },
    result = "spider-queen-hive"
  },
  {
    type = "recipe",
    name = "hive-create-minion-spawner",
    enabled = true,
	energy_required = 2,
	category = "hive-crafting",
    ingredients =
    {
      --{"wood", 1}--todo nutrient paste?
    },
    result = "spider-minion-spawner"
  },
})
