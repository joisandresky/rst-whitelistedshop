local QBCore = exports['qb-core']:GetCoreObject()
local pedSpawned = false
local WhitelistShopPed = {}
local WhitelistShopZone = {}


RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    SetupWhitelistShopMenu()
end)
RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    deletePed()
end)
AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() ~= resource then return end
    SetupWhitelistShopMenu()
end)

local function createPeds()
    if pedSpawned then return end

    for k,v in pairs(Config.Locations) do
        if not WhitelistShopPed[k] then WhitelistShopPed[k] = {} end

        local current = "a_m_y_smartcaspat_01"
    
        RequestModel(current)
        while not HasModelLoaded(current) do
            Wait(0)
        end
    
        WhitelistShopPed[k] = CreatePed(0, current, v['location'].x, v['location'].y, v['location'].z-1, v['location'].w, false, false)
        TaskStartScenarioInPlace(WhitelistShopPed[k], "WORLD_HUMAN_STAND_MOBILE", 0, true)
        FreezeEntityPosition(WhitelistShopPed[k], true)
        SetEntityInvincible(WhitelistShopPed[k], true)
        SetBlockingOfNonTemporaryEvents(WhitelistShopPed[k], true)
        
        if v['isGang'] then
            exports['qb-target']:AddTargetEntity(WhitelistShopPed[k], {
                options = {
                    {
                        type = "client",
                        event = "rst-whitelistedshop:client:openWhiteListVehicleShop",
                        icon = 'fas fa-certificate',
                        label = "Open ".. v['label'],
                        gang = v['gang'],
                        isGang = v['isGang'],
                        shopLabel = v['label'],
                        defaultGarage = v['defaultGarage']
                    }
                },
                distance = 2.0
            })
        else
            exports['qb-target']:AddTargetEntity(WhitelistShopPed[k], {
                options = {
                    {
                        type = "client",
                        event = "rst-whitelistedshop:client:openWhiteListVehicleShop",
                        icon = 'fas fa-certificate',
                        label = "Open ".. v['label'],
                        job = v['job'],
                        shopLabel = v['label'],
                        defaultGarage = v['defaultGarage']
                    }
                },
                distance = 2.0
            })
        end
    end

    pedSpawned = true
end

local function deletePed()
    if pedSpawned then
        for k, v in pairs(WhitelistShopPed) do
            DeletePed(v)
        end
    end
end


function SetupWhitelistShopMenu()
    createPeds()
end

RegisterNetEvent('rst-whitelistedshop:client:openWhiteListVehicleShop', function(data)
    local xPlayer = QBCore.Functions.GetPlayerData()
    local VehicleShopMenus = {
        {
            header = data.shopLabel,
            icon = "fas fa-certificate",
            isMenuHeader = true
        },
    }
    local KeyName = data.job or data.gang
    for k,v in pairs(Config.Vehicles[KeyName]) do
        if not data.isGang and xPlayer.job.grade.level >= v['minGrade'] then
            VehicleShopMenus[#VehicleShopMenus+1] = {
                header = QBCore.Shared.Vehicles[v['name']].name,
                txt = "Price: $" .. v['price'],
                icon = "fa-solid fa-car",
                params = {
                    isServer = false,
                    event = "rst-whitelistedshop:client:openConfirmationMenu",
                    args = {
                        vehicleName = v['name'],
                        vehicleLabel = QBCore.Shared.Vehicles[v['name']].name,
                        vehiclePrices = v['price'],
                        defaultGarage = data.defaultGarage
                    }
                }
            }
        elseif data.isGang and xPlayer.gang.grade.level >= v['minGrade'] then
            VehicleShopMenus[#VehicleShopMenus+1] = {
                header = QBCore.Shared.Vehicles[v['name']].name,
                txt = "Price: $" .. v['price'],
                icon = "fa-solid fa-car",
                params = {
                    isServer = false,
                    event = "rst-whitelistedshop:client:openConfirmationMenu",
                    args = {
                        vehicleName = v['name'],
                        vehicleLabel = QBCore.Shared.Vehicles[v['name']].name,
                        vehiclePrices = v['price'],
                        defaultGarage = data.defaultGarage
                    }
                }
            }
        end
    end
    VehicleShopMenus[#VehicleShopMenus+1] = {
        header = "⬅ Close",
        txt = "",
        params = {
            event = "qb-menu:closeMenu"
        }
    }
    exports['qb-menu']:openMenu(VehicleShopMenus)
end)

RegisterNetEvent('rst-whitelistedshop:client:openConfirmationMenu', function(data)
    local ConfirmMenus = {
        {
            header = "Are You Sure Want To Buy ",
            icon = "fas fa-certificate",
            isMenuHeader = true
        },
        {
            header = data['vehicleLabel'],
            txt = "Price: $".. data['vehiclePrices'],
            disabled = true
        },
        {
            header = "⬅ No, Take Me Back",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
        {
            header = "Yes, Confirm",
            txt = "",
            params = {
                isServer = true,
                event = "rst-whitelistedshop:server:buyVehicle",
                args = {
                    vehicleName = data['vehicleName'],
                    vehicleLabel = data['vehicleLabel'],
                    vehiclePrices = data['vehiclePrices'],
                    defaultGarage = data['defaultGarage']
                }
            }
        }
    }
    exports['qb-menu']:openMenu(ConfirmMenus)
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end

    deletePed()
end)
