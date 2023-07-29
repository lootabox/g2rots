// *****************
// B_StopMagicFreeze
// *****************

func void B_RestartFreeze()
{
	if (Npc_GetLastHitSpellID(self) == SPL_IceCube)
	|| (Npc_GetLastHitSpellID(self) == SPL_IceWave)
	{
		// Initial state time is set by damage calculation
		Npc_SetStateTime(self, self.aivar[AIV_FreezeStateTime]);
		if		(self.aivar[AIV_FreezeStateTime] == 0)	{ Wld_PlayEffect ("spellFX_IceSpell_Freeze_10", self, self, 0, 0, 0, FALSE); }
		else if	(self.aivar[AIV_FreezeStateTime] == 1)	{ Wld_PlayEffect ("spellFX_IceSpell_Freeze_9", self, self, 0, 0, 0, FALSE); }
		else if	(self.aivar[AIV_FreezeStateTime] == 2)	{ Wld_PlayEffect ("spellFX_IceSpell_Freeze_8", self, self, 0, 0, 0, FALSE); }
		else if	(self.aivar[AIV_FreezeStateTime] == 3)	{ Wld_PlayEffect ("spellFX_IceSpell_Freeze_7", self, self, 0, 0, 0, FALSE); }
		else if	(self.aivar[AIV_FreezeStateTime] == 4)	{ Wld_PlayEffect ("spellFX_IceSpell_Freeze_6", self, self, 0, 0, 0, FALSE); }
		else if	(self.aivar[AIV_FreezeStateTime] == 5)	{ Wld_PlayEffect ("spellFX_IceSpell_Freeze_5", self, self, 0, 0, 0, FALSE); }
		else if	(self.aivar[AIV_FreezeStateTime] == 6)	{ Wld_PlayEffect ("spellFX_IceSpell_Freeze_4", self, self, 0, 0, 0, FALSE); }
		else if	(self.aivar[AIV_FreezeStateTime] == 7)	{ Wld_PlayEffect ("spellFX_IceSpell_Freeze_3", self, self, 0, 0, 0, FALSE); }
		else if	(self.aivar[AIV_FreezeStateTime] == 8)	{ Wld_PlayEffect ("spellFX_IceSpell_Freeze_2", self, self, 0, 0, 0, FALSE); }
		else if	(self.aivar[AIV_FreezeStateTime] == 9)	{ Wld_PlayEffect ("spellFX_IceSpell_Freeze_1", self, self, 0, 0, 0, FALSE); };
	};
};

// **************
// ZS_MagicFreeze
// **************

func int ZS_MagicFreeze()
{
	Npc_PercEnable		(self, PERC_ASSESSMAGIC, B_RestartFreeze); 		// falls ein NSC nochmal von einem Freezespell getroffen wurde, so muss die State Time reseted werden

	//Npc_StopAni(self, "S_FIRE_VICTIM");										// falls der NSC am Zappeln ist, brich die Ani ab

	// Opfer wird in Bodystate Unconscious versetzt
	if (!C_BodyStateContains(self, BS_UNCONSCIOUS)) 
	{
		AI_PlayAniBS 		(self, "T_STAND_2_FREEZE_VICTIM", BS_UNCONSCIOUS);
	};
	B_ClearRuneInv(self);
	B_RestartFreeze();
};



func int ZS_MagicFreeze_Loop ()
{	
	// EXIT LOOP IF...
	if (self.aivar[AIV_FreezeStateTime] >= SPL_FREEZE_TIME)
	{
		return LOOP_END;
	};

	// LOOP FUNC
	if (Npc_GetStateTime(self) != self.aivar[AIV_FreezeStateTime])
	{
		self.aivar[AIV_FreezeStateTime] = Npc_GetStateTime(self);
		B_MagicHurtNpc(other, self, SPL_FREEZE_DAMAGE);
	};

	return LOOP_CONTINUE;
};


func void ZS_MagicFreeze_End()
{
	Npc_PercEnable	(self, PERC_ASSESSMAGIC, B_AssessMagic);
	
	Npc_ClearAIQueue(self);
	AI_StandUp		(self);

	if (self.guild < GIL_SEPERATOR_HUM)
	{
		B_AssessDamage();
	}
	else
	{
		Npc_SetTempAttitude (self, ATT_HOSTILE); //falls nicht schon Gilden-Attitüde hostile ist 
	};
	
	// nach Aufruf dieses Befehles wird die Loop über return LOOP_END beendet
};
