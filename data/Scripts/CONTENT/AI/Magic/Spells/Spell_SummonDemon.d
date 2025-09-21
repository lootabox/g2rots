// ***************
// SPL_SummonDemon
// ***************

const int SPL_Cost_SummonDemon		= 100;
const int SPL_Duration_SummonDemon	= 20; // MONSTER_SUMMON_TIME


INSTANCE Spell_SummonDemon (C_Spell_Proto)	//ehem. Spell_Demon
{
	time_per_mana			= 12;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;	// Do not change.
	targetCollectRange		= 1000;				// Maximum distance (cm) to traverse. Can be freely adjusted.
	targetCollectAzi		= 0;				// Do not display focus names.
	targetCollectElev		= 0;
};

func int Spell_Logic_SummonDemon(var int manaInvested)
{
	return Spell_Logic_Invest_Summon(self, manaInvested, SPL_Cost_SummonDemon);
};

func void Spell_Cast_SummonDemon(var int spellLevel)
{
	Spell_Cast_Summon(self, spellLevel, Demon, Summoned_Demon_Hostile, Summoned_Demon);
};


