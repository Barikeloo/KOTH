AddEventHandler("playerConnecting", function(name, callback, deferrals)
  print("[^5KOTH^7] " .. name .. " has joined the game.")
end)

RegisterNetEvent("KOTH:ClientInitialized")
AddEventHandler("KOTH:ClientInitialized", function(PTab)
  local player = source
  local name = GetPlayerName(player)
  print("[^5KOTH^7] " .. name .. " has been initialized, they are level " .. PTab.Level .. " and have " .. PTab.XP .. " XP.")
  KOTH.Players[player] = {
    Team = "No Team",
    Level = PTab.Level,
    XP = PTab.XP,
    Kills = PTab.Kills,
    Deaths = PTab.Deaths
  }
  TriggerClientEvent("KOTH:SyncTime", player, KOTH.Hour, KOTH.Minute)
  TriggerClientEvent("KOTH:SyncWeather", player, KOTH.Weather)
  if KOTH.CurrentMap ~= 0 then
    TriggerClientEvent("KOTH:SetMap", player, KOTH.CurrentMap)
    TriggerClientEvent("KOTH:MovePriorityCircle", player, KOTH.PrioCircle.Coords)
  end
end)

AddEventHandler("playerDropped", function (reason)
	local player = source
	local name = GetPlayerName(player)
	print("[^5KOTH^7] " .. name .. " left the game.")
  if KOTH.Players[player] ~= nil then
    if KOTH.Players[player].Team ~= "No Team" then
	     KOTH.Teams[KOTH.Players[player].Team].Players[player] = false
     end
     KOTH.Players[player] = nil
  end
  KOTH.GetPlayerCounts()
end)
