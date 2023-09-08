GM = {}

GM.Log = function(text)
    print(("^2RZ-Gamemode^7 %s"):format(text))
end

GM.GetIdentifier = function(source, type)
    local identifiers = GetPlayerIdentifiers(source)
    for k,v in pairs (identifiers) do
        if type == "steam" then
            if string.sub(v, 1, string.len("steam:")) == "steam:" then
               return v
            end
        elseif type == "license" then
            if string.sub(v, 1, string.len("license:")) == "license:" then
                return v
             end
        elseif type == "discord" then
            if string.sub(v, 1, string.len("discord:")) == "discord:" then
                return v
            end
        elseif type == "ip" then
            if string.sub(v, 1, string.len("ip:")) == "ip:" then
                return v
            end
        end
    end
end