-- lazy check to see if they have it 
local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime;
	if timer >= 120 then
		for _,player in pairs(minetest.get_connected_players()) do
             local name = player:get_player_name()
             local pinv = player:get_inventory()
           
             for _,musthaveitem in ipairs(musthave.get(name)) do
                 local isfound = false
                 local stack = ItemStack(musthaveitem)
                 if pinv:contains_item("main", stack) then
                 else
                    if pinv:room_for_item("main", stack) then
                        pinv:add_item("main", stack)
                    else
                        pinv:set_wielded_item(stack)
                    end
                 end	
             end  -- next
        end  -- next
		timer = 0
	end
end)

musthave = {}
musthave.players = {}
musthave.get = function (playername)
    if musthave.players[playername] == nil then
        musthave.players[playername] = {}
    end

    if #musthave.players[playername] == 0 then
        local s = minetest.setting_get("musthave")
        if s ~= nil and s ~= "" then
            musthave.set(playername, s:split(","))
        end
    end

    return musthave.players[playername]
end

musthave.set = function (playername, listofitems)   
    musthave.players[playername] = listofitems
end


