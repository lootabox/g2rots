// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                         @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@        F E A R          @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                         @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



// **************************************
// B_StopMagicSleep
// ----------------
// wird aus ZS_MAgicSleep_loop aufgerufen
// wenn SPL_Time_Sleep vorbei ist
// **************************************

func int B_StopMagicFlee()
{
	Npc_PercDisable	(self,	PERC_ASSESSDAMAGE);
	Npc_PercDisable	(self,	PERC_ASSESSMAGIC);

	Npc_ClearAIQueue	(self);
	B_ClearPerceptions	(self);
	Npc_SetTarget 		(self, hero);
	AI_TurnToNpc		(self, hero);
	AI_PlayAni			(self, "T_WARN");
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		AI_StartState(self,ZS_Attack,0,"");
	}
	else
	{
		AI_StartState(self,ZS_MM_Attack,0,"");
	};
};

// *************
// ZS_MagicSleep
// *************

func void ZS_MagicFlee ()
{

	// Check, since Spell_Fear triggers this without any pre-check
	if(self.guild > GIL_SEPERATOR_HUM)
	{
		if(C_NpcIsLarge(self) || C_NpcIsGolem(self) || C_NpcIsUndead(self))
		{
			AI_ContinueRoutine(self);
			return;
		};
	};
	if (C_NpcIsImmuneToMindSpells(self))
	{
		if (self.guild != GIL_DMT)
		{
			// Add flavor comment for mages/pals
			B_Say(self,other,"$ISAIDSTOPMAGIC");
		};
		AI_ContinueRoutine(self);
		return;
	};

	// If not already set, use default duration
	if (!Buff_Has(self, fear_buff))
	{
		Print("secondary apply");
		fear_buff_apply(self, SPL_TIME_Fear);
	};

	Npc_PercEnable		(self,	PERC_ASSESSDAMAGE, 		B_StopMagicFlee);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC,		B_AssessMagic);	

	// ------ Guardpassage resetten ------
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	
	// ------ RefuseTalk Counter resetten -----
	Npc_SetRefuseTalk(self,0);
	
	// ------ Temp_Att (upset) "resetten" ------
	Npc_SetTempAttitude(self, Npc_GetPermAttitude(self,hero));

	// ------ Bewegungs-Overlays resetten ------	
	B_StopLookAt	(self);
	AI_StopPointAt	(self);

	if (!Npc_HasBodyFlag(self, BS_FLAG_INTERRUPTABLE))
	{
		AI_StandUp (self);
	}
	else
	{
		AI_StandUpQuick (self);
	};

	B_ValidateOther();
	if (!Hlp_IsValidNpc(other)) {
		Npc_SetTarget(self, hero);
	};

	AI_SetWalkmode 		(self, NPC_RUN);

	if (self.guild < GIL_SEPERATOR_HUM)
	{
		var int randy; randy = Hlp_Random (3);
		if (randy == 0)		{		AI_PlayAniBS (self,	"T_STAND_2_FEAR_VICTIM1",	 BS_STAND);		};
		if (randy == 1)		{		AI_PlayAniBS (self,	"T_STAND_2_FEAR_VICTIM2",	 BS_STAND);		};
		if (randy == 2)		{		AI_PlayAniBS (self,	"T_STAND_2_FEAR_VICTIM3",	 BS_STAND);		};
	}
	else
	{
		B_MM_DeSynchronize();
	};
};

func int ZS_MagicFlee_Loop ()
{	
	if (Npc_GetStateTime(self) > SPL_Time_Fear)
	{
		B_StopMagicFlee();
		return LOOP_END;
	};

	Npc_GetTarget (self);
	if (Npc_GetDistToNpc(self,	other) > 2000)
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};

	AI_Flee	(self);
	return LOOP_CONTINUE;
};

func void ZS_MagicFlee_End()
{

};

