GM.Players = {}


function GM:CreateUser(license, src)
    exports.mongodb:findOne({ collection="users", query = { license = license } }, function (success, result)
        if not success then
            return
        end
        if not result[1] then 
            exports.mongodb:count({ collection="users", query = {}, options = {}}, function(success, result) 
                exports.mongodb:insertOne({ collection="users", document = { license = license, firstName = "John", lastName = "Doe", position = nil, dead = false, status = {"hunger": 100, "thurst": 100}, sex = nil, height = 0, health = 150, armour = 0, dateofbirth = "00/00/00", money = GM.StartMoney, blackMoney = 0, bank = 0, credits = 0, inventory = json.encode(GM.ArrayStartItems), xp = 0, group = "user", valuables = json.encode(GM.ArrayStartValuables), skin = json.encode(GM.ArrayStartSkin), uuid = result + 1, weight = 0, weightMax = 40, job = "unemployed", jobRank = 0, crew = nil, crewRank = 0, role = "user", banarme = false, vehicleKeys = {} } }, function (success, result, insertedIds)
                    if not success then
                        return
                    end
                    GM.Log("User created. New ID: "..tostring(insertedIds[1]))
                    GM:LoadUser(license, src)
                end) 
            end)
        else 
            GM:LoadUser(license, src)
        end
    end)
end

function GM:LoadUser(license, src)
    exports.mongodb:findOne({ collection="users", query = { license = license } }, function (success, result)
        if not success then
            return
        end

        if result[1] then
            local data = result[1]
            GM.Players[src] = GM:CreateCharacter(result[1].license, result[1].firstName, result[1].lastName, result[1].position, result[1].dead, result[1].status, result[1].sex, result[1].height, result[1].health, result[1].armour, result[1].dateofbirth, result[1].money, result[1].blackMoney, result[1].bank, result[1].credits, result[1].inventory, result[1].xp, result[1].group, result[1].valuables, result[1].skin, result[1].uuid, result[1].weight, result[1].weightMax, result[1].job, result[1].jobRank, result[1].crew, result[1].crewRank, result[1].role, result[1].banarme, result[1].vehicleKeys)
            GM.Log("User loaded. License: "..license)
            Wait(100)
            TriggerClientEvent("gamemode:playerLoadedClient", src, GM.Players[src])
        end
    end)
end 

function GM:ManageUser(license, src)
    local source = src 
    if GM.Players[src] then return end
    GM.Players[src] = {}
    GM:CreateUser(license, source)
end

RegisterServerEvent('gamemode:playerLoaded')
AddEventHandler('gamemode:playerLoaded', function()
    local _source = source
	Citizen.CreateThread(function()
		local license = nil

        license = GM.GetIdentifier(_source, "license")

		if not license then
			DropPlayer(_source, "Your FiveM Account is not found, please link your Account FiveM to FiveM.")
		else
			GM:ManageUser(license, _source)
		end

		return
	end)
end)