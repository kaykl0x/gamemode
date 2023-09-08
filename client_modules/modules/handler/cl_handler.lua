GM = {}
GM.Spawned = false 
GM.Source = nil 
GM.Name = "John Doe"
GM.Group = "user"

-- Job and Orga --
-- GM.Job = {}
-- GM.Organization = {}

-- State -- 
GM.State = {}
GM.State.UUID = nil
GM.State.Job = nil
GM.State.JobRank = 0
GM.State.Organization = nil
GM.State.OrganizationRank = 0
GM.State.Position = vector3(0,0,0)
GM.State.Health = 0 
GM.State.Armor = 0

GM.State.Busy = 0

GM.State.PlayerCount = 0


-- Rank --
GM.Rank = 0 

-- Money --
GM.Money = nil 
GM.BlackMoney = nil
GM.Bank = nil 

-- Inventory --
GM.Inventory = {}
GM.Weight = 40

-- Token --
GM.Token = nil 

-- Hunger and Thirst --
GM.Soif = 100 
GM.Faim = 100 
GM.Death = false 

-- Skin 

GM.Skin = nil
GM.MaxPlayers = GetConvarInt('sv_maxclients', 48)

RegisterNetEvent("gamemode:playerLoadedClient")
AddEventHandler("gamemode:playerLoadedClient", function(player)

    local found = bool 
    local pPed = PlayerPedId()

    while not pPed do 
        pPed = PlayerPedId()
        Wait(100)
    end

    print("Player Loaded")
    print(json.encode(player))

end)

-- Citizen.CreateThread(function()
--     while true do 
--         Wait(1)
--         if IsEntityDead(PlayerPedId()) then 
--             GM.Death = true 
--         else 
--             GM.Death = false 
--         end
--     end
-- end)


-- function GM:Coma()
--     if GM.Death then 
--         SetEntityHealth(PlayerPedId(), 0)
--         FreezeEntityPosition(PlayerPedId(), true)
--         SetPedCanRagdoll(PlayerPedId(), false)
--         print("is Dead")
--         SetTimeout(5000, function()
--             GM.Death = false 
--         end)
--     end
-- end