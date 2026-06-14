--- AIRGLASS
-- register airglass
core.register_node(":airthings:glass", {
	description = "Air Glass",
	drop = "air",
	paramtype = "light",
	sunlight_propagates = true,
	groups = { oddly_breakable_by_hand = 1, cracky = 1, stone = 1 }
})
-- turn airglass into an actual glass node
nodepth.connect_glass("airthings:glass", "air.png")
--- AIRPOSTER
-- register airposters
for postnum = 1, 16 do
	local postname = "airthings:post_" .. postnum
	local postovrd = ":" .. postname
	local postdesc = "Air Poster (thickness " .. postnum .. " )"
	local postdrop = "airthings:glass " .. postnum
	core.register_node(postovrd, {
		description = postdesc,
		drop = postdrop,
		tiles = {"air.png"},
		paramtype = "light",
		use_texture_alpha = true,
		walkable = false,
		groups = { oddly_breakable_by_hand = 1, cracky = 1, stone = 1 },
	})
	-- turn airposter into a 3d wallmounted node
	nodepth.wallmount(postname, postnum)
end
--- CRAFTS
-- register craft for airglass
core.register_craft({
	output = "airthings:glass",
	recipe = {{"air"}}
})
-- register craft for airposters
core.register_craft({
	output = "airthings:post_1",
	recipe = {{"airthings:glass"}}
})
for postnum = 2, 16 do
	local postname = "airthings:post_" .. postnum
	local lastnum = postnum - 1
	local lastpost = "airthings:post_" .. lastnum
	core.register_craft({
		output = postname,
		recipe = {{lastpost, "airthings:post_1"}}
	})
end