
-- Blips

CreateThread(function()
    for k,v in pairs(Config.PositionShop) do
        local blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(blip, Config.BlipSprite)
        SetBlipColour(blip, Config.BlipColor)
        SetBlipScale(blip, Config.BlipScale)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.BlipName)
        EndTextCommandSetBlipName(blip)
    end
    while true do
        timer = 750
        local playerCoords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(Config.PositionShop) do
            local distance = #(playerCoords - vector3(v.x, v.y, v.z))
            if distance < Config.drawDistance then
                timer = 0
                DrawMarker(Config.TypeMarker, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.45, 0.45, 0.45, 255, 0, 0, 255, 55555, false, true, 2, false, false, false, false)
                if distance < Config.itrDistance then
                    ESX.ShowHelpNotification(Config.TextMarker)
                    if IsControlJustPressed(0, Config.KeyBindOpenMenu) then
                        ShopMenu()
                    end
                end
            elseif distance > 5.0 and distance < 15.0 then
                timer = 750
            end
        end
        Wait(timer)
    end
end)

