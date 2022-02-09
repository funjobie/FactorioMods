data:extend(
{
  {
    type = "recipe-category",
    name = "hive-crafting"
  },
  {
    type = "recipe-category",
    name = "termites-crafting"
  },
  {
    type = "recipe",
    name = "nutrient-paste-from-fish",
    enabled = true,
    ingredients =
    {
      {"raw-fish", 1}
    },
    result = "nutrient-paste",
    result_count = 3
  },
  {
    type = "recipe",
    name = "spider-research-lab",
    enabled = true,
    ingredients =
    {
      {"nutrient-paste", 50},--todo amount
      {"wood", 20}--todo amount
    },
    result = "spider-research-lab"
  },
  {
    type = "recipe",
    name = "condensed-nutrient-paste",
    enabled = true,
    ingredients =
    {
      {"nutrient-paste", 5}
    },
    result = "condensed-nutrient-paste",
    result_count = 1
  },
  {
    type = "recipe",
    name = "nutrient-paste-from-wood",
    enabled = false,
    energy_required = 30,
    category = "termites-crafting",
    ingredients =
    {
      {"wood", 1}
    },
    results = {{type="item",name="nutrient-paste",amount_min=1,amount_max=8,catalyst_amount=12}},
  },
  {
    type = "recipe",
    name = "termites-from-wood",
    enabled = false,
    energy_required = 30,
    category = "termites-crafting",
    ingredients =
    {
      {"wood", 1}
    },
    results = {{type="item",name="termite",amount_min=1,amount_max=5,catalyst_amount=8}},
  },
  {
    type = "recipe",
    name = "spider-queen-hive",
    enabled = true,
    ingredients =
    {
      {"nutrient-paste", 70}--todo amount
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
      {"nutrient-paste", 150}--todo nutrient paste?
    },
    result = "spider-minion-spawner"
  },
  {
    type = "recipe",
    name = "termite-hive",
    enabled = false,
    ingredients =
    {
      {"termite", 20}
    },
    result = "termite-hive"
  },
})
