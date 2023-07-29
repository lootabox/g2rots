// ******************
// SPL_SummonGuardian	/k3
// ******************

const int SPL_Cost_SummonGuardian			= 60;


INSTANCE Spell_SummonGuardian (C_Spell_Proto)	
{
	time_per_mana			= 25;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;	// Do not change.
	targetCollectRange		= 1000;				// Maximum distance (cm) to traverse. Can be freely adjusted.
	targetCollectAzi		= 0;				// Do not display focus names.
	targetCollectElev		= 0;
};

func int Spell_Logic_SummonGuardian(var int manaInvested)
{
	return Spell_Logic_Invest_Summon(self, manaInvested, SPL_Cost_SummonGuardian);
};

func void Spell_Cast_SummonGuardian(var int spellLevel)
{
	Spell_Cast_Summon(self, spellLevel, Stoneguardian, Summoned_Guardian, Summoned_Guardian);
};
