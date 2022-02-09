data:extend(
{
  {
    type = "technology",
    name = "termites",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/logistic-science-pack.png",--todo adapt
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "termite-hive"
      },
      {
        type = "unlock-recipe",
        recipe = "nutrient-paste-from-wood"
      },
      {
        type = "unlock-recipe",
        recipe = "termites-from-wood"
      }
    },
    unit =
    {
      count = 15,
      ingredients = {{"condensed-nutrient-paste", 1}},
      time = 5
    },
    order = "c-a"
  },
})
