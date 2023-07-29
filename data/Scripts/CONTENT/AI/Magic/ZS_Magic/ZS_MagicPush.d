// For when damaged by DAM_FLY / DAM_BARRIER damage type
// https://forum.worldofplayers.de/forum/threads/1530507-Sicheres-wegsto%C3%9Fen-mit-DAM_FLY?p=25975970&viewfull=1#post25975970

FUNC VOID B_StopMagicPush ()
{
	Npc_ClearAIQueue (self);
	AI_Standup (self);

	if (self.guild < GIL_SEPERATOR_HUM)
	{
		Npc_SetTarget(self, other);
		B_AssessDamage();
	}
	else
	{
		Npc_SetTarget(self, other);
		Npc_SetTempAttitude(self, ATT_HOSTILE);
	};
};

FUNC VOID ZS_MagicPush ()
{
	//Npc_PercDisable	(self, PERC_ASSESSMAGIC);
};

FUNC INT ZS_MagicPush_Loop ()
{
	if (Npc_GetStateTime (self) > 1)
	{
		return LOOP_END;
	};

	AI_Wait (self, 1);
	return LOOP_CONTINUE;
};

FUNC VOID ZS_MagicPush_End ()
{
	B_StopMagicPush();
	//Npc_PercEnable(self, PERC_ASSESSDAMAGE, B_AssessMagic);
};
