// ***************************************************
//  	B_DragonKillCounter	(Setzt die Countervariable "MIS_KilledDragons", wieviele Drachen der SC schon getötet hat.)	
// ***************************************************
var int SwapDragnIsDead;
var int RckDragnIsDead;	
var int FreDragnIsDead; 	
var int IcDragnIsDead; 	
func int B_DragonKillCounter (var C_NPC current_dragon)
{
	var C_NPC Ravn; Ravn = Hlp_GetNpc (BDT_1090_Addon_Raven);
	if  ((Hlp_GetInstanceID (current_dragon)) == (Hlp_GetInstanceID (Ravn)))
	{
		if (RavenIsDead == FALSE)
		{
			PlayVideoEx	("EXTRO_RAVEN.BIK", TRUE,FALSE);
			RavenIsDead = TRUE;
			MIS_ReadyForChapter3  = TRUE; 	//Joly: Bei Levelchange ab hier in die Newworld  -> Kapitel 3!!!!!!
			B_RemoveNpc (Myxir_ADW);
		};
	};

	if (current_dragon.guild == GIL_DRAGON) 	 
	{
		var C_NPC SwapDragn; 	SwapDragn 		= Hlp_GetNpc(Dragon_Swamp);
		var C_NPC RckDragn; 	RckDragn 		= Hlp_GetNpc(Dragon_Rock); 
		var C_NPC FreDragn; 	FreDragn 		= Hlp_GetNpc(Dragon_Fire); 
		var C_NPC IcDragn; 		IcDragn 		= Hlp_GetNpc(Dragon_Ice);  

		if  ((Hlp_GetInstanceID (current_dragon)) == (Hlp_GetInstanceID (SwapDragn)))
		&& (SwapDragnIsDead == FALSE)
		{
			MIS_KilledDragons = (MIS_KilledDragons + 1);
			SwapDragnIsDead = TRUE;
			B_LogEntry(TOPIC_DRACHENJAGD,"I killed the dragon in the swamp west from the castle.");
		};
		
		if  ((Hlp_GetInstanceID (current_dragon)) == (Hlp_GetInstanceID (RckDragn)))
		&& (RckDragnIsDead == FALSE)
		{
			MIS_KilledDragons = (MIS_KilledDragons + 1);
			RckDragnIsDead = TRUE;
			B_LogEntry(TOPIC_DRACHENJAGD,"I killed the dragon that took over the old rock fortress to the south.");
		};
		
		if  ((Hlp_GetInstanceID (current_dragon)) == (Hlp_GetInstanceID (FreDragn)))
		&& (FreDragnIsDead == FALSE)
		{
			MIS_KilledDragons = (MIS_KilledDragons + 1);
			FreDragnIsDead = TRUE;
			B_LogEntry(TOPIC_DRACHENJAGD,"I defeated the dragon within the volcano!");
		};
	
		if  ((Hlp_GetInstanceID (current_dragon)) == (Hlp_GetInstanceID (IcDragn)))
		&& (IcDragnIsDead == FALSE)
		{
			MIS_KilledDragons = (MIS_KilledDragons + 1);
			IcDragnIsDead = TRUE;
			B_LogEntry(TOPIC_DRACHENJAGD,"I defeated the dragon in the western ice region!");
			if(Npc_IsDead(IceGolem_Sylvio1) && Npc_IsDead(IceGolem_Sylvio2))
			{
				if(!Npc_IsDead(DJG_Sylvio))
				{
					B_StartOtherRoutine(DJG_Sylvio,"IceDragon");
				};
				if(!Npc_IsDead(DJG_Bullco))
				{
					B_StartOtherRoutine(DJG_Bullco,"IceDragon");
				};
			};
		};
	};

	if (MIS_KilledDragons == 4)
	{
		MIS_AllDragonsDead = TRUE;

		// Biff hat den letzten Drachenkampf überlebt.
			
		if (DJG_BiffParty == TRUE)
			&& ((Npc_IsDead(Biff)) == FALSE)
			{
				DJG_BiffSurvivedLastDragon = TRUE;
			};
	};
	
	if (current_dragon.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
	{
		UndeadDragonIsDead = TRUE;
		
		Log_CreateTopic (TOPIC_BackToShip, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BackToShip, LOG_RUNNING);
		B_LogEntry (TOPIC_BackToShip, PRINT_DragKillCount); 

		AI_Teleport	(hero, "UNDEAD_ENDTELEPORT");	 

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			PlayVideoEx	("EXTRO_PAL.BIK", TRUE,FALSE);
		}
		else if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			PlayVideoEx	("EXTRO_DJG.BIK", TRUE,FALSE);
		}
		else
		{
			PlayVideoEx	("EXTRO_KDF.BIK", TRUE,FALSE);
		};
	};
};




