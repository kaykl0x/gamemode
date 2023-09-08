-- RZ Version: 

-- Citizen.CreateThread(function()
--     while true do 
--         Citizen.Wait(100)
--         if NetworkIsSessionStarted() then 
--             exports.spawnmanager:setAutoSpawn(false)
--             TriggerServerEvent("gamemode:playerLoaded")
--             return
--         end
--         return 
--     end
-- end)



-- OU : 


Citizen.CreateThread(function()
    Citizen.Wait(0)
    if NetworkIsPlayerActive(PlayerId()) then
        exports.spawnmanager:setAutoSpawn(false)
        DoScreenFadeOut(0)
        TriggerServerEvent("gamemode:playerLoaded")
        return
    end
end)

Citizen.CreateThread(function()
	N_0x170f541e1cadd1de(false)
	NetworkSetFriendlyFireOption(true)

	while true do
		Citizen.Wait(4000)
		for _,i in pairs(GetActivePlayers()) do
			local ped = GetPlayerPed(i)
			if DoesEntityExist(ped) then
				SetCanAttackFriendly(ped, true, true)
			end
		end
	end
end)