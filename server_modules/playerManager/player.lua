function GM:CreateCharacter(license, firstName, lastName, position, dead, status, sex, height, health, armour, dateofbirth, money, blackMoney, bank, credits, inventory, xp, groupe, valuables, skin, uuid, weight, weightMax, job, jobRank, crew, crewRank, role, banarme, vehicleKeys)
    local self = {}

    self.license = license
    self.firstName = firstName
    self.lastName = lastName
    self.position = position
    self.dead = dead
    self.status = status 
    self.sex = tonumber(sex)
    self.height = tonumber(height)
    self.health = tonumber(health)
    self.armour = tonumber(armour)
    self.dateofbirth = dateofbirth
    self.money = tonumber(money)
    self.blackMoney = tonumber(blackMoney)
    self.bank = tonumber(bank)
    self.credits = tonumber(credits)
    self.inventory = inventory
    self.xp = tonumber(xp)
    self.group = groupe
    self.valuables = valuables
    self.skin = skin
    self.uuid = tonumber(uuid)
    self.weight = tonumber(weight)
    self.weightMax = tonumber(weightMax)
    self.job = job
    self.jobRank = jobRank
    self.crew = crew
    self.crewRank = crewRank
    self.role = role
    self.banarme = banarme
    self.vehicleKeys = vehicleKeys

    -- Utils --
    self.getLicense = function()
        return self.license
    end

    self.getFirstName = function()
        return self.firstName
    end

    self.getLastName = function()
        return self.lastName
    end

    self.getFullName = function()
        return self.firstName.." "..self.lastName
    end

    self.getPosition = function()
        return self.position
    end

    self.getDead = function()
        return self.dead
    end

    self.getStatus = function()
        return self.status
    end

    -- Money --
    self.addMoney = function(amount)
        if amount > 0 then
            self.money = self.money + amount
        end
    end

    self.removeMoney = function(amount)
        if amount > 0 then 
            local previewMoney = self.money - amount
            if previewMoney >= 0 then
                self.money = previewMoney
            end
        end
    end

    self.getMoney = function()
        return self.money
    end

    -- Credits -- 
    self.addCredits = function(amount)
        if amount > 0 then
            self.credits = self.credits + amount
        end
    end

    self.removeCredits = function(amount)
        if amount > 0 then 
            local previewCredits = self.credits - amount
            if previewCredits >= 0 then
                self.credits = previewCredits
            end
        end
    end

    self.getCredits = function()
        return self.credits
    end

    -- XP 
    self.addXP = function(amount)
        if amount > 0 then
            self.xp = self.xp + amount
        end
    end

    self.removeXP = function(amount)
        if amount > 0 then 
            local previewXP = self.xp - amount
            if previewXP >= 0 then
                self.xp = previewXP
            end
        end
    end

    -- Admin / Moderations -- 
    self.getGroup = function()
        return self.group
    end

    self.isAdmin = function()
        if self.group == "admin" or self.group == "superadmin" or self.groupe == "owner" then
            return true
        else
            return false
        end
    end

    self.setGroup = function(group)
        if groupe ~= nil then 
            self.group = group
        end
    end

    --Inventory--
    self.getInventory = function()
        return self.inventory
    end

    -- self.getInventoryWeight = function()
    --     local inventory = self.getInventory()
    --     local count = 0 
    --     for k,v in pairs(inventory) do
    --         count = count + (v.count * v.item.weight)
    --     end
    --     return self.weight
    -- end

    self.getInventoryWeightMax = function()
        return self.weightMax
    end

    self.getInventoryItem = function(item)
        for k,v in pairs(self.inventory) do
            if v.item == item then
                return v
            end
        end
    end

    self.addInventoryItem = function(item, count, label, type, data)
        local HasItem, Id = self.getInventoryItem(item)

        if HasItem then 
            HasItem.count = HasItem.count + count
        else
            table.insert(self.inventory, {item = item, count = count, label = name and name, type = type and type or "item", data = data and data or {}})
        end
    end

    self.removeInventoryItem = function(item, count)
        local HasItem, Id = self.getInventoryItem(item)

        if HasItem then 
            HasItem.count = HasItem.count - count
            if HasItem.count == 0 then
                table.remove(self.inventory, Id)
            end
        end
    end

    self.getRole = function()
        return self.role
    end

    self.getUUID = function()
        return self.uuid
    end

    return self
end

function GM:GetPlayerFromId(src)
    if GM.Players[src] then
        return GM.Players[src]
    else 
        return nil
    end
end

function GM:GetPlayerFromIdentifier(license)
    for k,v in pairs(GM.Players) do
        if v.license == license then
            return v
        end
    end
end

function GM:GetPlayers()
    local sources = {}
    for k,v in pairs(GM.Players) do
        table.insert(sources, k)
    end

    return sources
end