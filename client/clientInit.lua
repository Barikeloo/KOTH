Citizen.CreateThread(function()
	while true do
		Wait(0)
		if NetworkIsSessionStarted() then
			TriggerServerEvent('KOTH:ClientInitialized', {Level = KOTH.GetPlayerLevel(), XP = KOTH.GetPlayerXP(), Kills = KOTH.GetPlayerKills(), Deaths = KOTH.GetPlayerDeaths()})
			Citizen.Wait(1000)
			KOTH.SetNutral()
			if GetResourceKvpString("KOTH:Model") == nil then
				SetResourceKvp("KOTH:Model", "None")
			end
			TriggerEvent("KOTH:OpenStartUi")
			NetworkSetFriendlyFireOption(KOTH.FriendlyFire)
    	SetCanAttackFriendly(PlayerPedId(), true, true)
			return
		end
	end
end)
