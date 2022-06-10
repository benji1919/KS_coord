ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterCommand('pos1', function(source, args, rawCommand)
	local coords = GetEntityCoords(PlayerPedId())
	SendNUIMessage({
		coords = ""..coords.x..","..coords.y..","..coords.z..""
	})
end)

RegisterCommand('pos', function(source, args, rawCommand)
	if tonumber(args[1]) ~= nil and tonumber(args[2]) ~= nil and tonumber(args[3]) ~= nil then
	local posx = tonumber(args[1])
	local posy = tonumber(args[2])
	local posz = tonumber(args[3])
	local coords = { x = posx, y = posy, z = posz}
	ESX.Game.Teleport(PlayerPedId(), coords)
	end
	end)


--[[RegisterCommand('tpc', function(source, args, rawCommand)
	local coords = {}
	for coord in string.gmatch(args[1] or "0,0,0","[^,]+") do
		table.insert(coords,tonumber(coord))
	end

	local x,y,z = 0,0,0
	if coords[1] ~= nil then x = coords[1] end
	if coords[2] ~= nil then y = coords[2] end
	if coords[3] ~= nil then z = coords[3] end

	SetEntityCoords(GetPlayerPed(-1), x,y,z, false)
end)]]