function PlayerGetsHurt( victim, attacker )
	if attacker:IsPlayer() and engine.ActiveGamemode() == "terrortown" then
	  umsg.Start( "Mute Player" )
		umsg.Entity(victim)
	  umsg.End()
	end
end


hook.Add( "PlayerHurt", "PlayerGetsHurt", PlayerGetsHurt )

if SERVER then
   resource.AddFile("materials/VGUI/ttt/glyph_muted.vmt")
end
