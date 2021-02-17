local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPclient = Tunnel.getInterface("vRP", "FiveEMS-main") 
vRP = Proxy.getInterface("vRP")

for k,v in pairs(Config.ItemsVeh) do
  vRP.defInventoryItem({v.item,'Stretcher','En båre', function(args)

    local choices = {}
    choices['> Brug'] = {function(player,choice,mod)
        local user_id = vRP.getUserId({player})
        if user_id ~= nil then
          TriggerClientEvent('stretchermod:SpawnItem', player, k)
            vRP.tryGetInventoryItem({user_id,v.item, v.remove,true})
            vRP.closeMenu({player})
        end
    end}

    return choices
  end, 0.50})
end

RegisterServerEvent('stretchermod:DeleteVeh')
AddEventHandler('stretchermod:DeleteVeh', function(key)
  local source = source
  local xPlayer = vRP.getUserId({source})--ESX.GetPlayerFromId(source)
  local v = Config.ItemsVeh[tonumber(key)]
  if v ~= nil and v.remove ~= nil and v.remove > 0 then
    vRP.giveInventoryItem({user_id,v.item,v.remove,true})--xPlayer.addInventoryItem(v.item, v.remove)
  end
end)

RegisterCommand('delle', function(source, args, rawCommand, suggestions)
  local source = source 
  TriggerClientEvent("pNotify:SendNotification", source,{text = "Maddy sælger det til 100,- :KAPPA:", type = "error", queue = "global", timeout = 2000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
end)

RegisterCommand('jamesergay', function(source, args, rawCommand, suggestions)
  local source = source 
  TriggerClientEvent("pNotify:SendNotification", source,{text = "Ja, James er stærkt tiltrukket til mænd ", type = "error", queue = "global", timeout = 2000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
end)

RegisterCommand('butik', function(source, args, rawCommand, suggestions)
  local source = source 
  TriggerClientEvent("pNotify:SendNotification", source,{text = "Join discord: https://discord.gg/ymC7rJ7W6g ", type = "error", queue = "global", timeout = 10000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
end)
