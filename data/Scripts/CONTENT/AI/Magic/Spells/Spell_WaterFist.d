// *************
// SPL_Waterfist	/k4
// *************

const int SPL_Cost_Waterfist	= 20;
const int SPL_Damage_Waterfist	= 125;


INSTANCE Spell_Waterfist	(C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_Waterfist;
	damageType				= DAM_FLY;
};

func int Spell_Logic_Waterfist	(var int manaInvested)
{
	return Spell_Logic_Basic(self, SPL_Cost_Waterfist);
};

func void Spell_Cast_Waterfist()
{
	Spell_Cast_Basic(self, SPL_Cost_Waterfist);
};
