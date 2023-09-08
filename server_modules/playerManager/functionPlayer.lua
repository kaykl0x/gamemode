function GM:SavePlayer(src, disconnect)
    local PLAYER = GM:GetPlayerFromId(src)

    if PLAYER then 
        exports.mongodb:updateOne({
            collection = "users",
            query = { license = PLAYER.license },
            update = {
                ["$set"] = {
                    firstName = PLAYER.firstName,
                    lastName = PLAYER.lastName,
                    position = PLAYER.position,
                    dead = PLAYER.dead,
                    status = PLAYER.status, 
                    sex = PLAYER.sex,
                    height = PLAYER.height,
                    health = PLAYER.health,
                    armour = PLAYER.armour,
                    dateofbirth = PLAYER.dateofbirth,
                    money = PLAYER.money,
                    blackMoney = PLAYER.blackMoney,
                    bank = PLAYER.bank,
                    credits = PLAYER.credits,
                    inventory = json.encode(PLAYER.inventory),
                    xp = PLAYER.xp,
                    group = PLAYER.group,
                    valuables = json.encode(PLAYER.valuables),
                    skin = json.encode(PLAYER.skin),
                    uuid = PLAYER.uuid,
                    weight = PLAYER.weight,
                    weightMax = PLAYER.weightMax,
                    job = PLAYER.job,
                    jobRank = PLAYER.jobRank,
                    crew = PLAYER.crew,
                    crewRank = PLAYER.crewRank,
                    role = PLAYER.role,
                    banarme = PLAYER.banarme,
                    vehicleKeys = PLAYER.vehicleKeys
                }
            }
        })
        Wait(1000)
        if disconnect then 
            GM.Players[src] = nil
        end
    end
end

function GM:SaveLoop()
    Wait(10000)
    Citizen.CreateThread(function()
        while true do 
            for k,v in pairs(GM.Players) do 
                GM:SavePlayer(k)
            end
            Wait(2000)
        end
    end)
end