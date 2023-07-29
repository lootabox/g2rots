
func int C_NpcIgnoresTransform(var C_Npc slf)
{
	if (slf.guild == GIL_DMT)
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN)
	|| (slf.guild == GIL_DEMON)
	|| (slf.guild == GIL_Gargoyle)
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_WISP)
	{
		return TRUE;
	}
	else if (C_NpcIsUndead(slf))
	{
		return TRUE;
	}
	else if (C_NpcIsDraconic(slf))
	{
		return TRUE;
	}
	else if (C_NpcIsGolem(slf))
	{
		return TRUE;
	};

	return FALSE;
};

