
func int C_NpcIsLarge(var C_Npc slf)
{
	if((C_NpcIsGolem(slf))
	|| (slf.guild == GIL_DEMON)
	|| (slf.guild == GIL_SUMMONED_DEMON)
	|| (slf.guild == GIL_TROLL)
	|| (slf.guild == GIL_DRAGON))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

