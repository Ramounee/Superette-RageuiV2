
RegisterServerEvent('Ramoune:BuyItem')
AddEventHandler('Ramoune:BuyItem', function(v)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() >= v.prix then
        xPlayer.removeMoney(v.prix)
        xPlayer.addInventoryItem(v.nameItem, 1)
        xPlayer.showNotification("Vous avez acheté un(e) "..v.nom.." pour ~g~"..v.prix.."$")
    else
        xPlayer.showNotification("~r~Vous n'avez pas assez d'argent")
    end
end)


