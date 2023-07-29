// ************************
// SPL_SummonGoblinSkeleton
// ************************

const int SPL_Cost_SummonGoblinSkeleton		= 20;
const int SPL_Duration_SummonGoblinSkeleton	= 10; // MONSTER_SUMMON_TIME


INSTANCE Spell_SummonGoblinSkeleton (C_Spell_Proto)	//ehem. Spell_Skeleton
{
	time_per_mana			= 37;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;	// Do not change.
	targetCollectRange		= 1000;				// Maximum distance (cm) to traverse. Can be freely adjusted.
	targetCollectAzi		= 0;				// Do not display focus names.
	targetCollectElev		= 0;
};

func int Spell_Logic_SummonGoblinSkeleton (var int manaInvested)
{
	return Spell_Logic_Invest_Summon(self, manaInvested, SPL_Cost_SummonGoblinSkeleton);
};

func void Spell_Cast_SummonGoblinSkeleton(var int spellLevel)
{
	Spell_Cast_Summon(self, spellLevel, GOBBO_SKELETON, SUMMONED_GOBBO_SKELETON, SUMMONED_GOBBO_SKELETON);
};
