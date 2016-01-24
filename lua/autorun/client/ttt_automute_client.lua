local function MutePlayer(data)
  local playerToBeMuted = data:ReadEntity()
  playerToBeMuted:SetMuted(true)
  timer.Create( "MuteTimer", 15, 1, function() playerToBeMuted:SetMuted(false) end )
end

usermessage.Hook( "Mute Player", MutePlayer )
