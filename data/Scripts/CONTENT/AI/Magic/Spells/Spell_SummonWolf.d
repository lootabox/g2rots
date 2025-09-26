// **************
// SPL_SummonWolf
// **************

const int SPL_Cost_SummonWolf			= 10;
const int SPL_Duration_SummonWolf		= 60; // MONSTER_SUMMON_TIME


INSTANCE Spell_SummonWolf (C_Spell_Proto)
{
	time_per_mana			= 100; // 1000/cost
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;	// Do not change.
	targetCollectRange		= 1000;				// Maximum distance (cm) to traverse. Can be freely adjusted.
	targetCollectAzi		= 0;				// Do not display focus names.
	targetCollectElev		= 0;
};

func int Spell_Logic_SummonWolf (var int manaInvested)
{
	return Spell_Logic_Invest_Summon(self, manaInvested, SPL_Cost_SummonWolf, 2);
};

func void Spell_Cast_SummonWolf(var int spellLevel)
{
	if (spellLevel > 1)
	{
		Spell_Cast_Summon(self, Wolf, Summoned_BlackWolf, 1);
	}
	else
	{
		Spell_Cast_Summon(self, Wolf, Summoned_Wolf, 1);
	};
};
