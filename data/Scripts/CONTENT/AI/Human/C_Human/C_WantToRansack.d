// ***************
// C_WantToRansack
// ***************

func int C_WantToRansack (var C_NPC slf)
{
	// ------ NPCTYPE_FRIEND plündert den Spieler nicht ------
	if (slf.npctype == NPCTYPE_FRIEND) && (Npc_IsPlayer(other))
	{
		return FALSE;
	};

	// Raven
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Raven))
	{
		return FALSE;
	};
	
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Garwig))
	{
		return TRUE;
	};
	
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Myxir_CITY))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(KDF_511_Daron))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Vatras))
	{
		return FALSE;
	};
	
	// ------ ausgenommene Gilden ------
	if (slf.guild == GIL_DMT)
	|| (slf.guild == GIL_ORC)
	|| (slf.guild == GIL_PAL)
	|| (slf.guild == GIL_KDF)
	|| (slf.guild == GIL_NOV)
	|| (slf.guild == GIL_KDW)
	{
		return FALSE;
	};
	
	return TRUE;
};
