
func void ZS_Vino_Obesession()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Vino))
	{
		AI_TurnToNPC(self,DMT_Vino4);
		AI_UnequipWeapons(self);
	};
};

func int ZS_Vino_Obesession_Loop()
{
	if (Npc_IsDead(DMT_Vino4) || Npc_IsDead(Vino) || C_BodyStateContains(Vino, BS_ITEMINTERACT))
	{
		DMT_Vino1.start_aistate = ZS_Stand_Dementor;
		DMT_Vino2.start_aistate = ZS_Stand_Dementor;
		DMT_Vino3.start_aistate = ZS_Stand_Dementor;
		DMT_Vino4.start_aistate = ZS_Stand_Dementor;
		return LOOP_END;
	};

	if(Hlp_IsValidNpc(Vino)) && (Npc_GetDistToPlayer(Vino) < 3000)
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Vino))
		{
			AI_TurnToNPC(self,DMT_Vino4);
			Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_SuckEnergy_BloodFly",self,DMT_Vino4,0,0,0,FALSE);
			AI_PlayAni(self,"S_SUCKENERGY_VICTIM");
			return LOOP_END;
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino4))
		{
			AI_TurnToNPC(self,Vino);
			AI_PlayAni(self,"T_MAGRUN_2_MSDSHOOT");
			AI_PlayAni(self,"T_MSDSHOOT_2_STAND");
			return LOOP_END;
		}
		else
		{
			if (!C_BodyStateContains(self, BS_SIT))
			{
				AI_TurnToNPC(self,Vino);
				AI_PlayAniBS (self, "T_STAND_2_PRAY", BS_SIT);
			}
			else
			{
				AI_PlayAniBS (self, "T_PRAY_RANDOM", BS_SIT);
			};
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_Vino_Obesession_End()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Vino))
	{
		AI_StartState (self, ZS_Smoke_Joint, 0, "");
		Vino.start_aistate = ZS_Smoke_Joint;
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino4))
	{
		AI_StartState (self, ZS_Stand_Dementor, 0, "");
	}
	else
	{
		if (C_BodyStateContains(self, BS_SIT))
		{
			AI_PlayAni (self, "T_PRAY_2_STAND");
		};
		AI_StartState (self, ZS_Stand_Dementor, 0, "");
	};
};