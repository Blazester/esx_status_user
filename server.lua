-------------------------------------------
-------- Creado por Blazester#8634 --------
-- Github - https://github.com/Blazester --
-------------------------------------------



Citizen.CreateThread(function()
	MySQL.ready(function ()
		print("ARTIC DEVELOPER | Ha iniciado con exito")
	end)
end)
function getIdentity(source)
    local identifier = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
    if result[1] ~= nil then
        local identity = result[1]

        return {
            identifier = identity['identifier'],
        }
    else
        return nil
    end
end
AddEventHandler('es:playerLoaded', function(source)
	local Identifier = GetPlayerIdentifiers(source)[1]
	local now = '1'
	MySQL.Async.execute('UPDATE `users` SET `online`=@now WHERE `identifier`=@identifier;', {['@identifier'] = Identifier, ['@now'] = now}, nil)
end)

AddEventHandler('playerDropped', function(reason)
	local Identifier = GetPlayerIdentifiers(source)[1]
	local now = '0'
    MySQL.Async.execute('UPDATE `users` SET `online`=@now WHERE `identifier`=@identifier;', {['@identifier'] = Identifier, ['@now'] = now}, nil)
end)


-------------------------------------------
-------- Creado por Blazester#8634 --------
-- Github - https://github.com/Blazester --
-------------------------------------------