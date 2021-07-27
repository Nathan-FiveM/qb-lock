QBCore = nil

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(10)
        if QBCore == nil then
            TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)    
            Citizen.Wait(200)
        end
    end
end)

local Result = nil
local NUI_status = false

RegisterNetEvent('kwk-lockpick:client:openLockpick')
AddEventHandler('kwk-lockpick:client:openLockpick', function(circles, seconds, callback)
    lockpickCallback = callback
    exports['qb-lockpick']:StartLockPickCircle(circles, seconds, callback)
end)

function StartLockPickCircle(circles, seconds, callback)
    Result = nil
    NUI_status = true
    SendNUIMessage({
        action = 'start',
        value = circles,
		time = seconds,
    })
    while NUI_status do
        Wait(5)
        SetNuiFocus(NUI_status, NUI_status)
    end
    Wait(100)
    SetNuiFocus(false, false)
    lockpickCallback = callback
    return Result
end

RegisterNUICallback('fail', function()
	ClearPedTasks(PlayerPedId())
	Result = false
	Wait(100)
	NUI_status = false
end)

RegisterNUICallback('success', function()
	Result = true
	Wait(100)
	NUI_status = false
    SetNuiFocus(false, false)
    return Result
end)