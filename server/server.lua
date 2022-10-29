local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("rst-whitelistedshop:server:buyVehicle")
AddEventHandler("rst-whitelistedshop:server:buyVehicle", function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    print(data['vehicleName'])
    local existVehicle = MySQL.Sync.fetchScalar('SELECT vehicle FROM player_vehicles WHERE citizenid = ? AND vehicle = ?', {Player.PlayerData.citizenid, data['vehicleName']})

    if existVehicle then
        TriggerClientEvent("QBCore:Notify", Player.PlayerData.source, "You Already Purchase this Vehicle!")
    else
        local vehicle = {
            ['vehicleName'] = data['vehicleName'],
            ['vehicleLabel'] = data['vehicleLabel'],
            ['vehiclePrices'] = data['vehiclePrices'],
            ['defaultGarage'] = data['defaultGarage'],
        }
        GiveVehicle(Player.PlayerData.source, vehicle)
    end

end)

function GeneratePlate()
    local plate = QBCore.Shared.RandomInt(1) .. "PD" .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(2)
    local result = MySQL.Sync.fetchScalar('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    if result then
        return GeneratePlate()
    else
        return plate:upper()
    end
end

function GiveVehicle(source, vehicleData)
    local src = source
    local vehicle = vehicleData['vehicleName']
    local pData = QBCore.Functions.GetPlayer(src)
    local cid = pData.PlayerData.citizenid
    local plate = GeneratePlate()
    
    if Config.UseSociety then
        local societyBalance = exports['qb-management']:GetAccount(pData.PlayerData.job.name)
        
        if societyBalance >= vehicleData['vehiclePrices'] then
            MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state, garage) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
                pData.PlayerData.license,
                cid,
                vehicle,
                GetHashKey(vehicle),
                '{}',
                plate,
                1,
                vehicleData['defaultGarage']
            })
            exports['qb-management']:RemoveMoney(pData.PlayerData.job.name, vehicleData['vehiclePrices'])
            TriggerEvent('qb-log:server:CreateLog', 'bossmenu', "Job Vehicle Shop", 'pink', "[" .. pData.PlayerData.job.label .. "] Successfully Pay Vehicle for $" .. vehicleData['vehiclePrices'] .. ' Vehicle: ' ..vehicleData['vehicleLabel'])
            TriggerClientEvent("QBCore:Notify", src, "Congrats of Your Purchase! Check your Office Garage.")
        else
            TriggerClientEvent("QBCore:Notify", src, "Your Office Can't Afford to bought the Vehicle!", "error")
        end
    else
        local playerMoney = pData.PlayerData.money.bank
        if playerMoney >= vehicleData['vehiclePrices'] then
            MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state, garage) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
                pData.PlayerData.license,
                cid,
                vehicle,
                GetHashKey(vehicle),
                '{}',
                plate,
                1,
                vehicleData['defaultGarage']
            })
            pData.Functions.RemoveMoney('bank', vehicleData['vehiclePrices'])
            TriggerClientEvent("QBCore:Notify", src, "Congrats of Your Purchase! Check your Office Garage.")
        else
            TriggerClientEvent("QBCore:Notify", src, "You Can't Afford this Vehicle, Check Your Bank Account!", "error")
        end
    end
end