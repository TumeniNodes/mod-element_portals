local water_portal_params =  {
 fuel = "bucket:bucket_water 1",
 active_node = "liquid_portals:water_portal_active", 
 inactive_node = "liquid_portals:water_portal"
}

element_portals:create_private_portal_node("liquid_portals:water_portal", {
	description = "Water Portal",
	tiles = {
		{name="portal_water_anim.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0}}
	},
	is_ground_content = false,
	groups = {cracky=3}
}, water_portal_params)



minetest.register_node("liquid_portals:water_flowing", {
	description = "Flowing Water",
	inventory_image = minetest.inventorycube("default_water.png"),
	drawtype = "flowingliquid",
	tiles = {"default_water.png"},
	special_tiles = {
		{
			image="default_water_flowing_animated.png",
			backface_culling=false,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.8}
		},
		{
			image="default_water_flowing_animated.png",
			backface_culling=true,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.8}
		},
	},
	alpha = WATER_ALPHA,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "liquid_portals:water_flowing",
	liquid_alternative_source = "liquid_portals:water_portal_active",
	liquid_viscosity = WATER_VISC,
	freezemelt = "default:snow",
	post_effect_color = {a=64, r=100, g=100, b=200},
	groups = {water=3, liquid=3, puts_out_fire=1, not_in_creative_inventory=1, freezes=1, melt_around=1},
})


element_portals:create_private_portal_node("liquid_portals:water_portal_active", {
	description = "Active Water Portal",
	tiles = {
		{name="portal_water_anim_active.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0}}
	},
	
	alpha = WATER_ALPHA,
	paramtype = "light",
	liquidtype = "source",
	liquid_alternative_flowing = "liquid_portals:water_flowing",
	liquid_alternative_source = "liquid_portals:water_portal_active",

	post_effect_color = {a=64, r=100, g=100, b=200},
	groups = {cracky=3, puts_out_fire=1},
}, water_portal_params)


minetest.register_node("liquid_portals:lava_flowing", {
	description = "Flowing Lava",
	
	drawtype = "flowingliquid",
	tiles = {"default_lava.png"},
	special_tiles = {
		{
			image="default_lava_flowing_animated.png",
			backface_culling=false,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.3}
		},
		{
			image="default_lava_flowing_animated.png",
			backface_culling=true,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.3}
		},
	},

	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "liquid_portals:lava_flowing",
	liquid_alternative_source = "liquid_portals:lava_portal_active",
	liquid_viscosity = LAVA_VISC,
	liquid_renewable = false,
	damage_per_second = 4*2,
	post_effect_color = {a=192, r=255, g=64, b=0},
	groups = {lava=3, liquid=2, hot=3, igniter=1, not_in_creative_inventory=1},
})


local lava_portal_params =  {
 fuel = "bucket:bucket_lava 1",
 active_node = "liquid_portals:lava_portal_active", 
 inactive_node = "liquid_portals:lava_portal"
}

element_portals:create_private_portal_node("liquid_portals:lava_portal", {
	description = "Lava Portal",

	tiles = {
		{name="portal_lava_anim.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0}}
	},
	is_ground_content = false,
	groups = {cracky=3}

}, lava_portal_params  )

element_portals:create_private_portal_node("liquid_portals:lava_portal_active", {
	description = "Lava Portal Active",
	tiles = {
		{name="portal_lava_anim_active.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0}}
	},
	is_ground_content = false,
	groups = {cracky=3,hot=3, igniter=1},
	paramtype = "light",
	light_source = LIGHT_MAX - 1,
	liquidtype = "source",
	liquid_alternative_flowing = "liquid_portals:lava_flowing",
	liquid_alternative_source = "liquid_portals:lava_portal_active",
	liquid_renewable = false,
	post_effect_color = {a=192, r=255, g=64, b=0}
},  lava_portal_params )

