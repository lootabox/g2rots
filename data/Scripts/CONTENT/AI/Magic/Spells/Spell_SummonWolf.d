// **************
// SPL_SummonWolf
// **************

const int SPL_Cost_SummonWolf			= 10;
const int SPL_Duration_SummonWolf		= 10; // MONSTER_SUMMON_TIME


INSTANCE Spell_SummonWolf (C_Spell_Proto)
{
	time_per_mana			= 75;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;	// Do not change.
	targetCollectRange		= 1000;				// Maximum distance (cm) to traverse. Can be freely adjusted.
	targetCollectAzi		= 0;				// Do not display focus names.
	targetCollectElev		= 0;
};

func int Spell_Logic_SummonWolf (var int manaInvested)
{
	return Spell_Logic_Invest_Summon(self, manaInvested, SPL_Cost_SummonWolf);
};

func void Spell_Cast_SummonWolf(var int spellLevel)
{
	Spell_Cast_Summon(self, spellLevel, Wolf, Summoned_Wolf, Summoned_BlackWolf);
};
