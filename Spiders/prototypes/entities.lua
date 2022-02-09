require ("util")
local hit_effects = require ("base.hit-effects")
local sounds = require("base.sounds")
local movement_triggers = require("base.movement-triggers")
--local spidertron_animations = require("prototypes.entity.spidertron-animations")

data:extend(
{
  {
    type = "assembling-machine",
    name = "spider-queen-hive",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "spider-queen-hive"},
    max_health = 300,
    corpse = "assembling-machine-1-remnants",
    dying_explosion = "assembling-machine-1-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    --collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    alert_icon_shift = util.by_pixel(-3, -12),
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1.png",
          priority="high",
          width = 108,
          height = 114,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, 2),
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1.png",
            priority="high",
            width = 214,
            height = 226,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, 2),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1-shadow.png",
          priority="high",
          width = 95,
          height = 83,
          frame_count = 1,
          line_length = 1,
          repeat_count = 32,
          draw_as_shadow = true,
          shift = util.by_pixel(8.5, 5.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1-shadow.png",
            priority="high",
            width = 190,
            height = 165,
            frame_count = 1,
            line_length = 1,
            repeat_count = 32,
            draw_as_shadow = true,
            shift = util.by_pixel(8.5, 5),
            scale = 0.5
          }
        }
      }
    },
    crafting_categories = {"hive-crafting"},
    crafting_speed = 1.0,
    energy_source =
    {
      type = "fluid",
      emissions_per_minute = 0,
      render_no_power_icon = true,
      fluid_box =
      {
        base_area = 0.2,
        height = 1,
        base_level = 0,
        pipe_connections =
        {
        },
        production_type = "input",
        filter = "spider-labor"
      },
      burns_fluid = true,
      scale_fluid_usage = true,
      effectivity = 1,
    },
    --energy_usage = "75kW",
    energy_usage = "75W",--todo adapt? in case spider labor value changes
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.5
        }
      },
      audible_distance_modifier = 0.5,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }
  },
  {
    --known bugs:
	--cannot leave car after entering. but mining building ejects player so this is ok.
	--might have to be mentioned
    type = "car",
    name = "spider-queen-hive-car",
    icon = "__base__/graphics/icons/car.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-flammable"},
    minable = {mining_time = 0.4, result = "car"},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg",volume = 0.8},
    max_health = 450,
    corpse = "car-remnants",
    dying_explosion = "car-explosion",
    alert_icon_shift = util.by_pixel(0, -13),
    energy_per_hit_point = 1,
    crash_trigger = crash_trigger(),
    resistances =
    {
      {
        type = "fire",
        percent = 50
      },
      {
        type = "impact",
        percent = 30,
        decrease = 50
      },
      {
        type = "acid",
        percent = 20
      }
    },
    --collision_box = {{-0.7, -1}, {0.7, 1}},
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    --collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    --selection_box = {{-0.7, -1}, {0.7, 1}},
    --selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    selection_box = {{0, 0}, {0, 0}},
    damaged_trigger_effect = hit_effects.entity(),
    effectivity = 0.6,
    braking_power = "200kW",

    burner =
    {
      fuel_category = "chemical",
      effectivity = 1,
      fuel_inventory_size = 1,
      smoke =
      {
        {
          name = "car-smoke",
          deviation = {0.25, 0.25},
          frequency = 200,
          position = {0, 1.5},
          starting_frame = 0,
          starting_frame_deviation = 60
        }
      }
    },
    consumption = "150kW",
    friction = 2e-3,
    light =
    {
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {-0.6, -14},
        size = 2,
        intensity = 0.6,
        color = {r = 0.92, g = 0.77, b = 0.3}
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {0.6, -14},
        size = 2,
        intensity = 0.6,
        color = {r = 0.92, g = 0.77, b = 0.3}
      }
    },
    render_layer = "object",
    light_animation =
    {
      filename = "__base__/graphics/entity/car/car-light.png",
      priority = "low",
      blend_mode = "additive",
      draw_as_glow = true,
      width = 102,
      height = 84,
      line_length = 8,
      direction_count = 64,
      shift = util.by_pixel(0 + 2, -8 + 3),
      repeat_count = 2,
      hr_version =
      {
        filename = "__base__/graphics/entity/car/hr-car-light.png",
        priority = "low",
        blend_mode = "additive",
        draw_as_glow = true,
        width = 206,
        height = 162,
        line_length = 8,
        direction_count = 64,
        scale = 0.5,
        shift = util.by_pixel(-1 + 2, -6 + 3),
        repeat_count = 2,
      }
    },
    animation =
    {
      layers =
      {
        {
          priority = "low",
          width = 102,
          height = 86,
          frame_count = 2,
          direction_count = 64,
          shift = {0, -0.1875},
          animation_speed = 8,
          max_advance = 0.2,
          stripes =
          {
            {
              filename = "__base__/graphics/entity/car/car-1.png",
              width_in_frames = 2,
              height_in_frames = 22
            },
            {
              filename = "__base__/graphics/entity/car/car-2.png",
              width_in_frames = 2,
              height_in_frames = 22
            },
            {
              filename = "__base__/graphics/entity/car/car-3.png",
              width_in_frames = 2,
              height_in_frames = 20
            }
          },
          hr_version =
          {
            priority = "low",
            width = 201,
            height = 172,
            frame_count = 2,
            scale = 0.5,
            direction_count = 64,
            shift = util.by_pixel(0+2, -11.5+8.5),
            animation_speed = 8,
            max_advance = 0.2,
            stripes =
            {
              {
                filename = "__base__/graphics/entity/car/hr-car-1.png",
                width_in_frames = 2,
                height_in_frames = 11
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-2.png",
                width_in_frames = 2,
                height_in_frames = 11
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-3.png",
                width_in_frames = 2,
                height_in_frames = 11
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-4.png",
                width_in_frames = 2,
                height_in_frames = 11
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-5.png",
                width_in_frames = 2,
                height_in_frames = 11
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-6.png",
                width_in_frames = 2,
                height_in_frames = 9
              }
            }
          }
        },
        {
          priority = "low",
          width = 100,
          height = 75,
          frame_count = 2,
          apply_runtime_tint = true,
          direction_count = 64,
          max_advance = 0.2,
          line_length = 2,
          shift = {0, -0.171875},
          stripes = util.multiplystripes(2,
          {
            {
              filename = "__base__/graphics/entity/car/car-mask-1.png",
              width_in_frames = 1,
              height_in_frames = 22
            },
            {
              filename = "__base__/graphics/entity/car/car-mask-2.png",
              width_in_frames = 1,
              height_in_frames = 22
            },
            {
              filename = "__base__/graphics/entity/car/car-mask-3.png",
              width_in_frames = 1,
              height_in_frames = 20
            }
          }),
          hr_version =
          {
            priority = "low",
            width = 199,
            height = 147,
            frame_count = 2,
            apply_runtime_tint = true,
            scale = 0.5,
            axially_symmetrical = false,
            direction_count = 64,
            max_advance = 0.2,
            shift = util.by_pixel(0+2, -11+8.5),
            line_length = 1,
            stripes = util.multiplystripes(2,
            {
              {
                filename = "__base__/graphics/entity/car/hr-car-mask-1.png",
                width_in_frames = 1,
                height_in_frames = 13
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-mask-2.png",
                width_in_frames = 1,
                height_in_frames = 13
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-mask-3.png",
                width_in_frames = 1,
                height_in_frames = 13
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-mask-4.png",
                width_in_frames = 1,
                height_in_frames = 13
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-mask-5.png",
                width_in_frames = 1,
                height_in_frames = 12
              }
            })
          }
        },
        {
          priority = "low",
          width = 114,
          height = 76,
          frame_count = 2,
          draw_as_shadow = true,
          direction_count = 64,
          shift = {0.28125, 0.25},
          max_advance = 0.2,
          stripes = util.multiplystripes(2,
          {
            {
              filename = "__base__/graphics/entity/car/car-shadow-1.png",
              width_in_frames = 1,
              height_in_frames = 22
            },
            {
              filename = "__base__/graphics/entity/car/car-shadow-2.png",
              width_in_frames = 1,
              height_in_frames = 22
            },
            {
              filename = "__base__/graphics/entity/car/car-shadow-3.png",
              width_in_frames = 1,
              height_in_frames = 20
            }
          })
        }
      }
    },
    turret_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/car/car-turret.png",
          priority = "low",
          line_length = 8,
          width = 36,
          height = 29,
          frame_count = 1,
          direction_count = 64,
          shift = {0.03125, -0.890625},
          animation_speed = 8,
          hr_version =
          {
            priority = "low",
            width = 71,
            height = 57,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 64,
            shift = util.by_pixel(0+2, -33.5+8.5),
            animation_speed = 8,
            scale = 0.5,
            stripes =
            {
              {
                filename = "__base__/graphics/entity/car/hr-car-turret-1.png",
                width_in_frames = 1,
                height_in_frames = 32
              },
              {
                filename = "__base__/graphics/entity/car/hr-car-turret-2.png",
                width_in_frames = 1,
                height_in_frames = 32
              }
            }
          }
        },
        {
          filename = "__base__/graphics/entity/car/car-turret-shadow.png",
          priority = "low",
          line_length = 8,
          width = 46,
          height = 31,
          frame_count = 1,
          draw_as_shadow = true,
          direction_count = 64,
          shift = {0.875, 0.359375}
        }
      }
    },
    turret_rotation_speed = 0.35 / 60,
    sound_no_fuel =
    {
      {
        filename = "__base__/sound/fight/car-no-fuel-1.ogg",
        volume = 0.6
      }
    },
    stop_trigger_speed = 0.15,
    stop_trigger =
    {
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/car-breaks.ogg",
            volume = 0.2
          }
        }
      }
    },
    sound_minimum_speed = 0.25,
    sound_scaling_ratio = 0.8,
    vehicle_impact_sound = sounds.generic_impact,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/car-engine.ogg",
        volume = 0.67
      },
      activate_sound =
      {
        filename = "__base__/sound/car-engine-start.ogg",
        volume = 0.67
      },
      deactivate_sound =
      {
        filename = "__base__/sound/car-engine-stop.ogg",
        volume = 0.67
      },
      match_speed_to_activity = true
    },
    open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.5 },
    close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.4 },
    rotation_speed = 0.015,
    weight = 700,
    guns = { "vehicle-machine-gun" },
    inventory_size = 80,
    track_particle_triggers = movement_triggers.car,
    water_reflection = car_reflection(1)
  },
  {
    type = "unit-spawner",
    name = "spider-minion-spawner",
    icon = "__base__/graphics/icons/spitter-spawner.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "placeable-enemy", "not-repairable"},
    max_health = 350,
    order="b-d-b",
    subgroup="enemies",
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/creatures/spawner-spitter.ogg",
          volume = 0.6
        }
      }
    },
    dying_sound =
    {
      {
        filename = "__base__/sound/creatures/spawner-death-1.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/creatures/spawner-death-2.ogg",
        volume = 1.0
      }
    },
    resistances =
    {
      {
        type = "physical",
        decrease = 2,
        percent = 15
      },
      {
        type = "explosion",
        decrease = 5,
        percent = 15
      },
      {
        type = "fire",
        decrease = 3,
        percent = 60
      }
    },
    healing_per_tick = 0.02,
    collision_box = {{-3.2, -2.2}, {2.2, 2.2}},
    map_generator_bounding_box = {{-4.2, -3.2}, {3.2, 3.2}},
    selection_box = {{-3.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.biter(),
    pollution_absorption_absolute = 20,
    pollution_absorption_proportional = 0.01,
    corpse = "spitter-spawner-corpse",
    dying_explosion = "spitter-spawner-die",
    max_count_of_owned_units = 7,
    max_friends_around_to_spawn = 5,
    animations =
    {
      spawner_idle_animation(0, spitter_spawner_tint),
      spawner_idle_animation(1, spitter_spawner_tint),
      spawner_idle_animation(2, spitter_spawner_tint),
      spawner_idle_animation(3, spitter_spawner_tint)
    },
    integration = spawner_integration(),
    result_units = (function()
                     local res = {}
                     res[1] = {"small-biter", {{0.0, 0.3}, {0.35, 0}}}
                     res[2] = {"small-spitter", {{0.25, 0.0}, {0.5, 0.3}, {0.7, 0.0}}}
                     res[3] = {"medium-spitter", {{0.4, 0.0}, {0.7, 0.3}, {0.9, 0.1}}}
                     res[4] = {"big-spitter", {{0.5, 0.0}, {1.0, 0.4}}}
                     res[5] = {"behemoth-spitter", {{0.9, 0.0}, {1.0, 0.3}}}
                     return res
                   end)(),
    -- With zero evolution the spawn rate is 6 seconds, with max evolution it is 2.5 seconds
    spawning_cooldown = {360, 150},
    spawning_radius = 10,
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    -- distance_factor used to be 1, but Twinsen says:
    -- "The number or spitter spwners should be roughly equal to the number of biter spawners(regardless of difficulty)."
    -- (2018-12-07)
    autoplace = enemy_autoplace.enemy_spawner_autoplace(0),
    call_for_help_radius = 50,
    spawn_decorations_on_expansion = true,
    spawn_decoration =
    {
      {
        decorative = "light-mud-decal",
        spawn_min = 0,
        spawn_max = 2,
        spawn_min_radius = 2,
        spawn_max_radius = 5
      },
      {
        decorative = "dark-mud-decal",
        spawn_min = 0,
        spawn_max = 3,
        spawn_min_radius = 2,
        spawn_max_radius = 6
      },
      {
        decorative = "enemy-decal",
        spawn_min = 3,
        spawn_max = 5,
        spawn_min_radius = 2,
        spawn_max_radius = 7
      },
      {
        decorative = "enemy-decal-transparent",
        spawn_min = 4,
        spawn_max = 20,
        spawn_min_radius = 2,
        spawn_max_radius = 14,
        radius_curve = 0.9
      },
      {
        decorative = "muddy-stump",
        spawn_min = 2,
        spawn_max = 5,
        spawn_min_radius = 3,
        spawn_max_radius = 6
      },
      {
        decorative = "red-croton",
        spawn_min = 2,
        spawn_max = 8,
        spawn_min_radius = 3,
        spawn_max_radius = 6
      },
      {
        decorative = "red-pita",
        spawn_min = 1,
        spawn_max = 5,
        spawn_min_radius = 3,
        spawn_max_radius = 6
      },
      {
        decorative = "lichen-decal",
        spawn_min = 1,
        spawn_max = 2,
        spawn_min_radius = 2,
        spawn_max_radius = 7
      }
    }
  },
  {
    type = "assembling-machine",
    name = "termite-hive",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "termite-hive"},--todo consider not picking it up? mine empty? or destroy only?
    max_health = 300,
    corpse = "assembling-machine-1-remnants",
    dying_explosion = "assembling-machine-1-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    alert_icon_shift = util.by_pixel(-3, -12),
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1.png",
          priority="high",
          width = 108,
          height = 114,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, 2),
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1.png",
            priority="high",
            width = 214,
            height = 226,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, 2),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1-shadow.png",
          priority="high",
          width = 95,
          height = 83,
          frame_count = 1,
          line_length = 1,
          repeat_count = 32,
          draw_as_shadow = true,
          shift = util.by_pixel(8.5, 5.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1-shadow.png",
            priority="high",
            width = 190,
            height = 165,
            frame_count = 1,
            line_length = 1,
            repeat_count = 32,
            draw_as_shadow = true,
            shift = util.by_pixel(8.5, 5),
            scale = 0.5
          }
        }
      }
    },
    crafting_categories = {"termites-crafting"},
    crafting_speed = 1.0,
    energy_source =
    {
      type = "void",
      emissions_per_minute = 0,
      render_no_power_icon = true,
    },
    energy_usage = "75kW",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.5
        }
      },
      audible_distance_modifier = 0.5,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }
  },
  {
    type = "lab",
    name = "spider-research-lab",
    icon = "__base__/graphics/icons/lab.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "spider-research-lab"},
    max_health = 150,
    corpse = "lab-remnants",
    dying_explosion = "lab-explosion",
    --collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    on_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/lab/lab.png",
          width = 98,
          height = 87,
          frame_count = 33,
          line_length = 11,
          animation_speed = 1 / 3,
          shift = util.by_pixel(0, 1.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/lab/hr-lab.png",
            width = 194,
            height = 174,
            frame_count = 33,
            line_length = 11,
            animation_speed = 1 / 3,
            shift = util.by_pixel(0, 1.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/lab/lab-integration.png",
          width = 122,
          height = 81,
          frame_count = 1,
          line_length = 1,
          repeat_count = 33,
          animation_speed = 1 / 3,
          shift = util.by_pixel(0, 15.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/lab/hr-lab-integration.png",
            width = 242,
            height = 162,
            frame_count = 1,
            line_length = 1,
            repeat_count = 33,
            animation_speed = 1 / 3,
            shift = util.by_pixel(0, 15.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/lab/lab-light.png",
          blend_mode = "additive",
          draw_as_light = true,
          width = 106,
          height = 100,
          frame_count = 33,
          line_length = 11,
          animation_speed = 1 / 3,
          shift = util.by_pixel(-1, 1),
          hr_version =
          {
            filename = "__base__/graphics/entity/lab/hr-lab-light.png",
            blend_mode = "additive",
            draw_as_light = true,
            width = 216,
            height = 194,
            frame_count = 33,
            line_length = 11,
            animation_speed = 1 / 3,
            shift = util.by_pixel(0, 0),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/lab/lab-shadow.png",
          width = 122,
          height = 68,
          frame_count = 1,
          line_length = 1,
          repeat_count = 33,
          animation_speed = 1 / 3,
          shift = util.by_pixel(13, 11),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/lab/hr-lab-shadow.png",
            width = 242,
            height = 136,
            frame_count = 1,
            line_length = 1,
            repeat_count = 33,
            animation_speed = 1 / 3,
            shift = util.by_pixel(13, 11),
            scale = 0.5,
            draw_as_shadow = true
          }
        }
      }
    },
    off_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/lab/lab.png",
          width = 98,
          height = 87,
          frame_count = 1,
          shift = util.by_pixel(0, 1.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/lab/hr-lab.png",
            width = 194,
            height = 174,
            frame_count = 1,
            shift = util.by_pixel(0, 1.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/lab/lab-integration.png",
          width = 122,
          height = 81,
          frame_count = 1,
          shift = util.by_pixel(0, 15.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/lab/hr-lab-integration.png",
            width = 242,
            height = 162,
            frame_count = 1,
            shift = util.by_pixel(0, 15.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/lab/lab-shadow.png",
          width = 122,
          height = 68,
          frame_count = 1,
          shift = util.by_pixel(13, 11),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/lab/hr-lab-shadow.png",
            width = 242,
            height = 136,
            frame_count = 1,
            shift = util.by_pixel(13, 11),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/lab.ogg",
        volume = 0.7
      },
      audible_distance_modifier = 0.7,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    energy_source =
    {
      type = "fluid",
      emissions_per_minute = 0,
      render_no_power_icon = true,
      fluid_box =
      {
        base_area = 0.2,
        height = 1,
        base_level = 0,
        pipe_connections =
        {
        },
        production_type = "input",
        filter = "spider-labor"
      },
      burns_fluid = true,
      scale_fluid_usage = true,
      effectivity = 1,
    },
    --energy_usage = "75kW",
    energy_usage = "75W",--todo adapt? in case spider labor value changes
    researching_speed = 1,
    inputs = {"condensed-nutrient-paste"},
    --module_specification =
    --{
    --  module_slots = 2,
    --  module_info_icon_shift = {0, 0.9}
    --}
  },
})
