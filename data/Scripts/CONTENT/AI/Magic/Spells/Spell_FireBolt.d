// ************
// SPL_FireBolt
// ************

const int SPL_Cost_Firebolt			= 5;
const int SPL_Damage_Firebolt 		= 30;


INSTANCE Spell_Firebolt (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_Firebolt;
	damageType				= DAM_MAGIC;
};

func int Spell_Logic_Firebolt (var int manaInvested)
{
	return Spell_Logic_Basic(self, SPL_Cost_Firebolt);
};

func void Spell_Cast_Firebolt()
{
	Spell_Cast_Basic(self, SPL_Cost_Firebolt);
};
