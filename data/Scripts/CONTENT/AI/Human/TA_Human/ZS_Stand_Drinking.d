// **********************
// NSC benutzt Item Booze
// **********************
 
func void ZS_Stand_Drinking ()
{
 	Perception_Set_Normal();
 	
 	B_ResetAll (self);
 
 	AI_SetWalkmode  (self,NPC_WALK);
  
 	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
 	{
 	 	AI_GotoWP (self, self.wp);
 	};
 	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	
	var int random;
	if(self.aivar[AIV_Gender] == FEMALE)
	{
		random = Hlp_Random(2);
		if(random == DRINK_Wine)
		{
			if(!Npc_HasItems(self,ItFo_Wine))
			{
				CreateInvItem(self,ItFo_Wine);
			};
			self.aivar[AIV_Food] = DRINK_Wine;
		}
		else
		{
			if(!Npc_HasItems(self,ItFo_Water))
			{
				CreateInvItem(self,ItFo_Water);
			};
			self.aivar[AIV_Food] = DRINK_Water;
		};
	}
	else if(self.guild == GIL_PIR)
	{
		random = Hlp_Random(2) + DRINK_Booze;
		if(random == DRINK_Rum)
		{
			if(!Npc_HasItems(self,ItFo_Addon_Rum))
			{
				CreateInvItem(self,ItFo_Addon_Rum);
			};
			self.aivar[AIV_Food] = DRINK_Rum;
		}
		else
		{
			if(!Npc_HasItems(self,ItFo_Booze))
			{
				CreateInvItem(self,ItFo_Booze);
			};
			self.aivar[AIV_Food] = DRINK_Booze;
		};
	}
	else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Randolph)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rukhar)))
	{
		if(!Npc_HasItems(self,ItFo_Beer))
		{
			CreateInvItem(self,ItFo_Beer);
		};
		self.aivar[AIV_Food] = DRINK_Beer;
	}
	else
	{
		random = Hlp_Random(2) + DRINK_Beer;
		if(random == DRINK_Booze)
		{
			if(!Npc_HasItems(self,ItFo_Booze))
			{
				CreateInvItem(self,ItFo_Booze);
			};
			self.aivar[AIV_Food] = DRINK_Booze;
		}
		else
		{
			if(!Npc_HasItems(self,ItFo_Beer))
			{
				CreateInvItem(self,ItFo_Beer);
			};
			self.aivar[AIV_Food] = DRINK_Beer;
		};
	};
};
 
func int ZS_Stand_Drinking_loop ()
{
 	if (Npc_IsOnFP (self, "STAND"))
 	{ 
 		AI_AlignToFP (self);
  		if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
  		{
  			self.aivar[AIV_TAPOSITION] = NOTINPOS;
  		};
 	} 
 	else if (Wld_IsFPAvailable(self,"STAND"))
 	{
 		AI_GotoFP   (self, "STAND");
  		AI_StandUp   (self);
  		AI_AlignToFP  (self);
  		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
 	}
 	else
 	{
  		AI_AlignToWP (self); 
  		if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK )
  		{
  			self.aivar[AIV_TAPOSITION] = NOTINPOS;
  		};  
 	}; 
 
 	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
 	{
		if(self.aivar[AIV_Food] == DRINK_Water)
		{
			AI_UseItemToState(self,ItFo_Water,0);
		};
		if(self.aivar[AIV_Food] == DRINK_Wine)
		{
			AI_UseItemToState(self,ItFo_Wine,0);
		};
		if(self.aivar[AIV_Food] == DRINK_Beer)
		{
			AI_UseItemToState(self,ItFo_Beer,0);
		};
		if(self.aivar[AIV_Food] == DRINK_Booze)
		{
			AI_UseItemToState(self,ItFo_Booze,0);
		};
		if(self.aivar[AIV_Food] == DRINK_Rum)
		{
			AI_UseItemToState(self,ItFo_Addon_Rum,0);
		};
  		self.aivar[AIV_TAPOSITION] = ISINPOS;
 	};
 
  
 //*****************************************************************************
 //--- SK:Hier werden random ANis gespielt. Normaler PlayAni resettet den BS, es
 //--- gab dann Probleme mit dem Abbrechen der Loop--> AI_PLayANIBS notwendig
 //*****************************************************************************
 
 	if ((Npc_GetStateTime(self) > 7)
 	&& (self.aivar[AIV_TAPOSITION] == ISINPOS))
 	{
  		var int random; random = Hlp_Random(10);
  
  		if (random == 0)
  		{
   			AI_PlayAniBS (self,"T_POTION_RANDOM_3",BS_ITEMINTERACT); //Flasche ansehen 
   			AI_PlayAniBS (self,"T_POTION_RANDOM_1",BS_ITEMINTERACT); //trinken
  		}
  		else if (random == 1) 
  		{
   			AI_PlayAniBS (self,"T_POTION_RANDOM_1",BS_ITEMINTERACT); //trinken
   			AI_PlayAniBS (self,"T_POTION_RANDOM_2",BS_ITEMINTERACT); //Mund abwischen
  		}
  		else
  		{
   			AI_PlayAniBS (self,"T_POTION_RANDOM_1",BS_ITEMINTERACT); //trinken
  		};  
  		Npc_SetStateTime (self, 0);
	};
 
	return LOOP_CONTINUE;
};
 

func void ZS_Stand_Drinking_end ()
{
	if(self.aivar[AIV_Food] == DRINK_Water)
	{
		AI_UseItemToState(self,ItFo_Water,-1);
	};
	if(self.aivar[AIV_Food] == DRINK_Wine)
	{
		AI_UseItemToState(self,ItFo_Wine,-1);
	};
	if(self.aivar[AIV_Food] == DRINK_Beer)
	{
		AI_UseItemToState(self,ItFo_Beer,-1);
	};
	if(self.aivar[AIV_Food] == DRINK_Booze)
	{
		AI_UseItemToState(self,ItFo_Booze,-1);
	};
	if(self.aivar[AIV_Food] == DRINK_Rum)
	{
		AI_UseItemToState(self,ItFo_Addon_Rum,-1);
	};
};
 





