func int C_Beklauen (var int TheftDex, var int TheftGold)
{	
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == TRUE) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (TheftDex - Theftdiff))
	&& (NpcObsessedByDMT == FALSE)
	{
		if (Npc_IsInState (self, ZS_Talk))
			{
				if (TheftDex <= 20)
				{
					TheftDexGlob = 10; //"Kinderspiel" klappt immer
				}
				else
				{
					TheftDexGlob = TheftDex;
				};
				TheftGoldGlob = TheftGold;
			};
		return TRUE;
	};

};	
	
func void B_Beklauen ()
{	
	if (other.attribute[ATR_DEXTERITY] >= TheftDexGlob)
	{
		B_GiveInvItems (self, other, ItMi_Gold, TheftGoldGlob);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();//B_GivePlayerXP (XP_Ambient);
		Snd_Play ("Geldbeutel");
		B_LogEntry(Topic_PickPocket, ConcatStrings(self.name, PRINT_PickPocketSuccess));
	}
	else
	{
		//B_ResetThiefLevel();
		B_LogEntry(Topic_PickPocket, ConcatStrings(self.name, PRINT_PickPocketFailed));
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};	

//func int C_StealItems(var int TheftDex,var int Itm,var int Qty)
func int C_StealItem(var int TheftDex,var int itemInstance)
{
//	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (TheftDex - Theftdiff)) && (Npc_HasItems(self,Itm) >= Qty) && (NpcObsessedByDMT == FALSE))
	if (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (TheftDex - Theftdiff))
	&& (NpcObsessedByDMT == FALSE))
	&& (Npc_HasItems(self,itemInstance))
	{
		return TRUE;
	};
};

//func void B_StealItems(var int TheftDex,var int Itm,var int Qty)
func int B_StealItem(var int TheftDex,var int itemInstance)
{
	if(other.attribute[ATR_DEXTERITY] >= TheftDex)
	{
//		B_GiveInvItems(self,other,Itm,Qty);
		B_GiveInvItems(self,other,itemInstance,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		B_LogEntry(Topic_PickPocket, ConcatStrings(self.name, PRINT_PickPocketSuccess));
		return TRUE;
	}
	else
	{
		//B_ResetThiefLevel();
		B_LogEntry(Topic_PickPocket, ConcatStrings(self.name, PRINT_PickPocketFailed));
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
		return FALSE;
	};
};
