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
AddEventHandler('kwk-lockpick:client:openLockpick', function(callback, circles)
    lockpickCallback = callback
    exports['qb-lock']:StartLockPickCircle(total,circles) 
end)

function StartLockPickCircle(circles, seconds, callback)
    Result = nil
	print(circles, "This be the lock")
    NUI_status = true
    SendNUIMessage({
        action = 'start',
        value = circles,
		time = seconds,
    })
    while NUI_status do
        Wait(5)
        SetNuiFocus(NUI_status, false)
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
        --print('fail')
end)

RegisterNUICallback('success', function()
	Result = true
	Wait(100)
	NUI_status = false
    SetNuiFocus(false, false)
    print(Result)
    return Result
end)