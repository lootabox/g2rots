// Visualisierung: Schriftstück lesen -> 'self' zieht ein Stück Pergament aus der Tasche und wirft einen Blick drauf 

func void B_UseFakeScroll ()
{
	if ( C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp		(self);
		B_TurnToNpc	(self,	hero);
	};
	// ------ NSC steckt ggf. Waffe weg ------
	AI_RemoveWeapon (self);
	CreateInvItem		(self,	Fakescroll);
	var C_NPC target; target = Npc_GetLookAtTarget(self);
	if (Hlp_IsValidNpc(target)) //wenn ich irgendein lookAt-Target habe
	{
		B_StopLookAt (self);
		AI_UseItemToState	(self,	Fakescroll,	1);
		AI_Wait				(self,	1);
		AI_UseItemToState	(self,	Fakescroll,	-1);
		B_LookAtNpc (self, hero);
	}
	else
	{
		AI_UseItemToState	(self,	Fakescroll,	1);
		AI_Wait				(self,	1);
		AI_UseItemToState	(self,	Fakescroll,	-1);
	};
};

func void B_UseFakeHeroFace()
{
	var C_Npc target;
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,hero);
	};
	AI_RemoveWeapon(self);
	CreateInvItem(self,Fakeheroface);
	target = Npc_GetLookAtTarget(self);
	if(Hlp_IsValidNpc(target))
	{
		B_StopLookAt(self);
		AI_UseItemToState(self,Fakeheroface,1);
		AI_Wait(self,1);
		AI_UseItemToState(self,Fakeheroface,-1);
		B_LookAtNpc(self,hero);
	}
	else
	{
		AI_UseItemToState(self,Fakeheroface,1);
		AI_Wait(self,1);
		AI_UseItemToState(self,Fakeheroface,-1);
	};
};

func void B_UseFakeMap()
{
	var C_Npc target;
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,hero);
	};
	AI_RemoveWeapon(self);
	CreateInvItem(self,Fakemap);
	target = Npc_GetLookAtTarget(self);
	if(Hlp_IsValidNpc(target))
	{
		B_StopLookAt(self);
		AI_UseItemToState(self,Fakemap,1);
		AI_Wait(self,2);
		AI_UseItemToState(self,Fakemap,-1);
		B_LookAtNpc(self,hero);
	}
	else
	{
		AI_UseItemToState(self,Fakemap,1);
		AI_Wait(self,2);
		AI_UseItemToState(self,Fakemap,-1);
	};
};
