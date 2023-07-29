func void B_GiveStuntBonus_FUNC ()
{
	if 	(SC_MadeStunt == FALSE) && (MIS_Owen_FindMalcom >= LOG_RUNNING)
	{
		PrintScreen	(PRINT_Addon_StuntBonus, -1, 45, FONT_Screen, 2);
		B_GivePlayerXP (XP_STUNTBONUS);
		SC_MadeStunt = TRUE;
		Snd_Play ("THRILLJINGLE_01"); 
	};
};
