
func int C_NpcIsDraconic(var C_Npc slf)
{
	if (slf.guild == GIL_DRAGON)
	|| (slf.guild == GIL_DRACONIAN)
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};
