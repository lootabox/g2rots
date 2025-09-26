// ******************
// SPL_SummonSkeleton
// ******************

const int SPL_Cost_SummonSkeleton			= 30;
const int SPL_Duration_SummonSkeleton		= 20; // MONSTER_SUMMON_TIME


INSTANCE Spell_SummonSkeleton (C_Spell_Proto)	//ehem. Spell_Skeleton
{
	time_per_mana			= 33; // 1000/cost
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;	// Do not change.
	targetCollectRange		= 1000;				// Maximum distance (cm) to traverse. Can be freely adjusted.
	targetCollectAzi		= 0;				// Do not display focus names.
	targetCollectElev		= 0;
};

func int Spell_Logic_SummonSkeleton(var int manaInvested)
{
	return Spell_Logic_Invest_Summon(self, manaInvested, SPL_Cost_SummonSkeleton, 2);
};

func void Spell_Cast_SummonSkeleton(var int spellLevel)
{
	if (spellLevel > 1)
	{
		Spell_Cast_Summon(self, Summoned_Skeleton_Evil, Summoned_Skeleton, 1);
	}
	else
	{
		Spell_Cast_Summon(self, Summoned_Skeleton_Evil, Summoned_Lesser_Skeleton, 1);
	};
};
