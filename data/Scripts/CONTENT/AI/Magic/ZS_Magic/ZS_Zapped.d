// **************************************
// B_StopZapped
// ------------
// wird durch Wahrnehmung AssessStopMagic 
// aus ZS_Zapped aufgerufen
// **************************************

const int SPL_ZAPPED_DAMAGE_PER_SEC = 10;
const int SPL_TIME_ZAPPED = 2;

// *****************************************
// ZS_Zapped
// ---------
// NSC wird von SPL_LightningFlash getroffen
// *****************************************

func int ZS_Zapped ()
{
	// ------ Non_interruptable Bodystates stehen sauber auf bzw. beenden sauber
	if (!Npc_HasBodyFlag(self, BS_FLAG_INTERRUPTABLE))
	{
		AI_StandUp (self);
	}
	else
	{
		AI_StandUpQuick (self);
	};
	if (!C_BodyStateContains(self, BS_UNCONSCIOUS)) 
	{
		AI_PlayAniBS (self, "T_STAND_2_LIGHTNING_VICTIM", BS_UNCONSCIOUS);
	};
	B_ClearRuneInv(self);
	
	Wld_PlayEffect ("spellFX_Lightning_TARGET", self, self, 0, 0, 0, FALSE);
	self.aivar[AIV_FreezeStateTime] = 0;
};


func int ZS_Zapped_Loop ()
{	
	if	(!MageStaff_Blades_2H_03_Equipped)
	&&	(self.aivar[AIV_FreezeStateTime] >= SPL_TIME_ZAPPED)
	||	(self.aivar[AIV_FreezeStateTime] >= SPL_TIME_ZAPPED*2)
	{
		return LOOP_END;
	};

	if (Npc_GetStateTime(self) != self.aivar[AIV_FreezeStateTime])
	{
		self.aivar[AIV_FreezeStateTime] = Npc_GetStateTime(self);
		B_MagicHurtNpc(other, self, SPL_ZAPPED_DAMAGE_PER_SEC);
	};
	return LOOP_CONTINUE;
};

func void ZS_Zapped_End()
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
};
