// ***************
// SPL_SummonGolem
// ***************

const int SPL_Cost_SummonGolem		= 50;


INSTANCE Spell_SummonGolem (C_Spell_Proto)	//ehem. Spell_Golem
{
	time_per_mana			= 18;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonGolem (var int manaInvested)
{
	// Only player can awaken golems
	if (!Npc_IsPlayer(self))
	{
		return SPL_SENDSTOP;
	};
	return Spell_Logic_Basic(self, SPL_Cost_SummonGolem);
};

var c_npc BC_AwakenGolem_Closest;
func void BC_AwakenGolem(var C_NPC slf, var C_NPC npc)
{
	// Find nearby dead golems
	if (C_NpcIsGolem (slf))
	&& (Npc_IsDead (slf) == TRUE)
	&& (Npc_GetDistToNpc (slf, npc) < 500)
	{
		// Make sure there isnt already a closer golem
		if (Hlp_IsValidNpc(BC_AwakenGolem_Closest))
		{
			if (Npc_GetDistToNpc (slf, npc) > Npc_GetDistToNpc (BC_AwakenGolem_Closest, npc))
			{
				return;
			};
		};

		// Make sure we have the necessary heart
		if (slf.guild == GIL_STONEGOLEM && !Npc_HasItems(npc, ItAt_StoneGolemHeart))
		|| (slf.guild == GIL_SWAMPGOLEM && !Npc_HasItems(npc, ItAt_SwampGolemHeart))
		|| (slf.guild == GIL_FIREGOLEM && !Npc_HasItems(npc, ItAt_FireGolemHeart))
		|| (slf.guild == GIL_ICEGOLEM && !Npc_HasItems(npc, ItAt_IceGolemHeart))
		{
			return;
		};

		BC_AwakenGolem_Closest = Hlp_GetNpc(slf);
	};
};

func void BC_AwakenGolem_Finish()
{
	if (Hlp_IsValidNpc(BC_AwakenGolem_Closest))
	{
		//Clear AI Queue, just in case!
		NPC_ClearAIQueue (BC_AwakenGolem_Closest);

		// Rename and take resource
		if (BC_AwakenGolem_Closest.guild == GIL_STONEGOLEM) {
			Npc_RemoveInvItems(hero, ItAt_StoneGolemHeart, 1);
			BC_AwakenGolem_Closest.name = "Awakened Stone Golem";
		} else if (BC_AwakenGolem_Closest.guild == GIL_SWAMPGOLEM) {
			Npc_RemoveInvItems(hero, ItAt_SwampGolemHeart, 1);
			BC_AwakenGolem_Closest.name = "Awakened Swamp Golem";
		} else if (BC_AwakenGolem_Closest.guild == GIL_FIREGOLEM) {
			Npc_RemoveInvItems(hero, ItAt_FireGolemHeart, 1);
			BC_AwakenGolem_Closest.name = "Awakened Fire Golem";
		} else if (BC_AwakenGolem_Closest.guild == GIL_ICEGOLEM) {
			Npc_RemoveInvItems(hero, ItAt_IceGolemHeart, 1);
			BC_AwakenGolem_Closest.name = "Awakened Ice Golem";
		};

		// Resurrection!
		BC_AwakenGolem_Closest.attribute[ATR_HITPOINTS] = BC_AwakenGolem_Closest.attribute[ATR_HITPOINTS_MAX];
		AI_PlayAni (BC_AwakenGolem_Closest,"T_RISE");

		// Set as ally of player
		BC_AwakenGolem_Closest.aivar[AIV_PARTYMEMBER] = TRUE;
		Npc_SetTrueGuild(BC_AwakenGolem_Closest, GIL_SUMMONED_GOLEM);
		BC_AwakenGolem_Closest.guild = GIL_SUMMONED_GOLEM;
		B_SetAttitude (BC_AwakenGolem_Closest, ATT_FRIENDLY);

		// Start summon routine
		BC_AwakenGolem_Closest.start_aistate = ZS_MM_Rtn_Summoned;
		AI_StartState(BC_AwakenGolem_Closest, ZS_MM_Rtn_Summoned, 1, "");
	}
	else
	{
		Snd_Play("MFX_QUAKE_EARTHQUAKE");
		var int rand; rand = Hlp_Random(100);
		if 		(rand < 33)	{ Print("The ground shifts nearby..."); }
		else if	(rand < 66)	{ Print("You hear a rumble..."); }
		else				{ Print("The ground shakes..."); };
	};
};

func void Spell_Cast_SummonGolem(var int spellLevel)
{
	Spell_Cast_Basic(self, SPL_Cost_SummonGolem);

	BC_AwakenGolem_Closest = MEM_NullToInst();
	BroadcastEx(self, BC_AwakenGolem, TRUE, TRUE, FALSE);
	FF_ApplyExtGT(BC_AwakenGolem_Finish, 100, 1);
};
