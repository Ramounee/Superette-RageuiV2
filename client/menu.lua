

OpenMenu = false
local mainMenu = RageUI.CreateMenu("Magasin", "Achetez des objets ici", 0, 0, nil, nil, 0, 255, 255, 255)
local subMenu = RageUI.CreateSubMenu(mainMenu, "Nourritures", "Achetez de la nourriture")
local subBoisson = RageUI.CreateSubMenu(mainMenu, "Boissons", "Achetez des boissons")
local subDivers = RageUI.CreateSubMenu(mainMenu, "Divers", "Achetez des objets divers")
mainMenu.Closed = function()
    OpenMenu = false
end

function ShopMenu()
    if OpenMenu then
        OpenMenu = false
        RageUI.Visible(mainMenu, false)
        return
    else
        OpenMenu = true
        RageUI.Visible(mainMenu, true)


        CreateThread(function()
            while OpenMenu do
                Wait(1)

                RageUI.IsVisible(mainMenu, function()

                    RageUI.Button("Nourritures", nil, {RightLabel = "→"}, true, {}, subMenu)


                    RageUI.Button("Boissons", nil, {RightLabel = "→"}, true, {}, subBoisson)


                    RageUI.Button("Divers", nil, {RightLabel = "→"}, true, {}, subDivers)

                end)

                RageUI.IsVisible(subMenu, function()
                    for k,v in pairs(Config.Nourritures) do
                        RageUI.Button(v.nom, nil, {RightLabel = "~g~"..v.prix.."$"}, true, {
                            onSelected = function()
                                TriggerServerEvent('Ramoune:BuyItem', v)
                            end
                        })
                    end
                end)

                RageUI.IsVisible(subBoisson, function()
                    for k,v in pairs(Config.Boissons) do
                        RageUI.Button(v.nom, nil, {RightLabel = "~g~"..v.prix.."$"}, true, {
                            onSelected = function()
                                TriggerServerEvent('Ramoune:BuyItem', v)
                            end
                        })
                    end
                end)

                RageUI.IsVisible(subDivers, function()
                    for k,v in pairs(Config.Divers) do
                        RageUI.Button(v.nom, nil, {RightLabel = "~g~"..v.prix.."$"}, true, {
                            onSelected = function()
                                TriggerServerEvent('Ramoune:BuyItem', v)
                            end
                        })
                    end
                end)
            end
        end)
    end
end

