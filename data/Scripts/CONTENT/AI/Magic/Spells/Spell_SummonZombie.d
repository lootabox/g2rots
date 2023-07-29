// ******************
// SPL_SummonZombie		/k4
// ******************

const int SPL_Cost_SummonZombie			= 80;


INSTANCE Spell_SummonZombie (C_Spell_Proto)	
{
	time_per_mana			= 18;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonZombie(var int manaInvested)
{
	// Only player can animate zombies
	if (!Npc_IsPlayer(self))
	{
		return SPL_SENDSTOP;
	};
	return Spell_Logic_Basic(self, SPL_Cost_SummonZombie);
};

func void BC_AnimateZombie_ApplyOverlay ()
{
	var oCNpc slf; slf = _^(ECX);
	Mdl_ApplyOverlayMDS (slf, "HUMANS_ZOMBIE.MDS");
};
func void BC_AnimateZombie(var C_NPC slf, var C_NPC npc)
{
	// Find nearby dead humans
	if (slf.guild < GIL_SEPERATOR_HUM)
	&& (Npc_IsDead (slf) == TRUE)
	&& (Npc_GetDistToNpc (slf, npc) < 500)
	&& (Npc_HasItems(npc, ItMi_OldCoin))
	&& (!C_NpcIsImmuneToMindSpells(slf))
	&& ((slf.flags != NPC_FLAG_IMMORTAL)
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Richter))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_400_Larius))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Cornelius)))
	{
		// Take resource
		Npc_RemoveInvItems(npc, ItMi_OldCoin, 1);

		// We don't want to talk to zombie
		NPC_PercDisable (slf, PERC_ASSESSTALK);

		// Let's get rid of the weapons
		var c_item wpn;
		if (Npc_HasReadiedWeapon(slf))			{ wpn = Npc_GetReadiedWeapon(slf);			Unequip_Item(slf, wpn); };
		if (Npc_HasEquippedMeleeWeapon(slf))	{ wpn = Npc_GetEquippedMeleeWeapon(slf);	Unequip_Item(slf, wpn); };
		if (Npc_HasEquippedRangedWeapon(slf))	{ wpn = Npc_GetEquippedRangedWeapon(slf);	Unequip_Item(slf, wpn); };
		//Npc_SetToFistMode(slf);
		
		// Clear AI Queue, just in case!
		NPC_ClearAIQueue (slf);
		
		// Red aura effect
		Wld_PlayEffect ("spellFX_MassDeath_COLLIDEDYNFX", slf, slf, 0, 0, 0, FALSE);

		// Rename, set zombie attributes and heal
		slf.name = ConcatStrings("Animated ", slf.name);
		if (slf.attribute[ATR_HITPOINTS_MAX] < 150)	{ slf.attribute[ATR_HITPOINTS_MAX] = 150; };
		if (slf.attribute[ATR_STRENGTH] < 75)		{ slf.attribute[ATR_STRENGTH] = 75; };
		if (slf.attribute[ATR_DEXTERITY] < 75)		{ slf.attribute[ATR_DEXTERITY] = 75; };
		if (slf.protection[PROT_BLUNT] < 50)		{ slf.protection[PROT_BLUNT] = 50; };
		if (slf.protection[PROT_EDGE] < 50)			{ slf.protection[PROT_EDGE] = 50; };
		if (slf.protection[PROT_FIRE] < 50)			{ slf.protection[PROT_FIRE] = 50; };
		if (slf.protection[PROT_FLY] < 50)			{ slf.protection[PROT_FLY] = 50; };
		if (slf.protection[PROT_MAGIC] < 50)		{ slf.protection[PROT_MAGIC] = 50; };
		if (slf.protection[PROT_POINT] < 100)		{ slf.protection[PROT_POINT] = 100; };
		slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS_MAX];
		slf.bodyStateInterruptableOverride = TRUE;

		// Play animation - reversal of the one used for dying zombie
		AI_PlayAni (slf, "t_ZDeadB_2_Stand");

		// Apply OverlayMDS
		AI_Function (slf, BC_AnimateZombie_ApplyOverlay);

		// Stand up, just in case
		AI_StandUp (slf);

		// Set as ally of player
		slf.aivar[AIV_PARTYMEMBER] = TRUE;
		Npc_SetTrueGuild(slf, GIL_SUMMONEDZombie);
		slf.guild = GIL_SUMMONEDZombie;
		B_SetAttitude (slf, ATT_FRIENDLY);

		// Override daily NPC routines - otherwise NPC once despawned (if you would run away) would just continue with it's own routine!!
		TA_BeginOverlay (slf);
		TA (slf, 0, 23, ZS_MM_Rtn_Summoned, slf.WP);
		TA_EndOverlay (slf);

		// Start summon routine
		slf.start_aistate = ZS_MM_Rtn_Summoned;
		AI_StartState(slf, ZS_MM_Rtn_Summoned, 1, "");
	};
};

func void Spell_Cast_SummonZombie(var int spellLevel)
{
	Spell_Cast_Basic(self, SPL_Cost_SummonGolem);
	BroadcastEx(self, BC_AnimateZombie, TRUE, TRUE, FALSE);
};
