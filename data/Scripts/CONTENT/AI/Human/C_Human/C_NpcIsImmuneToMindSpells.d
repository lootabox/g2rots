func int C_NpcIsImmuneToMindSpells(var C_Npc slf)
{
	// Mages, paladins and seekers (not hero)
	if (!Npc_IsPlayer(slf))
	&& ((slf.guild == GIL_KDF)
	|| (slf.guild == GIL_PAL)
	|| (slf.guild == GIL_DMT)
	|| (slf.guild == GIL_KDW)
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Xardas))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Vatras))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Myxir_CITY))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(KDF_511_Daron)))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};
