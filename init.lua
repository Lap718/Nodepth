nodepth = {}
nodepth.wallmount = function(nodename, depth) 
	local nodemesh = "depth" .. depth .. ".obj"
	core.override_item(nodename, {
		drawtype = "mesh",
		paramtype2 = "wallmounted",
		mesh = "depth2.obj",
	})

end
nodepth.connect_glass = function(nodename, frametile)
	local detile = frametile .. "^frame.png^[makealpha:0,0,0"
	local nodetiles = { frametile, detile }
	core.override_item(nodename, {
		drawtype = "glasslike_framed_optional",
		tiles = nodetiles,
	})
end
if core.settings:get("nodepth_air_things") then
	dofile(core.get_modpath("nodepth").."/example.lua")
end