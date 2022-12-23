ESX = nil
blips = {}
cars = {}
 Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    PlayerData = ESX.GetPlayerData()
    done = true
end)



function AddBlip(entity)
	
		local blip = AddBlipForEntity(entity)
		SetBlipSprite (blip, Config.BlipSprite)
		SetBlipScale  (blip, Config.BlipScale)
		SetBlipColour (blip, Config.BlipColour)
		--SetBlipDisplay(blip,10)
	
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.BlipName)
		EndTextCommandSetBlipName(blip)
	
		
		table.insert(blips,blip)

		
end

Citizen.CreateThread(function()
while(true) do

Citizen.Wait(500)

for i,v in pairs(blips) do
	RemoveBlip(v)
end

for vehicles in EnumerateVehicles() do


local model = GetEntityModel(vehicles)
local modelName = GetDisplayNameFromVehicleModel(model)
local hasBlip = false


for i,v in pairs(Config.Cars) do


	if modelName == string.upper(v) then
		if ESX.GetPlayerData().job.name == "police" then
      
			AddBlip(vehicles)

		else
			for i,b in pairs(blips) do
		RemoveBlip(b)
			end
		end

	end
	

end
end
end
end)