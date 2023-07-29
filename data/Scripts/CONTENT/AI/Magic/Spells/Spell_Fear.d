// ********
// SPL_Fear
// ********

const int SPL_Cost_Fear			= 100;
const int SPL_TIME_Fear			= 20;

INSTANCE Spell_Fear (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= 0;
	targetCollectAlgo		= TARGET_COLLECT_NONE;	// Opfer werden in der "spell_fear.d" per "AI_SetNpcsToState(self,ZS_Flee, 1000);" bestimmt
};

func int Spell_Logic_Fear (var int manaInvested)
{	
	return Spell_Logic_Basic(self, SPL_Cost_Fear);
};


func void Spell_Cast_Fear()
{
	AI_SetNpcsToState (self, ZS_MagicFlee, 1000); //-kairo

	Spell_Cast_Basic(self, SPL_Cost_Fear);
};
