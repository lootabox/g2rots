
// ****************************************************
// PrayIdol_S1
// --------------
// Funktion wird durch -Benutzung aufgerufen!
// *****************************************************
FUNC VOID PrayIdol_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE] = TRUE; 
		PLAYER_MOBSI_PRODUCTION	= MOBSI_PRAYIDOL;
		Ai_ProcessInfos (her);
	};
};


//*******************************************************
//	PrayIdol Dialog abbrechen
//*******************************************************
INSTANCE PC_PrayIdol_End (C_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_PrayIdol_End_Condition;
	information		= PC_PrayIdol_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_PrayIdol_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYIDOL)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PrayIdol_End_Info()
{
	B_ENDPRODUCTIONDIALOG ();
}; 
//*******************************************************
//	Beten
//*******************************************************
INSTANCE PC_PrayIdol_PrayIdol (C_Info)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PrayIdol_PrayIdol_Condition;
	information		= PC_PrayIdol_PrayIdol_Info;
	permanent		= TRUE;
	description		= NAME_ADDON_BETEN; //ADDON
};

FUNC INT PC_PrayIdol_PrayIdol_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	 ==	MOBSI_PRAYIDOL)
	{	
		return TRUE;
	};
};
	
FUNC VOID PC_PrayIdol_PrayIdol_Info()
{
	PrintScreen	("Shrine remains dormant.", -1,-1,FONT_Screen,3);
	// Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );
};

//*******************************************************
//	SchwertWeihe
//*******************************************************
INSTANCE PC_PrayShrine_UPGRATEBELIARSWEAPON (C_Info) 
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PrayShrine_UPGRATEBELIARSWEAPON_Condition;
	information		= PC_PrayShrine_UPGRATEBELIARSWEAPON_Info;
	permanent		= TRUE;
	description		= NAME_ADDON_UPGRATEBELIARSWEAPON; 
};

FUNC INT PC_PrayShrine_UPGRATEBELIARSWEAPON_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYIDOL)
	&& ((C_ScCanUpgrateBeliarsWeapon ()) == TRUE)
	&& ((C_ScHasBeliarsWeapon ()) == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PrayShrine_UPGRATEBELIARSWEAPON_Info()
{
	B_ClearBeliarsWeapon ();
	B_UpgrateBeliarsWeapon ();
}; 
