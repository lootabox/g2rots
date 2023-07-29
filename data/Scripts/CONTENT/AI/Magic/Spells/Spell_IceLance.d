// *************
// SPL_Icelance	/K2
// *************

const int SPL_Cost_Icelance		= 15;
const int SPL_Damage_Icelance	= 80;


INSTANCE Spell_Icelance		(C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_Icelance;
	damageType				= DAM_MAGIC;
};

func int Spell_Logic_Icelance	(var int manaInvested)
{
	return Spell_Logic_Basic(self, SPL_Cost_Icelance);
};

func void Spell_Cast_Icelance()
{
	Spell_Cast_Basic(self, SPL_Cost_Icelance);
};
