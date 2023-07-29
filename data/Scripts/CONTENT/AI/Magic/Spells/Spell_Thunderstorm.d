// ****************
// SPL_Thunderstorm	/K3
// ****************

const int SPL_Cost_Thunderstorm 	= 60;
const int SPL_Damage_Thunderstorm 	= 80; // hits 1 to 4 times


INSTANCE Spell_Thunderstorm  (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_Thunderstorm; 							
	damageType				= DAM_MAGIC;										
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_Thunderstorm	(var int manaInvested)
{
	return Spell_Logic_Basic(self, SPL_Cost_Thunderstorm);
};

func void Spell_Cast_Thunderstorm()
{
	Spell_Cast_Basic(self, SPL_Cost_Thunderstorm);
};




