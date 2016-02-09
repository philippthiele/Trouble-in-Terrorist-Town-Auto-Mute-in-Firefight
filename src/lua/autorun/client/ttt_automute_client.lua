local allTimers = {}

local function MutePlayer(data)
	local playerToBeMuted = data:ReadEntity()
		if not playerToBeMuted:IsMuted() then

		if LocalPlayer() == playerToBeMuted then
			ourMat = Material( "VGUI/ttt/glyph_muted" )
				if not timer.Exists("MuteTimer") then
				timer.Create("MuteTimer", 15, 1, function()
					ourMat = nil
				end )
			end
		else
		  playerToBeMuted:SetMuted(true)
		end

		local id = "MuteTimer" .. tostring(os.time())
		local entry = {id,playerToBeMuted}
		table.insert(allTimers, entry)
		timer.Create(id, 15, 1, function()
			if playerToBeMuted:IsMuted() and LocalPlayer() ~= playerToBeMuted then
			   playerToBeMuted:SetMuted(false)
			   table.remove(allTimers,1)
			end
		 end )
	end
end

function TTTEndRound(result)
	for _,player in ipairs(player.GetAll()) do
		if player:IsMuted() then
			 player:SetMuted(false)
			 ourMat = nil
		end
	end
end


hook.Add( "TTTEndRound", "EndRoundDeleteTimers", TTTEndRound )
hook.Add( "TTTPrepareRound", "EndRoundDeleteTimers", TTTEndRound )

usermessage.Hook( "Mute Player", MutePlayer )

hook.Add( "HUDPaint", "MutedIconPaint", function()
  if ourMat then
	if math.floor(RealTime()%2) == 0 then
	surface.SetDrawColor( 255, 255, 255, 255 )
	else
	surface.SetDrawColor( 255, 55, 55, 255 )
	end
	surface.SetMaterial( ourMat	)
	surface.DrawTexturedRect( 10, ScrH()-210, 64, 64 )
  end
end )
