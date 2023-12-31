// B_RangerMeeting

func void B_MakeRangerReadyForMeeting (VAR C_NPC Ranger)	
{				
	CreateInvItems 	(Ranger, ITAR_RANGER_Addon_Broken, 1 );	
	//AI_UnequipArmor	(Ranger);
	AI_EquipArmor 	(Ranger, ITAR_RANGER_Addon_Broken);
	Ranger.npctype		= NPCTYPE_FRIEND;
};
func void B_MakeRangerReadyToLeaveMeeting (VAR C_NPC Ranger)	
{				
	//AI_UnequipArmor	(Ranger);
	//Npc_RemoveInvItems	(Ranger, ITAR_RANGER_Addon,	Npc_HasItems (Ranger, ITAR_RANGER_Addon ) );
	//Npc_RemoveInvItems	(Ranger, ITAR_RANGER_Addon_Broken,	Npc_HasItems (Ranger, ITAR_RANGER_Addon_Broken ) );
	//AI_EquipBestArmor (Ranger); //Joly:ITAR_RANGER_Addon_Broken wegen diesem hier, falls die Armor nicht gel�scht wurde.
	if(Hlp_GetInstanceID(Ranger) == Hlp_GetInstanceID(Martin))
	{
		AI_EquipArmor(Ranger,ITAR_MIL_L);
		Npc_RemoveInvItems	(Ranger, ITAR_RANGER_Addon_Broken,	Npc_HasItems (Ranger, ITAR_RANGER_Addon_Broken ) );
	};
	if(Hlp_GetInstanceID(Ranger) == Hlp_GetInstanceID(Lares))
	{
		AI_EquipArmor(Ranger,ITAR_Vlk_L);
		Npc_RemoveInvItems	(Ranger, ITAR_RANGER_Addon_Broken,	Npc_HasItems (Ranger, ITAR_RANGER_Addon_Broken ) );
	};
	if(Hlp_GetInstanceID(Ranger) == Hlp_GetInstanceID(Cord))
	{
		AI_EquipArmor(Ranger,ITAR_SLD_H);
		Npc_RemoveInvItems	(Ranger, ITAR_RANGER_Addon_Broken,	Npc_HasItems (Ranger, ITAR_RANGER_Addon_Broken ) );
	};
	if(Hlp_GetInstanceID(Ranger) == Hlp_GetInstanceID(Gaan))
	{
		AI_EquipArmor(Ranger,ITAR_Bau_L);
		Npc_RemoveInvItems	(Ranger, ITAR_RANGER_Addon_Broken,	Npc_HasItems (Ranger, ITAR_RANGER_Addon_Broken ) );
	};
	if(Hlp_GetInstanceID(Ranger) == Hlp_GetInstanceID(Orlan))
	{
		AI_EquipArmor(Ranger,ITAR_Bau_M);
		Npc_RemoveInvItems	(Ranger, ITAR_RANGER_Addon_Broken,	Npc_HasItems (Ranger, ITAR_RANGER_Addon_Broken ) );
	};
	if(Hlp_GetInstanceID(Ranger) == Hlp_GetInstanceID(Cavalorn))
	{
		if(MIS_Addon_Cavalorn_GetOrnamentFromPAL != FALSE)
		{
			AI_EquipArmor(Ranger,ITAR_Bau_L);
			Npc_RemoveInvItems	(Ranger, ITAR_RANGER_Addon_Broken,	Npc_HasItems (Ranger, ITAR_RANGER_Addon_Broken ) );
		};
	};
};
func void B_MakeRangerReadyForMeetingALL ()
{
	B_MakeRangerReadyForMeeting (Martin);
	B_MakeRangerReadyForMeeting (Lares);
	B_MakeRangerReadyForMeeting (Cord);
	B_MakeRangerReadyForMeeting (Gaan);
	B_MakeRangerReadyForMeeting (Orlan);
	B_MakeRangerReadyForMeeting (Cavalorn);
};
func void B_MakeRangerReadyToLeaveMeetingALL ()
{
	B_MakeRangerReadyToLeaveMeeting (Martin);
	B_MakeRangerReadyToLeaveMeeting (Lares);
	B_MakeRangerReadyToLeaveMeeting (Cord);
	B_MakeRangerReadyToLeaveMeeting (Gaan);
	B_MakeRangerReadyToLeaveMeeting (Orlan);
	B_MakeRangerReadyToLeaveMeeting (Cavalorn);
};
////////////////////////////////////////////////
//Ready
////////////////////////////////////////////////
func void B_Addon_Orlan_RangersReadyForComing ()
{
	if (MIS_Addon_Cavalorn_GetOrnamentFromPAL != 0)
	{
		B_StartOtherRoutine (Cavalorn,"PreRangerMeeting");
	};
		B_StartOtherRoutine (Martin, "PreRangerMeeting"); 
		B_StartOtherRoutine (Lares,"PreRangerMeeting");	 		
		B_StartOtherRoutine (Cord, "PreRangerMeeting"); 		
		B_StartOtherRoutine (Gaan,"PreRangerMeeting"); 			
};
////////////////////////////////////////////////
//Coming
////////////////////////////////////////////////
func void B_Addon_Orlan_ComingRanger ()
{
	if (MIS_Addon_Cavalorn_GetOrnamentFromPAL != 0)
	{
		B_StartOtherRoutine (Cavalorn,"RangerMeeting"); 		
	};
		B_StartOtherRoutine (Martin, "RangerMeeting"); 			
		B_StartOtherRoutine (Lares,"RangerMeeting");	 		
		B_StartOtherRoutine (Cord, "RangerMeeting"); 			
		B_StartOtherRoutine (Gaan,"RangerMeeting"); 			
		B_StartOtherRoutine	(Orlan,"RangerMeeting");			
		
		RangerMeetingRunning = LOG_RUNNING;
};
func VOID B_RangerMeetingParking () // im Lares dialog
{
	if (MIS_Addon_Cavalorn_GetOrnamentFromPAL != 0)
	{
		B_StartOtherRoutine	(Cavalorn,"Stadt"); //Joly:nicht parking. Der pl�ppt sonst bei Vat vat rein.			
	};
	
	B_StartOtherRoutine	(Orlan,"Parking");	
	
	Lares_HaltsMaul = TRUE;
	B_StartOtherRoutine	(Lares,"Parking"); 				

	B_StartOtherRoutine	(Cord,"Parking");					
	if ((Gaan.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		B_StartOtherRoutine	(Gaan,"Parking");}else{B_StartOtherRoutine	(Gaan,"Parking");					
	};
	if (MIS_Addon_Martin_GetRangar == 0)
	{
		B_StartOtherRoutine	(Martin,"Parking");}else{B_StartOtherRoutine (Martin,"Parking");
	};
};

func VOID B_SchlussMitRangerMeeting () //im Vatras dialog
{
	if (MIS_Addon_Cavalorn_GetOrnamentFromPAL != 0)
	{
		B_StartOtherRoutine	(Cavalorn,"Stadt"); 			
	};
	
	B_StartOtherRoutine	(Lares,"Start"); 				

	B_StartOtherRoutine	(Cord,"Start");					
	if ((Gaan.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		B_StartOtherRoutine	(Gaan,"PreStart");}else{B_StartOtherRoutine	(Gaan,"Start");					
	};
	if (MIS_Addon_Martin_GetRangar == 0)
	{
		B_StartOtherRoutine	(Martin,"PreStart");}else{B_StartOtherRoutine (Martin,"Start");
	};
	B_StartOtherRoutine	(Orlan,"Start");	
	Lares_HaltsMaul = LOG_OBSOLETE;			
};
