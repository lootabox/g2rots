// ************
// SPL_FireRain
// ************

const int SPL_Cost_FireRain			= 120;
const int SPL_Damage_FireRain 		= 300;


INSTANCE Spell_FireRain (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_FireRain; 							
	damageType				= DAM_MAGIC;										
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_Firerain	(var int manaInvested)
{
	return Spell_Logic_Basic(self, SPL_Cost_FireRain);
};

func void Spell_Cast_Firerain()
{
	Spell_Cast_Basic(self, SPL_Cost_FireRain);
};




