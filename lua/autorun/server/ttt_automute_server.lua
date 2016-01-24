function PlayerGetsHurt( victim, attacker )
	if attacker:IsPlayer() then
	  umsg.Start( "Mute Player" )
		umsg.Entity(victim)
	  umsg.End()
	end
end

hook.Add( "PlayerHurt", "PlayerGetsHurt", PlayerGetsHurt )
