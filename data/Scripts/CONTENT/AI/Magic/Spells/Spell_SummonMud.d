////////////////////////////////////////////////////////////////////////////////
//
//	The Return of VLK_574_Mud (enjoy the silence remix)
//

const int SPL_Cost_SummonMud = 10;

instance Spell_SummonMud (C_Spell_Proto)
{
	time_per_mana			= 0;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;	// Do not change.
	targetCollectRange		= 1000;				// Maximum distance (cm) to traverse. Can be freely adjusted.
	targetCollectAzi		= 0;				// Do not display focus names.
	targetCollectElev		= 0;
};

func int Spell_Logic_SummonMud(var int manaInvested)
{
	return Spell_Logic_Invest_Summon(self, manaInvested, SPL_Cost_SummonMud, 1);
};

func void Spell_Cast_SummonMud(var int spellLevel)
{
	Spell_Cast_Summon(self, Undead_Mud, Summoned_Mud, 1);
};
