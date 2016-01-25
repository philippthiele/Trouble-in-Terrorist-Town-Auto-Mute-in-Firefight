local function MutePlayer(data)
  local playerToBeMuted = data:ReadEntity()
  playerToBeMuted:SetMuted(true)
  if LocalPlayer() == playerToBeMuted then
    ourMat = Material( "../gamemodes/terrortown/content/materials/vgui/ttt/glyph_muted" )
  end
  timer.Create( "MuteTimer", 15, 1, function()
     playerToBeMuted:SetMuted(false)
     ourMat = nil
   end )
end

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
