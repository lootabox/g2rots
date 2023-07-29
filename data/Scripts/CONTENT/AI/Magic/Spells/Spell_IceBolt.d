// ***********
// SPL_IceBolt
// ***********

const int SPL_Cost_IceBolt		= 6;
const int SPL_Damage_IceBolt 	= 40;



INSTANCE Spell_IceBolt (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_IceBolt;
};

func int Spell_Logic_IceBolt (var int manaInvested)
{
	return Spell_Logic_Basic(self, SPL_Cost_IceBolt);
};

func void Spell_Cast_IceBolt()
{
	Spell_Cast_Basic(self, SPL_Cost_IceBolt);
};
