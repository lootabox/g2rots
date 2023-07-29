// ************
// C_WantToFlee
// ************
	
func int C_WantToFlee (var C_NPC slf, var C_NPC oth)
{
 	//***FIXME***
 	return FALSE;
 	
 	// EXIT IF...
 	
 	// ------ Npctype_Friend flieht nie ------
	if (slf.npctype == NPCTYPE_FRIEND)
	{
		return FALSE;
	};
	
 	// ------ Partymember flieht nie ------
	if (slf.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return FALSE;
	};
 	
 	// ------ GateGuards fliehen nie ------
	if (C_NpcIsGateGuard (slf))
	{
		return FALSE;
	};
	
		
 	// FUNC 
	
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Randolph))
	&& (Npc_GetDistToWP(slf,"NW_FARM2_TO_TAVERN_06") <= 5000)
	{
		return TRUE;
	};

 	// ------ Flucht, wenn other VIEL stärker ist ------
 	if ((2*slf.level) < oth.level) 							
 	{
		return TRUE;
 	};
 	
	return FALSE;
};
 	
